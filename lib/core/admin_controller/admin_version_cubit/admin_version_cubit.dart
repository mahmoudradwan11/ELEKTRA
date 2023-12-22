import 'package:bloc/bloc.dart';
import 'package:lp/core/admin_controller/admin_version_cubit/admin_version_states.dart';
import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/user/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminVersionCubit extends Cubit<AdminVersionStates>{
  AdminVersionCubit() : super(AdminInitState());
  static AdminVersionCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void getAdminData(){
    DioHelperStore.postData(url: ApiConstants.profileApi,data:{
      'token':token
    }).then((value){
     userModel = UserModel.fromJson(value.data);
     print(userModel!.user!.email!);
     emit(GetAdminData());
    }).catchError((error){
     print(error.toString());
     emit(ErrorGetAdminData());
    });
  }

}