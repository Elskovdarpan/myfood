
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfood/widgets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26,),
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
    );
  }
}
