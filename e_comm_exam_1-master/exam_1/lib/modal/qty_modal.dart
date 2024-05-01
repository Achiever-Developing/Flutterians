import 'package:exam_1/headers.dart';

class QtyModal {
  List allQty = List.generate(allProducts.length, (index) => 1);

  void increment({required int index}) {
    allProducts[index].qty = allProducts[index].qty + 1;
  }

  void decrement({required int index}) {
    allProducts[index].qty = allProducts[index].qty - 1;
  }
}
