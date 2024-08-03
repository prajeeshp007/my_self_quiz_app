import 'package:flutter/material.dart';
import 'package:my_self_quiz_app/dummy_db.dart';
import 'package:my_self_quiz_app/utils/color_constance.dart';
import 'package:my_self_quiz_app/view/category_screen/category_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.rightanswercount,
    required this.wronganswercount,
    required this.skippedanswercount,
  });
  final int rightanswercount;
  final int wronganswercount;
  final int skippedanswercount;

  @override
  Widget build(BuildContext context) {
    double percentage = rightanswercount * 100 / DummyDb.question.length;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congrats!',
                style: TextStyle(
                    color: ColorConstance.mainwhite,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$percentage%score',
                style: TextStyle(
                    color: const Color.fromARGB(255, 8, 168, 14),
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Correct Answers:$rightanswercount',
                style: TextStyle(
                    color: ColorConstance.mainwhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Wrong Answers:$wronganswercount',
                style: TextStyle(
                    color: ColorConstance.mainwhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Skipped Answers:$skippedanswercount',
                style: TextStyle(
                    color: ColorConstance.mainwhite,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 2, color: ColorConstance.mainwhite)),
                child: TextButton(
                    style: ButtonStyle(),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(),
                          ));
                    },
                    child: Text(
                      "Restart",
                      style: TextStyle(color: ColorConstance.mainwhite),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
