import 'package:lp/admin/models/messages_model.dart';
import 'package:lp/core/mangers/colors.dart';
import 'package:flutter/material.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_cubit.dart';
Widget builtMessage(Messages model,context)=>Align(
  alignment: AlignmentDirectional.centerStart,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration:BoxDecoration(
          color:Colors.grey.withOpacity(0.8),
          borderRadius:const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(10.0),
            topEnd: Radius.circular(10.0),
            topStart: Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(model.content!),
      ),
    ],
  ),
);
Widget builtMyMessage(Messages model,context)=>Align(
  alignment: AlignmentDirectional.centerEnd,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        decoration:BoxDecoration(
          color:ElktraCubit.get(context).dark?AppColorsDarkTheme.defaultColor:AppColorsLightTheme.defaultColor,
          borderRadius:const BorderRadiusDirectional.only(
            bottomStart: Radius.circular(10.0),
            topEnd:Radius.circular(10.0),
            topStart: Radius.circular(10.0),
          ),
        ),
        padding:const EdgeInsets.symmetric(
          vertical:5.0,
          horizontal:10.0,
        ),
        child: Text(model.content!,style:const TextStyle(color: Colors.white)),

      ),
    ],
  ),
);