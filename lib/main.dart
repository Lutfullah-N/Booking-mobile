import 'package:booking/features/auth/controller/email_verification.dart';
import 'package:booking/features/auth/screens/log_in.dart';
import 'package:booking/features/home/screens/home_page.dart';
import 'package:booking/firebase_options.dart';
import 'package:booking/routes/app_routes.dart';
// import 'package:booking/features/home/screens/notificaion_screen.dart';
// import 'package:booking/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// void requestNotificationPermission() async {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );
//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     const Text('User granted permission');
//   } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     const Text('User granted provisional permission');
//   } else {
//     const Text('User declined or has not accepted permission');
//   }
// }

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling background message: ${message.messageId}');
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // String? token = await FirebaseMessaging.instance.getToken();
  // print('FCM Token: $token');
  // await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcomePage,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.from(
                alpha: 1, red: 0.404, green: 0.227, blue: 0.718)),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const LoginPage();
        }
        if (!user.emailVerified) {
          return const EmailVerification();
        }
        return HomePage();
      },
    );
  }
}
