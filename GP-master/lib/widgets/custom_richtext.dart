import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/styles/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.28,
              top: MediaQuery.of(context).size.height * 0.08),
          child: Text.rich(
            TextSpan(
                text: discription,
                style: const TextStyle(color: Colors.black87, fontSize: 14 , fontFamily: 'Tajawal'),
                children: [
                  TextSpan(
                      text: text,
                      style: const TextStyle(color: AppColors.yellow, fontSize: 16 , fontFamily: 'Tajawal'),
                      recognizer: TapGestureRecognizer()..onTap = onTap),
                ]),
          ),
        ),
      ],
    );
  }
}
