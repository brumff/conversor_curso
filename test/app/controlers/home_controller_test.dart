import 'package:conversor_curso/app/controlers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test(
    'deve converter real para dolar com ponto',
    () {
      toText.text = '2.0';
      homeController.convert();
      expect(fromText.text, '0.36');
    },
  );
}
