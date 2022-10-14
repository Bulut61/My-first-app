import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PocketMoneyPage extends StatefulWidget {
  const PocketMoneyPage({super.key});

  @override
  State<PocketMoneyPage> createState() => _PocketMoneyPageState();
}

class _PocketMoneyPageState extends State<PocketMoneyPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    ValueNotifier<int> fixedMoney = ValueNotifier<int>(0);
    fixedMoney = ValueNotifier<int>(0);
    int bonusMoney = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pocket Money"),
        centerTitle: true,
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Fixed Pocketmoney:",
                style: TextStyle(fontSize: 18, color: themeData.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80),
                child: TextFormField(
                  initialValue: "0",
                  onFieldSubmitted: (value) {
                    fixedMoney = ValueNotifier<int>(int.parse(value));
                    print(fixedMoney.value);
                  },
                  decoration: new InputDecoration(labelText: "Amount", hintText: "Only digits"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Bonus Pocketmoney:",
                style: TextStyle(fontSize: 18, color: themeData.colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    bonusMoney = int.parse(value);
                    print(bonusMoney);
                  },
                  decoration: new InputDecoration(labelText: "Amount", hintText: "Only digits"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        ValueListenableBuilder<int>(
            valueListenable: fixedMoney,
            builder: (BuildContext context, int value, Widget? child) {
              return Row(
                children: [Text("${fixedMoney.value}")],
              );
            })
      ]),
    );
  }
}
