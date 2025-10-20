import 'package:flutter/material.dart';

import 'package:flutter_application_new1/medule/pages/product_Screen.dart';
import 'package:flutter_application_new1/models/product_model.dart';
import 'package:flutter_application_new1/widgets/ListCategory_Details.dart';
import 'package:flutter_application_new1/widgets/category_filter.dart';
import 'package:flutter_application_new1/widgets/custom_appbar.dart';
import 'package:flutter_application_new1/widgets/product_item.dart';

import 'package:gap/gap.dart';

class CategorysScreen extends StatelessWidget {
  const CategorysScreen({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = getProductsByCategory(title);

    return Scaffold(
      appBar: CustomAppbar(
        title: title,
        prefix: "assets/svgs/arrow-left (1).svg",
        suffix: "assets/svgs/bi_bag.svg",
        onTap: () {
          Navigator.pop(context);
        },
      ),

      body: Column(
        children: [
          CategoryFilter(),
          Gap(20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1 / 1.8,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  return Hero(
                    tag: item.name,
                    child: ProductItem(
                      name: item.name,
                      image: item.image,
                      price: item.price,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 3),
                            reverseTransitionDuration: Duration(seconds: 1),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ProductScreen(
                                      image: item.image,
                                      name: item.name,
                                      price: item.price,
                                    ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
