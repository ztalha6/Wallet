import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/views/sign_in/sign_in_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(SignInView()));
}

class MyApp extends StatelessWidget {
  final Widget landingWidget;
  MyApp(this.landingWidget, {Key? key}) : super(key: key);

  final MaterialColor primaryMaterialColor = MaterialColor(
    0xFF454545,
    <int, Color>{
      50: const Color(0xFF454545).withOpacity(0.1),
      100: const Color(0xFF454545).withOpacity(0.2),
      200: const Color(0xFF454545).withOpacity(0.3),
      300: const Color(0xFF454545).withOpacity(0.4),
      400: const Color(0xFF454545).withOpacity(0.5),
      500: const Color(0xFF454545).withOpacity(0.6),
      600: const Color(0xFF454545).withOpacity(0.7),
      700: const Color(0xFF454545).withOpacity(0.8),
      800: const Color(0xFF454545).withOpacity(0.9),
      900: const Color(0xFF454545).withOpacity(1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // cupertinoOverrideTheme:
        //     CupertinoThemeData(primaryColor: primaryMaterialColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold))),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            suffixIconColor: const Color(0xFFC4CACC),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFE7E8EA))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE7E8EA)),
                borderRadius: BorderRadius.circular(10)),
            fillColor: const Color(0xFFF4F6F6)),
        appBarTheme: AppBarTheme(
          toolbarHeight: kToolbarHeight + 10,
          iconTheme: IconThemeData(color: primaryMaterialColor),
          titleTextStyle: TextStyle(
              color: primaryMaterialColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        primarySwatch: primaryMaterialColor,
        primaryColor: primaryMaterialColor,
      ),
      home: landingWidget,
    );
  }
}
