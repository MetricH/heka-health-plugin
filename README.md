# HekaHealth

Integrate Google Fit, Apple Healthkit and other fitness data sources in your app with just 4 lines of code.

Integrating health data from smart watches is not easy and requires understanding how various smart watches and operating systems work. On top of that, the way to get data reliability from different sources is different with data format also being different.

The Heka smartwatch integration makes it easy to integrate various watches and reliably get data on the server. With a couple of one-time setup steps, 4 lines of code and you have integrated all smart devices into your product.

## Setup

### Generating the key

1. Create an account on our web app at [HekaHealth Dashboard](https://appdev.hekahealth.co).

2. Register your application.

3. If you are also planning to use the HekaHealth for Android Platform, then it is mandatory to provide the Google Client ID field, which you can add either during the app creation or while editing the app.
    To get the Google Client ID, follow this guide at [Get an OAuth 2.0 Client ID | Google Fit](https://developers.google.com/fit/android/get-api-key)
   It will of the format ``YOUR_CLIENT_ID.apps.googleusercontent.com``

4. Creating an app will provide you with an HekaHealth API Key. This you will require when integrating the HekaHealth SDK on the app side.

That’s all you need to do on the admin side.

### iOS

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
    return true
}
```

## Usage

See the example app for detailed examples of how to use the HekaHealth SDK.

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

## Getting the data

The collected data is unified in a single format and sent to the webhook URL configured while registering the app on our dashboard.


## FAQs

**Q.** If the user denies Apple Healthkit permission, it doesn't show any error and connects. Shouldn't it prevent connecting and show an error message about permission not granted?

**Ans.** Unfortunately, Apple Healthkit provides no way to detect if a user has granted permission or not due to privacy reasons. The queries that get data from Healthkit don't return an error and rather return an empty list if permissions are not granted.
We think the best way to handle this is to ask users to make sure permissions are granted from the health app if data is not getting synced.