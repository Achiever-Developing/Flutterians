import 'package:exam_1/headers.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Page",
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
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          //ThumbNailView
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                product.images.length,
                (index) => Container(
                  height: size.height * 0.3,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black12,
                    image: DecorationImage(
                      image: NetworkImage(product.images[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              color: Provider.of<ThemeController>(context).isDark
                  ? Colors.black
                  : Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.elliptical(30, 50),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Provider.of<ThemeController>(context).isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: product.description,
                        style: TextStyle(
                          fontSize: 22,
                          color: Provider.of<ThemeController>(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nPrice             ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeController>(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: product.price.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Provider.of<ThemeController>(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nDiscount \t\t\t\t\t',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Provider.of<ThemeController>(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '${product.discountPercentage} % ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Provider.of<ThemeController>(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      'Rating \t\t\t\t\t',
                      style: TextStyle(
                        fontSize: 25,
                        color: Provider.of<ThemeController>(context).isDark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    RatingBarIndicator(
                      rating: product.rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 30.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          if (cartItems.contains(product)) {
            snackBar = SnackBar(
              content: Text(
                "${product.title} is already in your CART !!",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.yellow,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            cartItems.add(product);
            snackBar = SnackBar(
              content: Text("${product.title} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to cart"),
      ),
    );
  }
}
