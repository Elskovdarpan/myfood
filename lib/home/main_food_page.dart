import 'package:flutter/material.dart';
import 'package:myfood/home/food_page_body.dart';
import 'package:myfood/widgets/big_text.dart';
import 'package:myfood/widgets/small_text.dart';

import '../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //        SHOWING THE HEADER
          Container(

              child: Container(
                margin: EdgeInsets.only(top: 30, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                // color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "bangladesh", color: Colors.lightBlue[900]),
                        Row(
                          children: [
                            SmallText(text: "Kodambari"),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        // color: Colors.green,
                        width: 45,
                        height: 45,
                        child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
          //                                                    SHOWING THE BODY
          Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
