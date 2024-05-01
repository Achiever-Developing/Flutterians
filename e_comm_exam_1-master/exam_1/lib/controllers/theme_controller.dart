import 'package:exam_1/headers.dart';

class ThemeController extends ChangeNotifier {
  // State
  bool isDark = false;
  // Behaviours
  void getTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
