import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/core/utils/colors.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/presentation/bloc/home_navigator_bloc/home_navigator_bloc.dart';
import 'package:trilling_web/features/auth/presentation/home_page/core/side_menu.dart';
import 'package:trilling_web/features/client_feature/presentation/bloc/clients_page_bloc/clients_page_bloc.dart';

import 'package:trilling_web/features/client_feature/presentation/pages/clients_page.dart';
import 'package:trilling_web/features/core_feature/presentation/bloc/corebloc/core_bloc.dart';
import 'package:trilling_web/features/core_feature/presentation/pages/admin_page.dart';
import 'package:trilling_web/features/order_feature/presentation/pages/order_page/orders_page.dart';
import 'package:trilling_web/features/product_feature/presentation/bloc/products_bloc.dart';
import 'package:trilling_web/features/product_feature/presentation/pages/products_page.dart';

import 'package:trilling_web/injection.dart';

class HomePage extends StatelessWidget {
  final AppUser? appUser;
  const HomePage({
    Key? key,
    this.appUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // appUser ??= sl.get<Auth_Repo>().currentAppUser()!;

    List sideMenuList = [
      {'text': 'Home', 'icon': Icons.home, 'page': const Placeholder()},
      {'text': 'Kunden', 'icon': Icons.people, 'page': const ClientsPage()},
      {
        'text': 'Besellungen',
        'icon': Icons.shopping_cart,
        'page': const OrdersPage()
      },
      {
        'text': 'Product',
        'icon': Icons.shopping_cart_rounded,
        'page': const ProductPage()
      },
      {
        'text': 'Admin',
        'icon': Icons.admin_panel_settings_rounded,
        'page': const AdminPage()
      },
    ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<HomeNavigatorBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl.get<ClientsPageBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: Text(
            'Trilling Party Service',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SideMenu(height: height, sideMenuList: sideMenuList),
              Flexible(
                // width: context.getWidth() ,
                child: BlocBuilder<HomeNavigatorBloc, HomeNavigatorState>(
                    builder: ((context, state) {
                  HomeNavigatorBloc homeNavigatorBloc =
                      BlocProvider.of<HomeNavigatorBloc>(context);
                  return sideMenuList[homeNavigatorBloc.currentIndex]['page'];
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
