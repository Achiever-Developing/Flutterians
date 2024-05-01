import 'headers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => QtyController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
