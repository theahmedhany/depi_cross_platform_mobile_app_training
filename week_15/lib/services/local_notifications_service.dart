import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  // Singleton pattern
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Stream controller for notification taps
  static StreamController<NotificationResponse> streamController =
      StreamController();

  // Handle notification tap
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

  // Initialization
  static Future init() async {
    // Android initialization settings
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    // Initialize the plugin
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  // Basic Notification
  static void showBasicNotification(RemoteMessage message) async {
    // Fetch the image
    final http.Response image = await http.get(
      Uri.parse(
        message.notification?.android?.imageUrl ??
            'https://api.duniagames.co.id/api/content/upload/file/640705801664566240.jpg',
      ),
    );

    // Show the notification with the fetched image
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
          largeIcon: ByteArrayAndroidBitmap.fromBase64String(
            base64Encode(image.bodyBytes),
          ),
        );

    // Create the Android notification details
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(
        'long_notification_sound'.split('.').first,
      ),
    );

    // Create the notification details
    NotificationDetails details = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
    );
  }
}
