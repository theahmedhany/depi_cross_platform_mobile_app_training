# Week 15: Firebase Cloud Messaging (FCM) Flutter App

A comprehensive Flutter application demonstrating **Firebase Cloud Messaging (FCM)** integration with beautiful UI and local notifications support.

## 📱 Screenshots & Features

### ✨ Key Features

- **Real-time Push Notifications** - Receive notifications even when app is closed
- **Beautiful Modern UI** - Clean, gradient-based design with smooth animations
- **Topic Subscription Management** - Subscribe/unsubscribe from notification topics
- **Local Notifications** - Display notifications with images and custom styling
- **FCM Token Management** - View and copy device-specific FCM tokens
- **Background/Foreground Handling** - Proper notification handling in all app states
- **Cross-Platform Support** - Works on Android, iOS, Web, macOS, Linux, and Windows

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/790dc42c-dbab-45f8-8c66-65cde2484e30" alt="Home Screen" width="300"/></td>
  </tr>
</table>

### 🎨 UI Highlights

- Gradient app bar with modern design
- Animated notification icon with pulse effect
- Status cards showing subscription state
- Action buttons for easy interaction
- Token display with monospace font
- Informational cards with helpful tips
- Smooth animations and transitions

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/b6fb34cd-1a0e-4008-af6d-a18c60b2f031" alt="Home Screen Notification" width="300"/></td>
    <td><img src="https://github.com/user-attachments/assets/589f2ea6-1392-4801-b88d-cc896c4e5f5f" alt="Notification Received" width="300"/></td>
  </tr>
</table>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Firebase project setup
- Android Studio / VS Code
- Physical device or emulator for testing

### 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^4.1.0 # Firebase core functionality
  firebase_messaging: ^16.0.1 # FCM implementation
  flutter_local_notifications: ^19.4.1 # Local notification display
  http: ^1.5.0 # HTTP requests for images
  permission_handler: ^12.0.1 # Handle device permissions
  cupertino_icons: ^1.0.8 # iOS-style icons
```

### 🔧 Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd week_15
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   - Create a new Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add your Flutter app to the Firebase project
   - Download configuration files:
     - `google-services.json` for Android (place in `android/app/`)
     - `GoogleService-Info.plist` for iOS (place in `ios/Runner/`)
   - Enable Cloud Messaging in Firebase Console

4. **Configure FlutterFire**

   ```bash
   # Install Firebase CLI
   npm install -g firebase-tools

   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli

   # Configure Firebase for your app
   flutterfire configure
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point with Firebase initialization
├── firebase_options.dart             # Auto-generated Firebase configuration
├── screens/
│   └── home_screen.dart              # Main UI screen with FCM features
└── services/
    ├── push_notifications_service.dart    # FCM service implementation
    └── local_notifications_service.dart   # Local notifications handling
```

### 📁 Key Files Explained

#### `main.dart`

- Initializes Firebase with platform-specific options
- Sets up notification services before app launch
- Configures the main MaterialApp

#### `push_notifications_service.dart`

- Handles FCM token generation and refresh
- Manages topic subscriptions
- Processes background and foreground messages
- Implements permission requests

#### `local_notifications_service.dart`

- Displays local notifications with custom styling
- Handles notification taps and navigation
- Supports rich notifications with images
- Manages notification channels and settings

#### `home_screen.dart`

- Beautiful, responsive UI with modern design
- Real-time FCM token display
- Subscription management controls
- Animated elements and smooth transitions

## 🔔 Notification Flow

### 1. App Initialization

```dart
// Firebase initialization
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Service initialization
await Future.wait([
  PushNotificationsService.init(),
  LocalNotificationService.init(),
]);
```

### 2. Permission Handling

- Automatically requests notification permissions
- Handles permission states gracefully
- Provides user feedback for permission status

### 3. Token Management

- Generates unique FCM token for device
- Listens for token refresh events
- Sends tokens to server (logging implementation)

### 4. Message Handling

#### Background Messages

```dart
FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
```

#### Foreground Messages

```dart
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  LocalNotificationService.showBasicNotification(message);
});
```

### 5. Topic Subscriptions

- Subscribe to 'all' topic by default
- Allow users to manage subscriptions
- Provide visual feedback for subscription changes

## 🎯 Testing Notifications

### Method 1: Firebase Console

1. Go to Firebase Console → Cloud Messaging
2. Click "Send your first message"
3. Enter notification title and body
4. Target: Select your app
5. Send test message

### Method 2: cURL Command

```bash
curl -X POST https://fcm.googleapis.com/fcm/send \
  -H "Authorization: key=YOUR_SERVER_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "to": "DEVICE_FCM_TOKEN",
    "notification": {
      "title": "Test Notification",
      "body": "This is a test message from cURL"
    }
  }'
```

### Method 3: Topic Messaging

```bash
curl -X POST https://fcm.googleapis.com/fcm/send \
  -H "Authorization: key=YOUR_SERVER_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "to": "/topics/all",
    "notification": {
      "title": "Topic Notification",
      "body": "Message sent to all subscribers"
    }
  }'
```

## 🎨 UI Components

### Gradient App Bar

- Beautiful gradient from indigo to purple
- Clean typography with proper spacing
- Centered title with professional styling

### Welcome Card

- Animated notification icon with pulse effect
- Gradient background matching app theme
- Clear messaging about app functionality

### Status Display

- Real-time subscription status
- Color-coded indicators (green/red)
- Descriptive text for user clarity

### Action Buttons

- Subscribe/Unsubscribe toggle with dynamic styling
- Copy token functionality with user feedback
- Consistent Material Design principles

### Token Display

- Monospace font for better readability
- Scrollable container for long tokens
- Professional styling with subtle borders

## 🔧 Customization

### Changing App Theme

```dart
// In main.dart MaterialApp
theme: ThemeData(
  primarySwatch: Colors.blue,
  // Add your custom theme here
),
```

### Custom Notification Icons

- Replace `@mipmap/ic_launcher` in local notifications service
- Add custom icons to `android/app/src/main/res/` directories
- Update iOS notification icons in `ios/Runner/Assets.xcassets/`

### Notification Sounds

```dart
// Custom sound in AndroidNotificationDetails
sound: RawResourceAndroidNotificationSound('notification_sound'),
```

---
