


import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../Res/app_colors.dart';

class CountriesLoadingStateWidget extends StatelessWidget {
  const CountriesLoadingStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 247, 247, 247).withOpacity(0.4),
        highlightColor: const Color.fromARGB(255, 255, 255, 255)
            .withOpacity(0.1),
        child: GridView.custom(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                1.5,
                crossAxisRatio: 1.0,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 30,
            (context, index) => Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.kMyLightGrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ));
  }
}