import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/core/user_controller/search_cubit/search_states.dart';
import 'package:lp/user/models/search_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitState());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;
  void searchProduct({required keyword}) {
    DioHelperStore.getData(url: ApiConstants.searchApi, data: {'keyword': keyword})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.allProducts!.length);
      print(searchModel!.allProducts!.length);
      print(searchModel!.allProducts!.length);
      emit(SearchSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearch());
    });
  }
}