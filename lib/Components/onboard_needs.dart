import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.number,
  });
  final String image, title, description, number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        // for Images
        Center(
          child: Image.asset(
            image,
            width: 360,
            height: 375,
          ),
        ),
        // for PageNumbers
        Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          width: 73,
          // height: 15,
          decoration:  BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(27.5))),
          child: Center(
              child: Text(
            number,
            style: const TextStyle(
              fontFamily: "Ubuntu",
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          //for Titles
          child: SizedBox(
            width: 342,
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: "MyFont",
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.kMyWhite,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
          //for Descriptions
          child: SizedBox(
            width: 300,
            child: Text(
              description,
              style: const TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 15,
                color: AppColors.kMyLightGrey,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
