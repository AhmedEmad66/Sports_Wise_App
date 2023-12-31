import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sport_wise_app/Data/Cubits/Available_Countries_Cubit/available_countries_cubit.dart';
import 'package:sport_wise_app/Data/Cubits/Country_Leagues_Cubit/country_leagues_cubit.dart';
import 'package:sport_wise_app/Data/Repositories/each_country_leagues_repo.dart';
import 'package:sport_wise_app/Res/app_strings.dart';
import 'package:sport_wise_app/Routes/leagues_screen.dart';
import '../Components/custom_back_arrow.dart';
import '../Res/app_colors.dart';
import '../Res/app_images.dart';
import '../generated/l10n.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});
  // Named Route
  static const String id = "CountriesScreen";

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    context.read<AvailableCountriesCubit>().getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //To Avoid the keyboard size
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBackGroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppImages.kMainBG),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppStrings.kAppLanguage == "en"
                      ? const CustomBackArrowLeft()
                      : const CustomBackArrowRight(),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    S.of(context).countryScreenTitle,
                    style:  const TextStyle(
                      fontSize: 30,
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<AvailableCountriesCubit,
                    AvailableCountriesState>(
                  builder: (context, state) {
                    if (state is AvailableCountriesLoading) {
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
                    } else if (state is AvailableCountriesSuccess) {
                      var ourCountries = state.countriesResponse.result!;
                      return GridView.custom(
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
                          childCount: ourCountries.length,
                          (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LeaguesScreen()));

                              countryId = ourCountries[index].countryKey;
                              context.read<CountryLeaguesCubit>().getLeagues();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kMyDarkGrey,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    ourCountries[index].countryLogo ??
                                        AppImages.kImageNotFound,
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  ourCountries[index].countryName ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    backgroundColor:
                                        AppColors.kMyDarkGrey.withOpacity(0.5),
                                    fontSize: 15,
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.kMyWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Requst is Faild",
                          style: TextStyle(
                            color: AppColors.kMyWhite,
                            fontFamily: "Ubuntu",
                            fontSize: 25,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
