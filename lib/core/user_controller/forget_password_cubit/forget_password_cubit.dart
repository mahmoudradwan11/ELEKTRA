import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/core/user_controller/forget_password_cubit/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>{
  ForgetPasswordCubit() : super(ForgetPasswordInitStates());
  static ForgetPasswordCubit get(context)=>BlocProvider.of(context);
  void resetPassword(nationalId,newPassword){
    emit(ResetPasswordLoadingState());
    DioHelperStore.postData(url:ApiConstants.forgetPasswordApi, data:{
      "nationalId": nationalId,
      "newPassword": newPassword,
    }).then((value){
      emit(ResetPasswordDone());
    }).catchError((error){
      print(error.toString());
      emit(ErrorResetPassword());
    });
  }
}