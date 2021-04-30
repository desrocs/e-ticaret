import 'package:e_ticaret/bottomNavigationBar.dart';
import 'package:e_ticaret/header.dart';
import 'package:e_ticaret/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:e_ticaret/categories.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle);

  List<Map> products = [
    {"isim": "laptop", "fotograf": "assets/images/laptop.jpg", "fiyat": "999"},
    {"isim": "laptop2", "fotograf": "assets/images/laptop.jpg", "fiyat": "999"},
    {"isim": "laptop3", "fotograf": "assets/images/laptop.jpg", "fiyat": "999"},
    {"isim": "laptop4", "fotograf": "assets/images/laptop.jpg", "fiyat": "999"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ///Header
              header(categoryTitle, context),
              SizedBox(
                height: 32,
              ),

              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  children: products.map((Map product) {
                    return buildContent(product["isim"], product["fotograf"],
                        product["fiyat"], context);
                  }).toList(),
                ),
              )
            ]),
          ),

          ///BottomNavigation
          bottomNavigationBar("search")
        ]),
      ),
    );
  }
}

Widget buildContent(String title, String photoUrl, String price, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProductDetailPage(title);
      }));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 24,
                offset: Offset(0, 16))
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Image.asset(photoUrl),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "USD $price",
                style: TextStyle(
                    color: Color(0xFF0A1034),
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
