# HekaHealth

Integrate Google Fit, Apple Healthkit and other fitness data sources in your app with just 4 lines of code.

Integrating health data from smart watches is not easy and requires understanding how various smart watches and operating systems work. On top of that, the way to get data reliability from different sources is different with data format also being different.

The Heka smartwatch integration makes it easy to integrate various watches and reliably get data on the server. With a couple of one-time setup steps, 4 lines of code and you have integrated all smart devices into your product.

## Registering

Heka provides every app with a unique key to use the SDK. To generate your unique key, do the following steps:

1. Create an account on our web app at [HekaHealth Dashboard](https://appdev.hekahealth.co).

2. Click on `Create Application` to register your app.

3. Once the app is created, click on `Generate key` and you will get the unique key for your app.

The key will be required when integrating the SDK in the app in the `Usage` step.

## Setup

### Google Fit

Note: Google fit is only supported on Android devices for now.

#### 1) Google Client Id

To enable Google Fit, you need to provide the Google Client ID generated for your app. The Client ID can be set using the edit app option in the Heka dashboard or when creating a new app.

To get the Google Client ID, follow this guide at [Get an OAuth 2.0 Client ID | Google Fit](https://developers.google.com/fit/android/get-api-key). It will be of the format ``YOUR_CLIENT_ID.apps.googleusercontent.com``

#### 2) Redirect URI

Redirect URI needs to be set up so that the application is opened successfully post Google Auth. Make the following changes to `android/app/src/main/AndroidManifest.xml` file:

```xml
...
    <application
        ...
        ...
        # Add the line below
        xmlns:tools="http://schemas.android.com/tools"
    >
        ...
        ...
        # Add this whole activity
        <activity
          android:name="net.openid.appauth.RedirectUriReceiverActivity"
          android:exported="true"
          tools:node="replace">
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data
                  android:scheme="com.googleusercontent.apps.<YOUR_GOOGLE_CLIENT_ID>"
                />
            </intent-filter>
        </activity>
    </application>
```
There are other simpler ways to set up app redirect URLs, however, this method is recommended to support multiple redirect URLs for various platforms like Fitbit, Strava etc.

### Apple Healthkit

Note: This is only supported on iOS.

1) Append the `Info.plist` with the following 2 entries:

```swift
<key>NSHealthShareUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
<key>NSHealthUpdateUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
```
2) Enabling HealthKit requires the following two steps in `Xcode`:

    * Go to the `Signing & Capabilities` tab of the Runner target's settings and add the `HealthKit` capability.
    * Enable the background delivery option for `HealthKit`.



3) To make sure that health data is being synced even while on background, initialize the sync observers in `application:didFinishLaunchingWithOptions` method of `AppDelegate.swift`:

```swift
import heka     // Make sure you import Heka

// ...

func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // ....
    HekaManager().installObservers()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
```

## Usage

```dart
static const _apiKey = ‘YOUR_API_KEY’;

final _userUuid = 'some-user-id';

@override
Widget build(BuildContext context) {
return HekaHealthWidget(
    apiKey: _apiKey,
    userUuid: _userUuid,
);
```

The `userUuid` is a unique user identifier that you use across your app. We don't store any user personal information of your users and will link their health data to this uuid.

## Getting the data

The collected data is unified in a single format and sent to the webhook URL configured while registering the app on our dashboard. Check out our relevant [documentation](https://heka-health.notion.site/Getting-data-on-the-server-Heka-94ae2c8228ad426c9a45f3ac1d7312fe).


## FAQs

**Q.** If the user denies Apple Healthkit permission, it doesn't show any error and connects. Shouldn't it prevent connecting and show an error message about permission not granted?

**Ans.** Unfortunately, Apple Healthkit provides no way to detect if a user has granted permission or not due to privacy reasons. The queries that get data from Healthkit don't return an error and rather return an empty list if permissions are not granted.
We think the best way to handle this is to ask users to make sure permissions are granted from the health app if data is not getting synced.