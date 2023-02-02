// import 'dart:html';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myfood/utils/dimensions.dart';
import 'package:myfood/widgets/icon_and_text_widget.dart';
import 'package:myfood/widgets/small_text.dart';

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
    new DotsIndicator(
    dotsCount: 5,
    position: _currPageValue,
    )
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
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.width10),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Big Food Alo"),
                    SizedBox(height: Dimensions.height10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Colors.black, size: 15,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        SizedBox(width: 10,),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconsAndTextWidget(icon: Icons.circle_sharp, text: "Normal", color: Colors.blue),
                        IconsAndTextWidget(icon: Icons.location_on, text: "1.7km", color: Colors.indigo),
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
  }
}
