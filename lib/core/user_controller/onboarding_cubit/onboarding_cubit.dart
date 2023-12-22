import 'package:lp/core/mangers/routes.dart';
import 'package:lp/core/network/local/cache_helper.dart';
import 'package:lp/core/user_controller/onboarding_cubit/onboarding_states.dart';
import 'package:lp/user/screens/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnBoardingStates> {
  OnboardingCubit() : super(OnBoardingInitState());
  static OnboardingCubit get(context) => BlocProvider.of(context);
  bool isPageLast = false;
  int screenIndex = 0;
  void pageChangeLast(index){
    isPageLast = true;
    screenIndex = index;
    emit(PageLast());
  }

  void pageNotLast(index) {
    isPageLast = false;
    screenIndex = index;
    emit(NotPageLast());
  }

  void printLast() {
    print(isPageLast);
  }
  void submit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinishThisScreen(context, RegisterScreen());
      }
    });
  }
}
