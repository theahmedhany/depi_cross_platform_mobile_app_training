import 'dart:developer';

import 'package:fcm/services/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    // Permissions
    await messaging.requestPermission();

    // Get token and send to server
    await messaging.getToken().then((value) {
      sendTokenToServer(value!);
    });

    // Token refresh listener
    messaging.onTokenRefresh.listen((value) {
      sendTokenToServer(value);
    });

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Foreground message handler
    handleForegroundMessage();

    // Subscribe to topic
    messaging.subscribeToTopic('all').then((value) {
      log('Subscribed to all topic.');
    });

    // messaging.unsubscribeFromTopic('all').then((value) {
    //   log('Unsubscribed from all topic.');
    // });
  }

  // When app is in background or terminated
  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  // When app is in foreground
  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // show local notification
      LocalNotificationService.showBasicNotification(message);
    });
  }

  // Send token to server
  static void sendTokenToServer(String token) {
    // option 1 => API
    // option 2 => Firebase
    log('Token: $token');
  }
}
