import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sb_admin/screens/employees/employees_screen.dart';
import 'package:sb_admin/screens/employees/subscreens/add_employees_screen.dart';
import 'package:sb_admin/screens/orders/orders_screen.dart';
import 'package:sb_admin/screens/orders/subscreens/add_order_screen.dart';
import 'package:sb_admin/screens/orders/subscreens/view_order_screen.dart';
import 'package:sb_admin/screens/reports/reports_screen.dart';
import 'package:sb_admin/screens/reports/subscreens/view_report_screen.dart';
import 'package:sb_admin/screens/settings/settings_screen.dart';
import 'package:sb_admin/screens/users/subscreens/otp_verify_screen.dart';
import 'package:sb_admin/screens/users/users_screen.dart';
import '/firebase_options.dart';

import '/logic/repositories/auth_repo.dart';
import '/screens/home/sign_in_screen.dart';
import '/screens/packages/subscreens/add_pack_screen.dart';
import '/screens/tests/subcreens/add_test_screen.dart';
import '/screens/tests/subcreens/view_test_screen.dart';
import '/screens/tests/tests_screen.dart';
import 'screens/reports/subscreens/add_report_screen.dart';
import 'screens/users/subscreens/view_user_screen.dart';
import '/logic/controllers/test_controller.dart';
import '/screens/packages/subscreens/view_pack_screen.dart';
import '/screens/packages/packages_screen.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthRepo()));
  runApp(const MyApp());
  final tController = Get.put(TestController());
  tController.fetchData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SB Admin',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: SignInScreen(),
      routes: {
        "/HomeScreen": (p0) => const HomeScreen(),
        "/SignInScreen": (p0) => SignInScreen(),
        '/PackagesScreen': (p0) => const PackagesScreen(),
        '/ViewPackScreen': (p0) => const ViewPackScreen(),
        "/AddPackScreen": (p0) => const AddPackScreen(),
        "/EditPackScreen": (p0) => const ViewPackScreen(isEditChoose: true),
        "/DeletePackScreen": (p0) => const ViewPackScreen(isDeleteChoose: true),
        "/TestsScreen": (p0) => const TestsScreen(),
        "/ViewTestScreen": (p0) => const ViewTestScreen(),
        "/AddTestScreen": (p0) => const AddTestScreen(),
        "/EditTestScreen": (p0) => const ViewTestScreen(isEditChoose: true),
        "/SearchTestScreen": (p0) => const ViewTestScreen(),
        "/UsersScreen": (p0) => const UsersScreen(),
        "/ViewUserScreen": (p0) => const ViewUserScreen(),
        "/SearchUserScreen": (p0) => const ViewUserScreen(),
        "/VerifyOtpScreen": (p0) => const VerifyOtpScreen(),
        "/EditUserScreen": (p0) => const ViewUserScreen(isEditChoose: true),
        "/AddReportScreen": (p0) => const AddReportScreen(),
        "/ReportsScreen": (p0) => ReportsScreen(),
        "/ViewReportScreen": (p0) => const ViewReportScreen(),
        "/SearchReportTestScreen": (p0) => const AddReportScreen(),
        "/SearchReportScreen": (p0) => const ViewReportScreen(),
        "/EditReportScreen": (p0) => const ViewReportScreen(isEditChoose: true),
        "/SettingsScreen": (p0) => SettingsScreen(),
        "/ViewOrderScreen": (p0) => const ViewOrderScreen(),
        "/OrdersScreen": (p0) => const OrdersScreen(),
        "/AddOrderScreen": (p0) => const AddOrderScreen(),
        "/EmployeesScreen": (p0) => const EmployeesScreen(),
        "/AddEmployeesScreen": (p0) => const AddEmployeesScreen(),
      },
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
