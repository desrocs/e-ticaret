import 'package:e_ticaret/categories.dart';
import 'package:e_ticaret/label.dart';
import 'package:flutter/material.dart';

import 'bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ///Media query dosyası MyAppden sonra oluşmadığı için taşıdık
    double screenWidth = MediaQuery.of(context).size.width;

    ///screenWidth ile ekran boyutunu aldık

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                ///Container ListView kullandık aşağı kaydırabilmek için

                ///crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Başlık
                  buildBaslik(),

                  ///Banner
                  buildBanner(),

                  ///Butonlar

                  Padding(
                    ///Yukardan boşluk vermek için kıllandık
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///İlk Eleman
                        buildNavigation(
                          text: "Categories",
                          icon: Icons.menu,
                          widget: CategoriesPage(),
                          context: context,
                        ),
                        buildNavigation(
                            text: "Favorites", icon: Icons.star_border),
                        buildNavigation(
                            text: "Gifts", icon: Icons.card_giftcard),
                        buildNavigation(
                            text: "Best Selling", icon: Icons.people),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  ///Sales Title
                  Column(
                    ///mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sales",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  ///SalesItems
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Smartphone",
                        photoUrl: "assets/images/smartphone.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Smartphone",
                        photoUrl: "assets/images/samsung.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                        text: "Smartphone",
                        photoUrl: "assets/images/laptop.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                      buildSalesItem(
                        text: "Smartphone",
                        photoUrl: "assets/images/headphones.jpg",
                        discount: "-50%",
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar("home"),

            ///Bottom Navigation Bar
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  ///Kodlar uzamasın diye ayrı fonksiyona yazdık
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
        fontSize: 32,
        color: Color(0xFF0A1034),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    ///Banner
    padding: EdgeInsets.only(top: 24),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, 14, 36, 18),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bose Home Speaker",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "USD 279",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/speaker.jpg",
            scale: 5,
          )
        ],
      ),
    ),
  );
}

Widget buildNavigation({
  ///@required zorunlu parametreler
  @required String text,
  @required IconData icon,
  Widget widget,
  BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE0ECF),
          ),
          child: Icon(
            icon,
            color: Color(0xFF0001FC),
            size: 18,
          ),
        ),
        SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget buildSalesItem({
  @required String text,
  @required String photoUrl,
  @required String discount,
  @required double screenWidth,

  ///ekran boyutunu almak için
}) {
  return Container(
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    width: (screenWidth - 60) * 0.5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount),

        SizedBox(height: 22,),
        Center(
          child: Image.asset(
            photoUrl,
            height: 200,
            width: 200,
          ),
        ),
        SizedBox(height: 22),
        Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.bold),
          ),
        ),

        /// ½50a

        /// telefon resmi

        /// ismi
      ],
    ),
  );
}
