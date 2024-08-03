import 'package:flutter/material.dart';
import 'package:my_self_quiz_app/utils/color_constance.dart';
import 'package:my_self_quiz_app/view/answer_options_card/answer_options_card.dart';
import 'package:my_self_quiz_app/view/result_screen/result_screen.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, this.questions});
  final List? questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentquestionindex = 0;
  int? selectedindex;
  int rightanswercount = 0;
  int wronganswercount = 0;
  int skippedanswercount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstance.mainblack,
      appBar: AppBar(
        backgroundColor: ColorConstance.mainblack,
        title: LinearPercentIndicator(
          animation: true,
          barRadius: Radius.circular(20),
          trailing: Text(
            '${currentquestionindex + 1}/${widget.questions!.length}',
            style: TextStyle(color: Colors.orange),
          ),
          width: 250,
          lineHeight: 20,
          percent: currentquestionindex / widget.questions!.length,
          progressColor: Colors.orange,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// quuestions container
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(41, 110, 106, 106)),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.questions![currentquestionindex]['question'],

                  /// evda widget enn kodkan ulla reason statefull widget aayond widget. enn kodthalay dummydb okkay vilikan pattu
                  style:
                      TextStyle(color: ColorConstance.mainwhite, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              /// answer options container
              Column(
                children: List.generate(
                  4,
                  (index) {
                    return AnswerOptionsCard(
                        icon: geticons(index),
                        bordercolor: getcolor(index),
                        onTap: () {
                          if (selectedindex == null) {
                            selectedindex = index;
                            setState(() {});
                          }
                          if (selectedindex ==
                              widget.questions![currentquestionindex]
                                  ['answerIndex']) {
                            rightanswercount++;
                            print(rightanswercount);
                          } else if (selectedindex !=
                              widget.questions![currentquestionindex]
                                  ['answerIndex']) {
                            wronganswercount++;
                          }
                        },
                        choice: widget.questions![currentquestionindex]
                            ['options'][index]);

                    /// eee index list.generate index hann adhond answer option order aaytt varum
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),

              /// next button container

              InkWell(
                onTap: () {
                  if (selectedindex == null) {
                    skippedanswercount++;
                  }
                  selectedindex = null;
                  if (currentquestionindex < widget.questions!.length - 1) {
                    currentquestionindex++;
                    setState(() {});
                  } else {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            rightanswercount: rightanswercount,
                            wronganswercount: wronganswercount,
                            skippedanswercount: skippedanswercount,
                          ),
                        ));
                  }
                },
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      color: ColorConstance.mainblue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    textAlign: TextAlign.center,
                    'NEXT',
                    style: TextStyle(
                        color: ColorConstance.mainwhite,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///function for border color
  ///
  Color getcolor(int index) {
    if (selectedindex != null) {
      if (widget.questions![currentquestionindex]['answerIndex'] ==
              selectedindex &&
          selectedindex == index) {
        return Colors.green;
      } else if (widget.questions![currentquestionindex]['answerIndex'] !=
              selectedindex &&
          index == selectedindex) {
        return Colors.red;
      } else if (widget.questions![currentquestionindex]['answerIndex'] ==
          index) {
        return Colors.green;
      }
    }

    return Colors.grey;
  }

  geticons(int index) {
    if (selectedindex != null) {
      if (widget.questions![currentquestionindex]['answerIndex'] ==
              selectedindex &&
          selectedindex == index) {
        return Icon(Icons.check, color: Colors.green, size: 30);
      } else if (widget.questions![currentquestionindex]['answerIndex'] !=
              selectedindex &&
          index == selectedindex) {
        return Icon(
          Icons.close,
          color: ColorConstance.mainred,
          size: 30,
          weight: .100,
        );
      } else if (widget.questions![currentquestionindex]['answerIndex'] ==
          index) {
        return Icon(
          Icons.check,
          color: Colors.green,
          size: 30,
          fill: .100,
        );
      }
    }
  }
}
