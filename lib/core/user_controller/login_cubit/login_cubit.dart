import 'package:lp/core/mangers/toast.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/core/user_controller/login_cubit/login_states.dart';
import 'package:lp/user/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? loginModel;
  IconData suffixIcon = Icons.visibility;
  bool passwordShow = true;

  void loginUser({required String email, required String password}) {
    emit(LoadingLogin());
    DioHelperStore.postData(url: ApiConstants.loginApi, data: {
      "email": email,
      "password": password
    }).then((value) {
      loginModel = UserModel.fromJson(value.data);
      if (loginModel!.message != 'User logged in successfully') {
        showToast(loginModel!.message!, ToastStates.ERROR);
      }
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error);
      emit(LoginFailedState(error.toString()));
    });
  }

  void changePasswordIcon() {
    passwordShow = !passwordShow;
    suffixIcon =
    passwordShow ? Icons.visibility : Icons.visibility_off_outlined;
    emit(ChangePasswordVisState());
  }
}