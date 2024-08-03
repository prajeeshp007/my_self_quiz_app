import 'package:flutter/material.dart';
import 'package:my_self_quiz_app/dummy_db.dart';

import 'package:my_self_quiz_app/utils/color_constance.dart';
import 'package:my_self_quiz_app/view/questions_screen/question_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 40, 41),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                children: [
                  Text(
                    'Hi Buddy!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Lets make this day productive',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 160,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionScreen(
                                questions: DummyDb.question[index]),
                          ));
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(DummyDb.CATEGORYIMAGES[index]['image']),
                          Text(
                            DummyDb.CATEGORYIMAGES[index]['topicname'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: ColorConstance.mainwhite,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: ColorConstance.mainblack,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
