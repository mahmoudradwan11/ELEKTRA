import 'package:lp/core/lists/user_home_screens.dart';
import 'package:lp/core/mangers/colors.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElktraCubit, ElktraStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ElktraCubit.get(context);
          return Scaffold(
            body: userHomeScreens[cubit.currentHomeScreenIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color:cubit.dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                    borderRadius: BorderRadius.circular(23)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 10, top: 8),
                  child: GNav(
                    tabBorderRadius:23,
                    gap: 7,
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    activeColor:cubit.dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
                    tabBackgroundColor: Colors.white,
                    onTabChange: (index) {
                      cubit.changeUserHomeScreen(index);
                    },
                    padding: const EdgeInsets.only(left: 13,bottom: 6,right: 13,top: 6),
                    tabs:bottomBavBarTabs,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
