import 'package:exam_1/headers.dart';

final List<String> imgList = [
  "assets/images/category/jwellery.jpeg",
  "assets/images/category/image1.jpeg",
  "assets/images/category/image2.jpeg",
  "assets/images/category/image3.jpeg",
  "assets/images/category/image4.jpeg",
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? theme;

    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.of(context).size;

    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        // backgroundColor: const Color(0xFF5F6F52),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeController>(
                context,
                listen: false,
              ).getTheme();
            },
            icon: Icon(
              Provider.of<ThemeController>(context).isDark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.cartpage);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Giva Fashion",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CarouselSlider(
                    items: [
                      ...List.generate(
                        imgList.length,
                        (index) => Container(
                          height: height * 0.4,
                          width: width * 0.9,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(
                                imgList[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: height * 0.3,
                      autoPlay: true,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: allCategories
                        .map(
                          (e) => CategoryView(
                            category: e,
                            context: context,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
