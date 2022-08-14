import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/extentions/mediaquery_extention.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/auth/presentation/bloc/home_navigator_bloc/home_navigator_bloc.dart';
import 'package:trilling_web/features/auth/presentation/home_page/core/sidemenuItem.dart';

class SideMenu extends StatelessWidget {
  List sideMenuList;
  double height;
  SideMenu({
    Key? key,
    required this.height,
    required this.sideMenuList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.getWidth() * 0.20,
      color: darkBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.separated(
            controller: ScrollController(),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
              shrinkWrap: true,
              itemCount: sideMenuList.length,
              itemBuilder: (context, index) {
                var sideMenuItem = sideMenuList[index];
                return BlocBuilder<HomeNavigatorBloc, HomeNavigatorState>(
                  builder: (context, state) {
                    return SideMenuItem(
                      iselected: BlocProvider.of<HomeNavigatorBloc>(context)
                              .currentIndex ==
                          index,
                      onTap: () {
                        BlocProvider.of<HomeNavigatorBloc>(context)
                            .add(IndexChangeEvent(index: index));
                      },
                      height: height,
                      text: sideMenuItem['text'],
                      iconData: sideMenuItem['icon'],
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
