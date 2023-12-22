import 'package:lp/core/mangers/icon_broken.dart';
import 'package:lp/user/screens/cart.dart';
import 'package:lp/user/screens/category.dart';
import 'package:lp/user/screens/favorite.dart';
import 'package:lp/user/screens/products.dart';
import 'package:lp/user/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
List<Widget> userHomeScreens =const[
  ProductsScreen(),
  FavoriteScreen(),
  CartScreen(),
  CategoryScreen(),
  SettingsScreen(),
];
List<GButton> bottomBavBarTabs =const [
  GButton(
    icon: IconBroken.Home,
    text: 'Home',
  ),
   GButton(
    icon: Icons.favorite,
    text: 'Favorite',
  ),
  GButton(
    icon:IconBroken.Bag_2,
    text: 'Cart',
  ),
  GButton(
    icon: IconBroken.Category,
    text: 'Category',
  ),
   GButton(icon: Icons.settings, text: 'Setting')
];