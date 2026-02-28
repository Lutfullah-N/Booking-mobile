import 'package:booking/features/auth/screens/log_in.dart';
import 'package:booking/features/auth/screens/opt_basic.dart';
import 'package:booking/features/auth/screens/phone_sign_up.dart';
import 'package:booking/features/auth/screens/sign_up.dart';
import 'package:booking/features/auth/screens/user_profile.dart';
import 'package:booking/features/home/screens/add_booking.dart';
import 'package:booking/features/home/screens/advance_otp.dart';
import 'package:booking/features/home/screens/booking_page.dart';
import 'package:booking/features/home/screens/home_page.dart';
import 'package:booking/features/home/screens/my_booking.dart';
import 'package:booking/features/home/screens/my_booking_details.dart';
import 'package:booking/features/home/screens/payment_method.dart';
import 'package:booking/features/home/screens/phone_username.dart';
import 'package:booking/shared/widgets/welcome_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String welcomePage = '/';
  // static const String bookingSoon = '/bookingSoon';
  static const String homePage = '/home';
  static const String signOpt = '/signOptUp';
  static const String emailSingUp = '/emailSingUp';
  static const String phoneSingUp = '/phoneSingUp';
  // static const String currentBooking = '/currentBooking';
  static const String userProfile = '/userprofile';
  static const String myBooking = '/myBooking';
  static const String payment = '/payment';
  static const String bookings = '/bookings';
  static const String myBookingDetail = '/myDetails';
  static const String confirmOtp = '/confirmOtp';
  static const String bookingDetails = '/bookingDetails';
  static const String phoneUsername = '/phoneUser';
  static const String otpBasic = '/otpBasic';
  static const String addBooking = '/addBooking';
  static const String makeBooking = '/makeBooking';
  static const String login = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );

      // case bookingSoon:
      //   return MaterialPageRoute(
      //     builder: (_) => const BookingSoon(),
      //   );
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signOpt:
        return MaterialPageRoute(builder: (_) => const PhoneSignUp());
      case emailSingUp:
        return MaterialPageRoute(builder: (_) => const RegistrationForm());
      case userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfile());
      case myBooking:
        return MaterialPageRoute(builder: (_) => MyBooking());
      case myBookingDetail:
        return MaterialPageRoute(builder: (_) => const MyBookingDetails());
      case payment:
        return MaterialPageRoute(builder: (_) => PaymentMethod());
      case confirmOtp:
        return MaterialPageRoute(builder: (_) => const AdvanceOtp());
      case otpBasic:
        return MaterialPageRoute(builder: (_) => const OptBasic());
      case phoneUsername:
        return MaterialPageRoute(builder: (_) => const PhoneUsername());
      case bookings:
        return MaterialPageRoute(
            builder: (_) => const BookingPage(isComingSoon: true));
      case addBooking:
        return MaterialPageRoute(builder: (_) => const AddBooking());
      case homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}
