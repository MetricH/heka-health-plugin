package com.heka.health.heka_health

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
import com.google.android.gms.auth.api.signin.GoogleSignIn
import com.google.android.gms.fitness.Fitness
import com.google.android.gms.fitness.FitnessActivities
import com.google.android.gms.fitness.FitnessOptions
import com.google.android.gms.fitness.data.*
import com.google.android.gms.fitness.request.DataDeleteRequest
import com.google.android.gms.fitness.request.DataReadRequest
import com.google.android.gms.fitness.request.SessionInsertRequest
import com.google.android.gms.fitness.request.SessionReadRequest
import com.google.android.gms.fitness.result.DataReadResponse
import com.google.android.gms.fitness.result.SessionReadResponse
import com.google.android.gms.tasks.OnFailureListener
import com.google.android.gms.tasks.OnSuccessListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.plugin.common.PluginRegistry.Registrar
import kotlinx.coroutines.*
import java.time.*
import java.time.temporal.ChronoUnit
import java.util.*
import java.util.concurrent.*


const val GOOGLE_FIT_PERMISSIONS_REQUEST_CODE = 1111
const val HEALTH_CONNECT_RESULT_CODE = 16969
const val CHANNEL_NAME = "heka_health"
const val MMOLL_2_MGDL = 18.0 // 1 mmoll= 18 mgdl

// The minimum android level that can use Health Connect
const val MIN_SUPPORTED_SDK = Build.VERSION_CODES.O_MR1

