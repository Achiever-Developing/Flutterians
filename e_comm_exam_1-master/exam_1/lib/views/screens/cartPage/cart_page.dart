import 'package:exam_1/headers.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  num value = 0;
  num qty = 1;

  TextStyle textStyle = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartItems.forEach((e) {
      value =
          value + ((e.price - (e.price * (e.discountPercentage / 100))) * qty);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    double h = s.height;
    double w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...cartItems
                    .map(
                      (e) => cardView(product: e, context: context),
                    )
                    .toList(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: h * 0.1,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount : ",
                        style: textStyle,
                      ),
                      Text(
                        (cartItems.isNotEmpty
                            ? "\$ $value".split(".")[0]
                            : "\$ 0"),
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
