import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var KColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 184, 139, 80),
);

var KColorSchemeDark = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 138, 117, 92),
  brightness: Brightness.dark,
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
  //   _,
  // ) {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: KColorSchemeDark,
        appBarTheme: AppBarTheme().copyWith(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: KColorSchemeDark.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: KColorSchemeDark.onPrimary,
        ),
        iconTheme: IconThemeData().copyWith(color: KColorSchemeDark.onPrimary),
        iconButtonTheme: IconButtonThemeData(
          style: ElevatedButton.styleFrom(
            iconColor: KColorSchemeDark.onPrimaryContainer,
          ),
        ),
        cardTheme: CardTheme().copyWith(
          color: KColorSchemeDark.primary,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KColorSchemeDark.secondaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: KColorSchemeDark.onSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),

          bodyMedium: TextStyle(
            color: KColorSchemeDark.onSecondaryContainer,
            fontSize: 16,
          ),
          titleMedium: TextStyle(color: KColorSchemeDark.onPrimaryContainer),
        ),
      ),

      theme: ThemeData().copyWith(
        colorScheme: KColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          titleTextStyle: TextStyle(
            fontSize: 25,
            color: KColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: KColorScheme.primary,
          foregroundColor: KColorScheme.onPrimaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: KColorScheme.secondaryContainer.withOpacity(0.8),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: KColorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      home: Expenses(),
    ),
  );
  // });
}
