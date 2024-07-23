import 'package:flutter/material.dart';

class AppThemManager {
  static const Color primaryColor = Color(0xFF5D9CEC);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFFDFECDB),
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   centerTitle: true,
    //   toolbarHeight: 120,
    //   backgroundColor: Colors.transparent,
    //   titleTextStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 22,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white,
    //   ),
    //   iconTheme: IconThemeData(color: Colors.white),
    // ),

    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.zero,
      color: Colors.white,
      elevation: 0,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 2,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.white, width: 4),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        color: primaryColor,
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade600,
        size: 32,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: const Color(0xFF060E1E),
    // appBarTheme: const AppBarTheme(
    //   elevation: 0,
    //   centerTitle: true,
    //   toolbarHeight: 120,
    //   backgroundColor: Colors.transparent,
    //   titleTextStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 22,
    //     fontWeight: FontWeight.bold,
    //     color: Color(0xFF060E1E),
    //   ),
    //   iconTheme: IconThemeData(
    //     color: Color(0xFF060E1E),
    //   ),
    // ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
      padding: EdgeInsets.zero,
      color: Color(0xFF141922),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 2,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Color(0xFF141922), width: 4),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      // backgroundColor: const Color(0xff141922),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(
        color: primaryColor,
        size: 36,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade600,
        size: 32,
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF060E1E),
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

// class AppThemManager {
//   static ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: lightScaffoldBgColor,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedItemColor: kPrimaryColor,
//       unselectedItemColor: Colors.grey,
//       unselectedIconTheme: IconThemeData(color: Colors.grey, size: 30),
//       selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 35),
//       backgroundColor: Colors.white,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//     ),
//   );
//   static ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: darkScaffoldBgColor,
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       selectedItemColor: kPrimaryColor,
//       unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
//       selectedIconTheme: IconThemeData(color: kPrimaryColor, size: 35),
//       backgroundColor: Color(0xff141922),
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//     ),
//   );
// }
