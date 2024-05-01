import 'package:exam_1/headers.dart';

Widget cardView({required Product product, required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5, 5),
          blurRadius: 5,
        ),
      ],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(product.thumbnail),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 150,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${(product.price - (product.price * (product.discountPercentage / 100)))}"
                      .split(".")[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  product.description,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 120,
                    top: 20,
                  ),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<QtyController>(
                                context,
                                listen: false,
                              ).getDecrement(
                                  index: allProducts.indexOf(product));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.horizontal_rule,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              product.qty.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<QtyController>(
                                context,
                                listen: false,
                              ).getIncrement(
                                  index: allProducts.indexOf(product));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
