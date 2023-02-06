// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myfood/utils/dimensions.dart';
import 'package:myfood/widgets/icon_and_text_widget.dart';
import 'package:myfood/widgets/small_text.dart';

import '../widgets/app_column.dart';
import '../widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  //SLIDER HEIGHT AND WIDTH
  @override
  void initState()
  {
    super.initState();
    pageController.addListener(() {
      _currPageValue = pageController.page!;
      // print("Current page is: "+_currPageValue.toString());
    });
  }
//WINDOW HEIGHT AND WIDTH
  @override
  void dispose()
  {
    pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SLIDER SECTION
        Container(
          height: Dimensions.pageView,
          // color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position){
                return _buildPageItem(position);
              }),
        ),
      //DOTS
    new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    ),
        //POPULAR TEXT
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: "Food Pairing"),
              ),
            ],
          )
        ),
        //LIST OF FOOD AND IMAGES
        ListView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 20,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20,  top: Dimensions.height10),
                child: Row(
                  children: [
                    //IMAGE
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white30,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/food0.jpg"
                          ),
                        ),
                      ),
                    ),
                    //TEXT
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "Nutrius Fruit meal in china"),
                              SmallText(text: "with all the chinnes"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconsAndTextWidget(icon: Icons.circle_sharp, text: "Normal", color: Colors.blue),
                                  SizedBox(height: 20),
                                  IconsAndTextWidget(icon: Icons.location_on, text: "1.7km", color: Colors.indigo),
                                  SizedBox(height: 10),
                                  IconsAndTextWidget(icon: Icons.access_time_rounded, text: "32 min", color: Colors.deepPurple),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index){

    //WINDOW HEIGHT AND WIDTH
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor())
      {
        var _currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var _currTrans = _height*(1-_currScale)/2;
        matrix = Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(1, _currTrans, 1);

      }
    else if(index == _currPageValue.floor() + 1)
      {
        var _currScale = _scaleFactor + (_currPageValue-index+1)*(1-_scaleFactor);
        var _currTrans = _height*(1-_currScale)/2;
        matrix = Matrix4.diagonal3Values(1, _currScale, 1);
        matrix = Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(1, _currTrans, 1);;
      }
    else if(index == _currPageValue.floor() + 1)
    {
      var _currScale =1-(_currPageValue-index+1)*(1-_scaleFactor);
      var _currTrans = _height*(1-_currScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currScale, 1);
      matrix = Matrix4.diagonal3Values(1, _currScale, 1)..setTranslationRaw(1, _currTrans, 1);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, _height*(1 - _scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: Color(0xFF69c5df),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/images/food1.jpg"
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.width10,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    // blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    // blurRadius: 5.0,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    // blurRadius: 5.0,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AppColumn(text: "Chiness Side",),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
