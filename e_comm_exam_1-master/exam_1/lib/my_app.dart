import 'headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF77B0AA),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Color(0xFF9AC8CD),
          backgroundColor: Color(0xFF77B0AA),
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleSpacing: 1,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF5F6F52),
          ),
          appBarTheme: const AppBarTheme(
            foregroundColor: Color(0xFF5F6F52),
            backgroundColor: Color(0xFF5F6F52),
          )),
      themeMode: Provider.of<ThemeController>(context).isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      routes: AppRoutes.route,
    );
  }
}
