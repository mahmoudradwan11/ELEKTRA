import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:lp/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:lp/core/mangers/colors.dart';
import 'package:lp/core/mangers/values.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_cubit.dart';
Widget buildPaymentComponent(context)=>Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CreditCardWidget(
      chipColor: Colors.grey,
      bankName: 'National Bank of Egypt',
cardBgColor:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
      cardNumber:'4242424242424242',
      expiryDate:'12/25',
      cardHolderName:AdminUsersCubit.get(context).profileModel!.user!.name!,
      labelCardHolder: 'CARD HOLDER',
      cvvCode:'123',
      obscureCardNumber: true,
      obscureInitialCardNumber:false,
      obscureCardCvv: false,
      cardType: CardType.mastercard,
      isHolderNameVisible: true,
      showBackView:false,
      onCreditCardWidgetChange: (CreditCardBrand brand) {},
      enableFloatingCard: false,
    ),
    Container(
      color: Colors.transparent,
      height: 180,
    ),
    const Align(
      alignment: AlignmentDirectional.center,
        child: Text('Powered By Paymob ',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.w600,fontSize: AppFontsSize.fontSize18),))
  ],
);