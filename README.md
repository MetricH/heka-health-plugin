# HekaHealth

Integrating health data from smart watches is not easy and requires understanding how various smart watches and operating systems work. On top of that, the way to get data reliability from different sources is different with data format also being different.

The Heka smartwatch integration makes it easy to integrate various watches and reliably get data on the server. With a couple of one-time setup steps, 3 lines of code and you have integrated all smart devices into your product. |

## Setup

### Dashboard

1. Create an account on our web app at [HekaHealth Dashboard](https://appdev.hekahealth.co).

2. Register your application.

3. If you are also planning to use the HekaHealth for Android Platform, then it is mandatory to provide the Google Client ID field, which you can add either during the app creation or while editing the app.
   In order to get the Google Client ID, follow this guide at [Get an OAuth 2.0 Client ID | Google Fit](https://developers.google.com/fit/android/get-api-key)
   It will look something like: YOUR_CLIENT_ID.apps.googleusercontent.com

4. Creating an app will provide you with an HekaHealth API Key. This you will require when integrating the HekaHealth SDK on the app side.

That’s all you need to do on the admin side.

### iOS

Step 1: Append the Info.plist with the following 2 entries

```xml
<key>NSHealthShareUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
<key>NSHealthUpdateUsageDescription</key>
<string>We will sync your data with the Apple Health app to give you better insights</string>
```

Step 2: Open your Flutter project in Xcode by right clicking on the "ios" folder and selecting "Open in Xcode". Next, enable "HealthKit" by adding a capability inside the "Signing & Capabilities" tab of the Runner target's settings.

### Android

For android we need to do the appAuthRedirectScheme setup for Google OAuth to work properly. Just add the following entries in the android/app/build.gradle file.

```
defaultConfig {
    applicationId “com.hekahealth.example”
…
    manifestPlaceholders += [
        ‘appAuthRedirectScheme’: ‘com.googleusercontent.apps.<ANDROID-CLIENT-ID>’
    ]
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
