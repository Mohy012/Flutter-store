import 'package:flutter/material.dart';
import 'package:flutter_application_new1/medule/pages/categorys_Screen.dart';
import 'package:flutter_application_new1/models/category_model.dart';
import 'package:flutter_application_new1/widgets/custom_appbar.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<CategoryModel> category = [
  CategoryModel(image: "assets/images/category/image.png", title: "Women"),
  CategoryModel(image: "assets/images/category/image (1).png", title: "Men"),
  CategoryModel(image: "assets/images/category/image (2).png", title: "Kids"),
  CategoryModel(image: "assets/images/category/image (3).png", title: "Deals"),
  CategoryModel(image: "assets/images/category/Health.png", title: "Healht"),
];

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  @override
  // Video
  void initState() {
    _controller = VideoPlayerController.asset("assets/video/video.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        prefix: "assets/svgs/bar-chart-2.svg",
        title: "Runway",
        suffix: "assets/svgs/solar_bell-line-duotone.svg",
      ),
      body: Stack(
        children: [
          //video
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          //categorys
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      "Categors",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(category.length, (index) {
                          final item = category[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategorysScreen(
                                      title: item.title,
                                      image: item.image,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(item.image, width: 75),
                                  Gap(10),
                                  Text(item.title),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // لون الخلفية
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue, // اللون لما تختار عنصر
          unselectedItemColor: Colors.grey, // اللون للعناصر الباقية
          showUnselectedLabels: true, // عشان يظهر النص للعناصر التانية
          currentIndex: 0, // خليه متغير لو هتستخدم setState
          onTap: (index) {
            // هنا بتحط التنقل بين الصفحات
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_rounded),
              label: "Love",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge_outlined),
              label: "Bag",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
