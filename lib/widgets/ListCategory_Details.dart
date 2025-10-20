import 'package:flutter_application_new1/models/product_model.dart';

List<ProductModel> getProductsByCategory(String title) {
  List<ProductModel> products = [];

  if (title == "Women") {
    products = [
      ProductModel(
        image: "assets/images/medul/Frame 72.png",
        price: "25",
        name: "Dress A",
      ),
      ProductModel(
        image: "assets/images/medul/image 2.png",
        price: "30",
        name: "T_sh B",
      ),
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket A",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt B",
      ),
    ];
  } else if (title == "Men") {
    products = [
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket A",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt B",
      ),
      ProductModel(
        image: "assets/images/medul/Frame 72.png",
        price: "25",
        name: "Dress A",
      ),
      ProductModel(
        image: "assets/images/medul/image 2.png",
        price: "30",
        name: "Dress B",
      ),
    ];
  } else if (title == "Kids") {
    products = [
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket A",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt B",
      ),
      ProductModel(
        image: "assets/images/medul/Frame 72.png",
        price: "25",
        name: "Dress A",
      ),
      ProductModel(
        image: "assets/images/medul/image 2.png",
        price: "30",
        name: "Dress B",
      ),

      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "15",
        name: "T-shirt",
      ),
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "20",
        name: "Shorts",
      ),
    ];
  } else if (title == "Deals") {
    products = [
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket A",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt B",
      ),
      ProductModel(
        image: "assets/images/medul/Frame 72.png",
        price: "25",
        name: "Dress A",
      ),
      ProductModel(
        image: "assets/images/medul/image 2.png",
        price: "30",
        name: "Dress B",
      ),
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket C",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt D",
      ),
    ];
  } else if (title == "Healht") {
    products = [
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket A",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt B",
      ),
      ProductModel(
        image: "assets/images/medul/Frame 72.png",
        price: "25",
        name: "Dress A",
      ),
      ProductModel(
        image: "assets/images/medul/image 2.png",
        price: "30",
        name: "Dress B",
      ),
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "40",
        name: "Jacket E",
      ),
      ProductModel(
        image: "assets/images/medul/image 4.png",
        price: "35",
        name: "Shirt W",
      ),
    ];
  } else {
    products = [
      ProductModel(
        image: "assets/images/medul/image 3.png",
        price: "10",
        name: "Default Item",
      ),
    ];
  }
  return products;
}
