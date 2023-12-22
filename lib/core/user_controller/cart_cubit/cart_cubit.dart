import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/network/remote/api_constants.dart';
import 'package:lp/core/network/remote/store/dio_helper.dart';
import 'package:lp/core/user_controller/cart_cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lp/user/models/cart_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);
  CartModel? cartModel;
  void getMyCart() {
    DioHelperStore.getData(url: ApiConstants.geyMyCartApi, data: {
      "nationalId":nationalId,
    }).then((value) {
      cartModel = CartModel.fromJson(value.data);
      print('Number Of Products In Cart =${cartModel!.products!.length}');
      emit(GetCart());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetCart());
    });
  }
  TotalCart? totalCart;
  void getTotalPrice(){
    DioHelperStore.getData(url: ApiConstants.getTotalPriceApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      totalCart = TotalCart.fromJson(value.data);
      print("Total=${totalCart!.totalPrice!}");
      emit(GetTotal());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetTotal());
    });
  }

  void deleteFromCart(productId) {
    DioHelperStore.delData(
        url: ApiConstants.deleteCartApi,
        data: {"nationalId": nationalId, "productId": productId}).then((value) {
      print('Deleted');
      emit(DeleteCart());
      getMyCart();
      getTotalPrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDeleteCart());
    });
  }

  void addToMyCart(productId) {
    DioHelperStore.postData(url: ApiConstants.addToCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1"
    }).then((value) {
      print('Add');
      emit(AddToCart());
      getMyCart();
      getTotalPrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddToCart());
    });
  }

  void updateQuantity(productId, quantity) {
    DioHelperStore.putData(url: ApiConstants.updateQuantityApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": quantity
    }).then((value) {
      print('Update');
      emit(UpdateQuantity());
      getMyCart();
      getTotalPrice();
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateQuantity());
    });
  }
}