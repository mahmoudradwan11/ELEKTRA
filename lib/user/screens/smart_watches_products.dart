import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lp/core/Ui_controller/ui_cubit.dart';
import 'package:lp/core/Ui_controller/ui_states.dart';
import 'package:lp/core/lists/tapbar.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_cubit.dart';
import 'package:lp/core/user_controller/user_version_cubit/user_version_states.dart';
import 'package:lp/user/widgets/build_tapbar_item.dart';
import 'package:lp/user/widgets/product_item.dart';

class SmartWatchesProducts extends StatelessWidget {
  const SmartWatchesProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Watches'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          BlocConsumer<AppUiCubit,AppUiStates>(
            listener:(context,state){},
            builder:(context,state){
              var cubit = AppUiCubit.get(context);
                    return BlocConsumer<ElktraCubit,ElktraStates>(listener:(context,state){},
                      builder:(context,state){
                      var cubit = ElktraCubit.get(context);
                      return Container(
                        color: Colors.transparent,
                        child: GridView.count(
                          childAspectRatio: 1 / 1.3,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(
                              cubit.homeSmartWatch!.product!.length,
                                  (index) =>
                                  buildProductItem(cubit.homeSmartWatch!.product![index],context)),
                        ),
                      );
                      },
                    );
                  }
          )
        ],
    ),
      ),
    );
  }
}
