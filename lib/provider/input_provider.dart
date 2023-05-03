import 'package:flutter/foundation.dart';
import 'package:math_expressions/math_expressions.dart';

class InputProvider with ChangeNotifier {
  String _input = '';
  String get input => _input;

  void setInput(String s) {
    _input += s;
    notifyListeners();
  }

  void equate() {
    final finaluserinput = _input.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    _input = eval.toString();
    notifyListeners();
  }

  void del() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, input.length - 1);
      notifyListeners();
    }
  }

  void clear() {
    _input = '';
    notifyListeners();
  }
}