class HekaHealthPlugin(private var channel: MethodChannel? = null) :
    MethodCallHandler,
    ActivityResultListener,
    Result,
    ActivityAware,
    FlutterPlugin {
    private var mResult: Result? = null
    private var handler: Handler? = null
    private var activity: Activity? = null
    private var context: Context? = null
    private var threadPoolExecutor: ExecutorService? = null
    private var useHealthConnectIfAvailable: Boolean = false
    // private lateinit var healthConnectClient: HealthConnectClient
    private lateinit var scope: CoroutineScope

    private var BODY_FAT_PERCENTAGE = "BODY_FAT_PERCENTAGE"
    private var HEIGHT = "HEIGHT"
    private var WEIGHT = "WEIGHT"
    private var STEPS = "STEPS"
    private var AGGREGATE_STEP_COUNT = "AGGREGATE_STEP_COUNT"
    private var ACTIVE_ENERGY_BURNED = "ACTIVE_ENERGY_BURNED"
    private var HEART_RATE = "HEART_RATE"
    private var BODY_TEMPERATURE = "BODY_TEMPERATURE"
    private var BLOOD_PRESSURE_SYSTOLIC = "BLOOD_PRESSURE_SYSTOLIC"
    private var BLOOD_PRESSURE_DIASTOLIC = "BLOOD_PRESSURE_DIASTOLIC"
    private var BLOOD_OXYGEN = "BLOOD_OXYGEN"
    private var BLOOD_GLUCOSE = "BLOOD_GLUCOSE"
    private var MOVE_MINUTES = "MOVE_MINUTES"
    private var DISTANCE_DELTA = "DISTANCE_DELTA"
    private var WATER = "WATER"
    private var RESTING_HEART_RATE = "RESTING_HEART_RATE"
    private var BASAL_ENERGY_BURNED = "BASAL_ENERGY_BURNED"
    private var FLIGHTS_CLIMBED = "FLIGHTS_CLIMBED"
    private var RESPIRATORY_RATE = "RESPIRATORY_RATE"

    // TODO support unknown?
    private var SLEEP_ASLEEP = "SLEEP_ASLEEP"
    private var SLEEP_AWAKE = "SLEEP_AWAKE"
    private var SLEEP_IN_BED = "SLEEP_IN_BED"
    private var SLEEP_SESSION = "SLEEP_SESSION"
    private var SLEEP_LIGHT = "SLEEP_LIGHT"
    private var SLEEP_DEEP = "SLEEP_DEEP"
    private var SLEEP_REM = "SLEEP_REM"
    private var SLEEP_OUT_OF_BED = "SLEEP_OUT_OF_BED"
    private var WORKOUT = "WORKOUT"
    private var NUTRITION = "NUTRITION"
    private var BREAKFAST = "BREAKFAST"
    private var LUNCH = "LUNCH"
    private var DINNER = "DINNER"
    private var SNACK = "SNACK"
    private var MEAL_UNKNOWN = "UNKNOWN"

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        scope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL_NAME)
        channel?.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
        threadPoolExecutor = Executors.newFixedThreadPool(4)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = null
        activity = null
        threadPoolExecutor!!.shutdown()
        threadPoolExecutor = null
    }

    override fun success(p0: Any?) {
        handler?.post { mResult?.success(p0) }
    }

    override fun notImplemented() {
        handler?.post { mResult?.notImplemented() }
    }

    override fun error(
        errorCode: String,
        errorMessage: String?,
        errorDetails: Any?,
    ) {
        handler?.post { mResult?.error(errorCode, errorMessage, errorDetails) }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode == GOOGLE_FIT_PERMISSIONS_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                Log.i("MetricHealth", "Access Granted!")
                mResult?.success(true)
            } else if (resultCode == Activity.RESULT_CANCELED) {
                Log.i("MetricHealth", "Access Denied!")
                mResult?.success(false)
            }
        }
        return false
    }


    private fun keyToHealthDataType(type: String): DataType {
        return when (type) {
            BODY_FAT_PERCENTAGE -> DataType.TYPE_BODY_FAT_PERCENTAGE
            HEIGHT -> DataType.TYPE_HEIGHT
            WEIGHT -> DataType.TYPE_WEIGHT
            STEPS -> DataType.TYPE_STEP_COUNT_DELTA
            AGGREGATE_STEP_COUNT -> DataType.AGGREGATE_STEP_COUNT_DELTA
            ACTIVE_ENERGY_BURNED -> DataType.TYPE_CALORIES_EXPENDED
            HEART_RATE -> DataType.TYPE_HEART_RATE_BPM
            BODY_TEMPERATURE -> HealthDataTypes.TYPE_BODY_TEMPERATURE
            BLOOD_PRESSURE_SYSTOLIC -> HealthDataTypes.TYPE_BLOOD_PRESSURE
            BLOOD_PRESSURE_DIASTOLIC -> HealthDataTypes.TYPE_BLOOD_PRESSURE
            BLOOD_OXYGEN -> HealthDataTypes.TYPE_OXYGEN_SATURATION
            BLOOD_GLUCOSE -> HealthDataTypes.TYPE_BLOOD_GLUCOSE
            MOVE_MINUTES -> DataType.TYPE_MOVE_MINUTES
            DISTANCE_DELTA -> DataType.TYPE_DISTANCE_DELTA
            WATER -> DataType.TYPE_HYDRATION
            SLEEP_ASLEEP -> DataType.TYPE_SLEEP_SEGMENT
            SLEEP_AWAKE -> DataType.TYPE_SLEEP_SEGMENT
            SLEEP_IN_BED -> DataType.TYPE_SLEEP_SEGMENT
            WORKOUT -> DataType.TYPE_ACTIVITY_SEGMENT
            NUTRITION -> DataType.TYPE_NUTRITION
            else -> throw IllegalArgumentException("Unsupported dataType: $type")
        }
    }

    private fun getField(type: String): Field {
        return when (type) {
            BODY_FAT_PERCENTAGE -> Field.FIELD_PERCENTAGE
            HEIGHT -> Field.FIELD_HEIGHT
            WEIGHT -> Field.FIELD_WEIGHT
            STEPS -> Field.FIELD_STEPS
            ACTIVE_ENERGY_BURNED -> Field.FIELD_CALORIES
            HEART_RATE -> Field.FIELD_BPM
            BODY_TEMPERATURE -> HealthFields.FIELD_BODY_TEMPERATURE
            BLOOD_PRESSURE_SYSTOLIC -> HealthFields.FIELD_BLOOD_PRESSURE_SYSTOLIC
            BLOOD_PRESSURE_DIASTOLIC -> HealthFields.FIELD_BLOOD_PRESSURE_DIASTOLIC
            BLOOD_OXYGEN -> HealthFields.FIELD_OXYGEN_SATURATION
            BLOOD_GLUCOSE -> HealthFields.FIELD_BLOOD_GLUCOSE_LEVEL
            MOVE_MINUTES -> Field.FIELD_DURATION
            DISTANCE_DELTA -> Field.FIELD_DISTANCE
            WATER -> Field.FIELD_VOLUME
            SLEEP_ASLEEP -> Field.FIELD_SLEEP_SEGMENT_TYPE
            SLEEP_AWAKE -> Field.FIELD_SLEEP_SEGMENT_TYPE
            SLEEP_IN_BED -> Field.FIELD_SLEEP_SEGMENT_TYPE
            WORKOUT -> Field.FIELD_ACTIVITY
            NUTRITION -> Field.FIELD_NUTRIENTS
            else -> throw IllegalArgumentException("Unsupported dataType: $type")
        }
    }

    private fun isIntField(dataSource: DataSource, unit: Field): Boolean {
        val dataPoint = DataPoint.builder(dataSource).build()
        val value = dataPoint.getValue(unit)
        return value.format == Field.FORMAT_INT32
    }

    // / Extracts the (numeric) value from a Health Data Point
    private fun getHealthDataValue(dataPoint: DataPoint, field: Field): Any {
        val value = dataPoint.getValue(field)
        // Conversion is needed because glucose is stored as mmoll in Google Fit;
        // while mgdl is used for glucose in this plugin.
        val isGlucose = field == HealthFields.FIELD_BLOOD_GLUCOSE_LEVEL
        return when (value.format) {
            Field.FORMAT_FLOAT -> if (!isGlucose) value.asFloat() else value.asFloat() * MMOLL_2_MGDL
            Field.FORMAT_INT32 -> value.asInt()
            Field.FORMAT_STRING -> value.asString()
            else -> Log.e("Unsupported format:", value.format.toString())
        }
    }

    private fun errHandler(result: Result, addMessage: String) = OnFailureListener { exception ->
        Handler(context!!.mainLooper).run { result.success(null) }
        Log.w("MetricHealth::ERROR", addMessage)
        Log.w("MetricHealth::ERROR", exception.message ?: "unknown error")
        Log.w("MetricHealth::ERROR", exception.stackTrace.toString())
    }

    private fun callToHealthTypes(call: MethodCall): FitnessOptions {
        val typesBuilder = FitnessOptions.builder()
        val args = call.arguments as HashMap<*, *>
        val types = (args["types"] as? ArrayList<*>)?.filterIsInstance<String>()
        val permissions = (args["permissions"] as? ArrayList<*>)?.filterIsInstance<Int>()

        assert(types != null)
        assert(permissions != null)
        assert(types!!.count() == permissions!!.count())

        for ((i, typeKey) in types.withIndex()) {
            val access = permissions[i]
            val dataType = keyToHealthDataType(typeKey)
            when (access) {
                0 -> typesBuilder.addDataType(dataType, FitnessOptions.ACCESS_READ)
                1 -> typesBuilder.addDataType(dataType, FitnessOptions.ACCESS_WRITE)
                2 -> {
                    typesBuilder.addDataType(dataType, FitnessOptions.ACCESS_READ)
                    typesBuilder.addDataType(dataType, FitnessOptions.ACCESS_WRITE)
                }

                else -> throw IllegalArgumentException("Unknown access type $access")
            }
            if (typeKey == SLEEP_ASLEEP || typeKey == SLEEP_AWAKE || typeKey == SLEEP_IN_BED) {
                typesBuilder.accessSleepSessions(FitnessOptions.ACCESS_READ)
                when (access) {
                    0 -> typesBuilder.accessSleepSessions(FitnessOptions.ACCESS_READ)
                    1 -> typesBuilder.accessSleepSessions(FitnessOptions.ACCESS_WRITE)
                    2 -> {
                        typesBuilder.accessSleepSessions(FitnessOptions.ACCESS_READ)
                        typesBuilder.accessSleepSessions(FitnessOptions.ACCESS_WRITE)
                    }

                    else -> throw IllegalArgumentException("Unknown access type $access")
                }
            }
            if (typeKey == WORKOUT) {
                when (access) {
                    0 -> typesBuilder.accessActivitySessions(FitnessOptions.ACCESS_READ)
                    1 -> typesBuilder.accessActivitySessions(FitnessOptions.ACCESS_WRITE)
                    2 -> {
                        typesBuilder.accessActivitySessions(FitnessOptions.ACCESS_READ)
                        typesBuilder.accessActivitySessions(FitnessOptions.ACCESS_WRITE)
                    }

                    else -> throw IllegalArgumentException("Unknown access type $access")
                }
            }
        }
        return typesBuilder.build()
    }

    private fun hasPermissions(call: MethodCall, result: Result) {
        if (context == null) {
            result.success(false)
            return
        }

        val optionsToRegister = callToHealthTypes(call)

        val isGranted = GoogleSignIn.hasPermissions(
            GoogleSignIn.getLastSignedInAccount(context!!),
            optionsToRegister,
        )

        result?.success(isGranted)
    }

    /**
     * Requests authorization for the HealthDataTypes
     * with the the READ or READ_WRITE permission type.
     */
    private fun requestAuthorization(call: MethodCall, result: Result) {
        if (context == null) {
            result.success(false)
            return
        }
        mResult = result

        // TODO: this should be dynamic based on parameters passed
        val optionsToRegister = FitnessOptions.builder()
            .addDataType(DataType.TYPE_STEP_COUNT_DELTA, FitnessOptions.ACCESS_READ)
            .addDataType(DataType.TYPE_STEP_COUNT_DELTA, FitnessOptions.ACCESS_WRITE)
            .build()

        val isGranted = false

        // If not granted then ask for permission
        if (!isGranted && activity != null) {
            GoogleSignIn.requestPermissions(
                activity!!,
                GOOGLE_FIT_PERMISSIONS_REQUEST_CODE,
                GoogleSignIn.getLastSignedInAccount(context!!),
                optionsToRegister,
            )
        } else { // / Permission already granted
            result?.success(true)
        }
    }

    /**
     * Revokes access to Google Fit using the `disableFit`-method.
     *
     * Note: Using the `revokeAccess` creates a bug on android
     * when trying to reapply for permissions afterwards, hence
     * `disableFit` was used.
     */
    private fun revokePermissions(call: MethodCall, result: Result) {
        if (context == null) {
            result.success(false)
            return
        }
        Fitness.getConfigClient(activity!!, GoogleSignIn.getLastSignedInAccount(context!!)!!)
            .disableFit()
            .addOnSuccessListener {
                result.success(true)
            }
            .addOnFailureListener { e ->
                result.success(false)
            }
    }

    private fun getDateWiseData(call: MethodCall, result: Result) {
        val start = call.argument<Long>("startTime")!!
        val end = call.argument<Long>("endTime")!!

        val context = context ?: return

        // TODO: this should be dynamic based on parameters passed
        val stepsDataType = keyToHealthDataType(STEPS)
        val aggregatedDataType = keyToHealthDataType(AGGREGATE_STEP_COUNT)

        val fitnessOptions = FitnessOptions.builder()
            .addDataType(stepsDataType)
            .addDataType(aggregatedDataType)
            .build()
        val gsa = GoogleSignIn.getAccountForExtension(context, fitnessOptions)

        val ds = DataSource.Builder()
            .setAppPackageName("com.google.android.gms")
            .setDataType(stepsDataType)
            .setType(DataSource.TYPE_DERIVED)
            // TODO: this should be dynamic based on parameters passed
            .setStreamName("estimated_steps")
            .build()

        val request = DataReadRequest.Builder()
            .aggregate(ds)
            .bucketByTime(1, TimeUnit.DAYS)
            .setTimeRange(start, end, TimeUnit.MILLISECONDS)
            .build()

        Fitness.getHistoryClient(context, gsa).readData(request)
            .addOnFailureListener(
                errHandler(
                    result,
                    "There was an error getting the total steps in the interval!",
                ),
            )
            .addOnSuccessListener(
                threadPoolExecutor!!,
                getDataInRange(start, end, aggregatedDataType, result),
            )
    }

    private fun getDataInRange(
        start: Long,
        end: Long,
        aggregatedDataType: DataType,
        result: Result,
    ) =
        OnSuccessListener { response: DataReadResponse ->
            val map = HashMap<Long, Int>() // need to return to Dart so can't use sparse array
            for (bucket in response.buckets) {
                val dp = bucket.dataSets.firstOrNull()?.dataPoints?.firstOrNull()
                if (dp != null) {
                    val count = dp.getValue(aggregatedDataType.fields[0])

                    val startTime = dp.getStartTime(TimeUnit.MILLISECONDS)
                    val startDate = Date(startTime)
                    val endDate = Date(dp.getEndTime(TimeUnit.MILLISECONDS))
                    map[startTime] = count.asInt()
                } else {
                    val startDay = Date(start)
                    val endDay = Date(end)
                }
            }
            Handler(context!!.mainLooper).run {
                result.success(map)
            }
        }

    /**
     *  Handle calls from the MethodChannel
     */
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "hasPermissions" -> hasPermissions(call, result)
            "requestAuthorization" -> requestAuthorization(call, result)
            "revokePermissions" -> revokePermissions(call, result)
            "getDateWiseData" -> getDateWiseData(call, result)
            else -> result.notImplemented()
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        if (channel == null) {
            return
        }
        binding.addActivityResultListener(this)
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        if (channel == null) {
            return
        }
        activity = null
    }
}