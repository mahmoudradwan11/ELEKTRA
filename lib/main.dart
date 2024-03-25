import 'package:lp/core/Ui_controller/ui_cubit.dart';
import 'package:lp/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:lp/core/admin_controller/admin_version_cubit/admin_version_cubit.dart';
import 'package:lp/core/mangers/routes.dart';
import 'package:lp/core/mangers/themes/dark.dart';
import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/network/remote/payment/payment_helper.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/core/payment/payment_cubit/payment_cubit.dart';
import 'package:lp/core/user_controller/chat_cubit/chat_cubit.dart';
import 'package:lp/core/user_controller/contact_cubit/contact_cubit.dart';
import 'package:lp/core/user_controller/db_cubit/db_cubit.dart';
import 'package:lp/core/user_controller/favorite_cubit/favorite_cubit.dart';
import 'package:lp/core/user_controller/forget_password_cubit/forget_password_cubit.dart';
import 'package:lp/core/user_controller/login_cubit/login_cubit.dart';
import 'package:lp/core/user_controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:lp/core/user_controller/review_cubit/review_cubit.dart';
import 'package:lp/core/user_controller/search_cubit/search_cubit.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/mangers/themes/light.dart';
import 'core/network/local/cache_helper.dart';
import 'core/observer.dart';
import 'core/user_controller/cart_cubit/cart_cubit.dart';
import 'core/user_controller/register_cubit/register_cubit.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelperStore.init();
  await DioHelperPayment.initDio();
  Bloc.observer = MyBlocObserver();
  bool? mode = CacheHelper.getData(key: 'mode');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  nationalId = CacheHelper.getData(key: 'userId');
  board = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print('Token = $token');
  print('National Id = $nationalId');
  print('Boarding =$board');
  if (board != null) {
    if (token != null) {
      if (nationalId == adminId) {
        nextScreen = Routes.adminHomeRoute;
      } else {
        nextScreen = Routes.userHomeRoute;
      }
    } else {
      nextScreen = Routes.loginRoute;
    }
  } else {
    nextScreen = Routes.onBoardingRoute;
  }
  runApp(MyApp(
    appMode: mode,
  ));
}

class MyApp extends StatelessWidget {
  final bool? appMode;
  const MyApp({super.key, this.appMode});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => OnboardingCubit(),
            lazy: true,
          ),
          BlocProvider(create:(context)=>ContactUsCubit(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => PaymentCubit()..getAuthToken(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => ChatCubit()..getMessagesBetweenAdminAndUser(nationalId),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => SearchCubit()..searchProduct(keyword: ''),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => ForgetPasswordCubit(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => ReviewCubit(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => AdminUsersCubit()
              ..getUsers()
              ..getUserData(),
            lazy: false,
          ),
          BlocProvider(
              create: (context) => AdminVersionCubit()..getAdminData()
                ..getCompaniesSales()
              ..getCategriesProducts(),
              lazy: false),
          BlocProvider(
            create: (context) => ElktraCubit()
              ..changeAppMode(fromShared: appMode)
              ..start(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => AppUiCubit(),
            lazy: true,
          ),
          BlocProvider(
            create: (context) => FavoriteCubit()..getMyFavorite(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => CartCubit()
              ..getMyCart()
              ..getTotalPrice(),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => DatabaseCubit()..createDatabase(),
            lazy: false,
          ),

        ],
        child: BlocConsumer<ElktraCubit, ElktraStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = ElktraCubit.get(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Elektra',
                initialRoute: Routes.splashRoute,
                onGenerateRoute: RouteGenerator.getRoutes,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: cubit.dark ? ThemeMode.dark : ThemeMode.light,
              );
            }));
  }
}