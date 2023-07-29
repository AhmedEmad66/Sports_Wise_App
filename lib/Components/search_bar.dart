import 'package:flutter/material.dart';
import 'package:sport_wise_app/Res/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.hintText,
    required this.width,
  });
  final String hintText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xff3A3A3A),
        ),
        color: const Color(0xff2D2D2D),
      ),
      child: TextFormField(
        cursorColor: AppColors.kPrimaryColor,
        style: const TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 16,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(116, 116, 116, 1),
            fontSize: 16,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: Color(0xff707070),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(14),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
        ),
      ),
    );
  }
}
