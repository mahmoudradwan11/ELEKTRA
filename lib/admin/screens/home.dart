import 'package:lp/admin/screens/users.dart';
import 'package:lp/core/admin_controller/admin_users_cubit/admin_users_cubit.dart';
import 'package:lp/core/admin_controller/admin_users_cubit/admin_users_states.dart';
import 'package:lp/core/admin_controller/admin_version_cubit/admin_version_cubit.dart';
import 'package:lp/core/admin_controller/admin_version_cubit/admin_version_states.dart';
import 'package:lp/core/mangers/colors.dart';
import 'package:lp/core/mangers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminVersionCubit,AdminVersionStates>(listener: (context, state) {},
    builder:(context,state){
      var cubit = AdminVersionCubit.get(context);
      if(cubit.userModel==null){
        return Scaffold(
          appBar: AppBar(),
          body:Center(
            child: CircularProgressIndicator(
              color: AppColorsLightTheme.defaultColor,
            ),
          ),
        );
      }
      return Scaffold(
        appBar: AppBar(
         actions:[Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<AdminUsersCubit,AdminUsersStates>(
                listener:(context,state){},
                builder:(context,state) {
                  return IconButton(
                      onPressed: () {
                        AdminUsersCubit.get(context).userLayout(context);
                      },
                      icon: const Icon(Icons.logout));
                }
            ),
          ),
      ]
        ),
        drawer:Drawer(
          child: ListView(
            children: [
          UserAccountsDrawerHeader(
            arrowColor: AppColorsLightTheme.defaultColor,
          accountName: Text('${cubit.userModel!.user!.name}'),
          accountEmail: Text('${cubit.userModel!.user!.email}'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('${cubit.userModel!.user!.profileImage}'),
          ),
        ),
        ListTile(

            title: const Text('Users'),
            leading: const Icon(Icons.person),
            onTap: () {
              navigateToNextScreen(context, const UsersScreen());
            },
        ),
        ],
      ),
        ),
      );
    },
    );
  }
}
