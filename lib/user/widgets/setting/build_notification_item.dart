import 'package:flutter/material.dart';
import 'package:lp/core/mangers/icon_broken.dart';
import 'package:lp/user/widgets/setting/setting_general_item.dart';

Widget buildNotfacitionItem(context)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildSettingGeneralItem(title:'Chats',
          subtitle:'Apply Chat Notifications',
          icon:IconBroken.Chat,
          context: context,
          screen:'',
      ),
      SizedBox(height: 20,),
      buildSettingGeneralItem(title:'Product',
        subtitle:'Apply Product Notifications',
        icon:IconBroken.Buy,
        context: context,
        screen:'',
      ),
      SizedBox(height: 20,),
      buildSettingGeneralItem(title:'Orders',
        subtitle:'Apply Orders Notifications',
        icon:Icons.payment,
        context: context,
        screen:'',
      ),
    ],
  ),
);