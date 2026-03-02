import 'package:booking/features/auth/controller/email_verification.dart';
import 'package:booking/features/auth/screens/log_in.dart';
import 'package:booking/features/home/screens/home_page.dart';
import 'package:booking/firebase_options.dart';
import 'package:booking/l10n/app_localizations.dart';
import 'package:booking/l10n/language_provider.dart';
import 'package:booking/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final languageProvider = LanguageProvider();
  await languageProvider.loadLocale();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // String? token = await FirebaseMessaging.instance.getToken();
  // print('FCM Token: $token');
  // await NotificationService.init();
  runApp(ChangeNotifierProvider.value(
    value: languageProvider,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: languageProvider.locale,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('fa'), // Dari
        Locale('ps'), // Pashto
        Locale('nl'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(103, 58, 183, 1))),
      initialRoute: AppRoutes.welcomePage,
      onGenerateRoute: AppRoutes.generateRoute,
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


// https://dl.google.com/android/repository/sources-33_r01.zip