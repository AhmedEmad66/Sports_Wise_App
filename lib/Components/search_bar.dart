import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';

typedef OnTextChangedCallback = void Function(String);

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.hintText,
    required this.width,
    required this.controller,
    required this.onPressed,
  });
  final String hintText;
  final double width;
  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.kMyDarkGrey,
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColors.kPrimaryColor,
        style: const TextStyle(
          color: AppColors.kMyWhite,
          fontSize: 16,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.kMyLightGrey,
            fontSize: 16,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
          ),
          suffix: InkWell(
            onTap: onPressed,
            child:  Icon(
              Icons.search_rounded,
              color: AppColors.kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(14),
          ),
          contentPadding: const EdgeInsets.only(
            bottom: 30,
            left: 20,
            right: 20,
          ),
        ),
      ),
    );
  }
}
