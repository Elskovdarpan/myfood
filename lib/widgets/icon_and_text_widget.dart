import 'package:flutter/cupertino.dart';
import 'package:myfood/widgets/small_text.dart';

class IconsAndTextWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color;
  // final Color iconColor;
  const IconsAndTextWidget({Key? key, required this.icon, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5),
        SmallText(text: text, color: color),
      ],
    );
  }
}
