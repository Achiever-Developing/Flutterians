import 'package:exam_1/headers.dart';

Widget CategoryView({required String category, required BuildContext context}) {
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        category,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
      ProductCart(category: category, size: size, context: context),
    ],
  );
}
