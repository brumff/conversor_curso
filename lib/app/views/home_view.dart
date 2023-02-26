import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controlers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 30),
        child: Column(
          children: [
            Image.asset('/logo.png', width: 150, height: 150),
            SizedBox(height: 50),
            CurrencyBox(
              selectedItem: homeController.toCurrency,
                controller: toText,
                itens: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model!;
                  });
                }),
            SizedBox(height: 10),
            CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                itens: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model!;
                  });
                }),
            SizedBox(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                homeController.convert();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
              child: Text('Converter'),
            )
          ],
        ),
      ),
    ));
  }
}
