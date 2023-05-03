import 'package:calculator/provider/dark_theme_provider.dart';
import 'package:calculator/utils/app_colors.dart';
import 'package:calculator/utils/dark_theme_pref.dart';
import 'package:calculator/utils/styles.dart';
import 'package:calculator/view/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/input_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final inputProvider = Provider.of<InputProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          IconButton(
              onPressed: () {
                themeChange.darkTheme
                    ? themeChange.darkTheme = false
                    : themeChange.darkTheme = true;
              },
              icon: themeChange.darkTheme
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.dark_mode_outlined)),
          const Expanded(child: SizedBox.shrink()),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.grey),
              child: Consumer<InputProvider>(builder: (context, value, child) {
                return Text(value.input,
                    textAlign: TextAlign.right, style: Styles.primaryText());
              })),
          FittedBox(
            child: Row(
              children: [
                RoundButton(
                    title: 'C',
                    onPress: () => inputProvider.clear(),
                    buttonColor: AppColors.red),
                RoundButton(
                    title: '+/-',
                    onPress: () => inputProvider.setInput('+/-'),
                    buttonColor: AppColors.grey),
                RoundButton(
                    title: '%',
                    onPress: () => inputProvider.setInput('%'),
                    buttonColor: AppColors.grey),
                RoundButton(
                    title: '/',
                    onPress: () => inputProvider.setInput('/'),
                    buttonColor: AppColors.blue),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                RoundButton(
                    title: '7',
                    onPress: () => inputProvider.setInput('7'),
                    buttonColor: AppColors.grey),
                RoundButton(
                    title: '8',
                    onPress: () => inputProvider.setInput('8'),
                    buttonColor: AppColors.grey),
                RoundButton(
                    title: '9',
                    onPress: () => inputProvider.setInput('9'),
                    buttonColor: AppColors.grey),
                RoundButton(
                    title: 'X',
                    onPress: () => inputProvider.setInput('*'),
                    buttonColor: AppColors.blue),
              ],
            ),
          ),
          FittedBox(
              child: Row(
            children: [
              RoundButton(
                  title: '4',
                  onPress: () => inputProvider.setInput('4'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '5',
                  onPress: () => inputProvider.setInput('5'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '6',
                  onPress: () => inputProvider.setInput('6'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '-',
                  onPress: () => inputProvider.setInput('-'),
                  buttonColor: AppColors.blue),
            ],
          )),
          FittedBox(
              child: Row(
            children: [
              RoundButton(
                  title: '1',
                  onPress: () => inputProvider.setInput('1'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '2',
                  onPress: () => inputProvider.setInput('2'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '3',
                  onPress: () => inputProvider.setInput('3'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '+',
                  onPress: () => inputProvider.setInput('+'),
                  buttonColor: AppColors.blue),
            ],
          )),
          FittedBox(
              child: Row(
            children: [
              RoundButton(
                  title: '.',
                  onPress: () => inputProvider.setInput('.'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: '0',
                  onPress: () => inputProvider.setInput('0'),
                  buttonColor: AppColors.grey),
              RoundButton(
                  title: 'DEL',
                  onPress: () => inputProvider.del(),
                  buttonColor: AppColors.red),
              RoundButton(
                  title: '=',
                  onPress: () => inputProvider.equate(),
                  buttonColor: AppColors.blue),
            ],
          )),
        ]),
      )),
    );
  }
}
