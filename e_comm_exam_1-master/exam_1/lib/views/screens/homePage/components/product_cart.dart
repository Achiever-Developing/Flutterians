import 'package:exam_1/headers.dart';

Widget ProductCart(
    {required String category,
    required Size size,
    required BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ...allProducts
            .map(
              (e) => (category == e.category)
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.detailPage, arguments: e);
                      },
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.45,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                            image: DecorationImage(
                              image: NetworkImage(e.thumbnail),
                              fit: BoxFit.cover,
                            )),
                      ),
                    )
                  : Container(),
            )
            .toList()
      ],
    ),
  );
}
