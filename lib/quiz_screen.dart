import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guiz_application/quiz_brain.dart';

import 'custom_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Widget> icons = <Widget>[];

  Widget correctIcon = const Padding(
    padding: EdgeInsets.only(left: 2.0),
    child: FaIcon(
      FontAwesomeIcons.check,
      color: Colors.green,
      size: 25.0,
    ),
  );
  Widget incorrectIcon = const Padding(
    padding: EdgeInsets.only(left: 2.0),
    child: FaIcon(
      FontAwesomeIcons.close,
      color: Colors.red,
      size: 25.0,
    ),
  );

  String suroo = 'Suroolor';
  bool isFinished;
  void userAnswered(bool userAnswer) {
    // bool correctAnswer = QuizBrain().getAnswers();
    bool correctAnswer = quizBrain.getAnswers();
    log('UserAnswer.answer: ${userAnswer == correctAnswer}');
    if (userAnswer == correctAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }
    quizBrain.getNext();
    suroo = quizBrain.getQuestion();
    if (suroo == 'Бутту') {
      isFinished = true;
    }

    setState(() {});
  }

  @override
  void initState() {
    suroo = quizBrain.getQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        title: const Text(
          'Тапшырма 07',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 25.0,
              ),
              Text(
                suroo ?? 'Suroo bosh',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                ),
              ),
              if (isFinished == true)
                CustomButton(
                  textButton: 'Kairadan Bashta',
                  onPress: () {
                    quizBrain.reset();
                    suroo = quizBrain.getQuestion();
                    isFinished = false;
                    icons = [];
                    setState(() {});
                  },
                )
              else
                Column(
                  children: [
                    CustomButton(
                      onPress: () {
                        userAnswered(true);
                      },
                      textButton: 'Туура',
                      color: Color(0xff4CAF52),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomButton(
                      onPress: () {
                        userAnswered(false);
                      },
                      textButton: 'Туура эмес',
                      color: const Color(0xffF54335),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: icons,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
