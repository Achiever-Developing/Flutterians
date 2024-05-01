import 'package:exam_1/headers.dart';

class QtyController extends ChangeNotifier {
  //State

  QtyModal qty = QtyModal();

  //Behaviors

  void getIncrement({required int index}) {
    qty.increment(index: index);
    notifyListeners();
  }

  void getDecrement({required int index}) {
    qty.decrement(index: index);
    notifyListeners();
  }
}
