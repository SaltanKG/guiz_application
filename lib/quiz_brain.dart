import 'dart:developer';

import 'package:guiz_application/quiz_model.dart';

class QuizBrain {
  int _index = 0;
  List<QuizModel> suroolorJjanajooptor = <QuizModel>[
    QuizModel(suroolor: 'Кыргызстан эгемендуу олко', jooptor: true),
    QuizModel(
        suroolor: 'Казакстандын желеги кызыл туско боёлгон ', jooptor: false),
    QuizModel(suroolor: 'Билим куну 1-сентябрда белгиленет', jooptor: true),
    QuizModel(suroolor: 'Жуманын алтынчы куну бейшемби', jooptor: false),
    QuizModel(
        suroolor: 'Кыргыздын улуттук валютасы-сом 10-май 1993жылы чыгарылган',
        jooptor: true),
    QuizModel(
        suroolor: '80 мүнөт менен 1 саат 30 мүнөт бирдей', jooptor: false),
    QuizModel(
        suroolor: 'Кыргызстан Евразия материгинде жайгашкан', jooptor: true),
    QuizModel(suroolor: 'Манастын атын атасы Жакып койгон', jooptor: false),
    QuizModel(
        suroolor: 'Илимий иштер менен алектенген адам-илимпоз', jooptor: true),
    QuizModel(
        suroolor: 'Улуу саясатчы Махатма Гандинин мекени-Америка',
        jooptor: false),
  ];

  // Suroolordu alip kel
  String getQuestion() {
    if (_index < suroolorJjanajooptor.length) {
      return suroolorJjanajooptor[_index].suroolor;
    } else {
      return 'Бутту';
    }
  }

  // Jooptordu alip kel
  bool getAnswers() {
    return suroolorJjanajooptor[_index].jooptor;
  }

  // Suroonu otkoz
  void getNext() {
    log('_index: $_index');
    _index++;
  }

  // noldon bashta
  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
