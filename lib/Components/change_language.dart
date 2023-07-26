import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_images.dart';


class ArabicLanguage extends StatelessWidget {
  const ArabicLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // To Change the language to Arabic
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Text(
                  "العربية",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 15,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                  ),
                ),
                // Arabic Flag
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(AppImages.kArabicFlag),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EnglishLanguage extends StatelessWidget {
  const EnglishLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // To Change the language to English
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                // English Flag
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(AppImages.kEnglishFlag),
                ),
                const Text(
                  "Eng",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 15,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
