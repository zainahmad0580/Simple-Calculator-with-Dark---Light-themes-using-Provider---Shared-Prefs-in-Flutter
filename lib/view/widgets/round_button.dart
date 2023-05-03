import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color buttonColor;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: buttonColor),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
          )),
    );
  }
}
