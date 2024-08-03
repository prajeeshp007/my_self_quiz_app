import 'package:flutter/material.dart';
import 'package:my_self_quiz_app/utils/color_constance.dart';

class AnswerOptionsCard extends StatelessWidget {
  const AnswerOptionsCard(
      {super.key,
      required this.choice,
      this.onTap,
      this.bordercolor,
      this.icon});
  final String choice;
  final Color? bordercolor;
  final void Function()? onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: bordercolor ?? Colors.grey),
            color: Color.fromARGB(41, 110, 106, 106)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              choice,
              style: TextStyle(fontSize: 20, color: ColorConstance.mainwhite),
            ),
            Container(
              child: icon != null ? icon : Container(),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 0, color: ColorConstance.mainwhite),
                  color: Color.fromARGB(41, 110, 106, 106)),
            )
          ],
        ),
      ),
    );
  }
}
