import 'package:flutter/material.dart';

import 'package:flutter_application_new1/widgets/category_filter.dart';
import 'package:flutter_application_new1/widgets/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });
  final String name, image, price;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          maxChildSize: 0.8,
          minChildSize: 0.17,
          expand: false,
          builder: (context, scrollController) {
            return BottomWidget(scrollController, widget.name, widget.price);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: widget.name,
        prefix: "assets/svgs/arrow-left (1).svg",
        suffix: "assets/svgs/bi_bag.svg",

        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategoryFilter(),

            ///image
            Stack(
              children: [
                SizedBox(
                  width: 300,
                  height: 600,
                  child: Hero(
                    tag: widget.name,
                    child: Image.asset(widget.image),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  left: 10,
                  child: Image.asset("assets/images/shadow.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Bottom Sheet
Widget BottomWidget(Scroll, name, price) {
  return Container(
    height: 138,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    padding: EdgeInsets.all(16),
    child: ListView(
      controller: Scroll,
      children: [
        Center(
          child: Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Gap(13),
        Text(
          name,
          maxLines: 1,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Gap(6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "€${price}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Icon(Icons.favorite_border),
                Gap(10),
                Text(
                  "450",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 0.7, color: Colors.black12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Select Color",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/svgs/Frame 39639.svg"),
                ],
              ),
              Container(width: 2, height: 40, color: Colors.black12),

              Row(
                children: [
                  Text(
                    "Select Size",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Gap(10),
                  SvgPicture.asset("assets/svgs/Frame 39639.svg"),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              "Add To Bag",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        Gap(20),

        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),

          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.delivery_dining_outlined),
                  Gap(5),
                  Text(
                    "Free delivery",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Gap(5),
              Divider(color: Colors.black12),
              Row(
                children: [
                  Icon(Icons.fire_truck_outlined),
                  Gap(5),
                  Text(
                    "Free return",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Text(
          "About product",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
          ),

          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.list_rounded),
                  Gap(8),
                  Text(
                    "Product details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_up_rounded, weight: 5),
                ],
              ),
              Gap(5),
              Divider(color: Colors.black12),
              Row(
                children: [
                  Icon(Icons.store_rounded),
                  Gap(8),
                  Text(
                    "Brand",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_rounded, weight: 5),
                ],
              ),
              Gap(5),
              Divider(color: Colors.black12),
              Row(
                children: [
                  Icon(Icons.transfer_within_a_station_sharp),
                  Gap(8),
                  Text(
                    "Size and fit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_rounded, weight: 5),
                ],
              ),
              Gap(5),
              Divider(color: Colors.black12),
              Row(
                children: [
                  Icon(Icons.history_rounded),
                  Gap(8),
                  Text(
                    "History",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_rounded, weight: 5),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
