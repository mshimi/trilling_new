import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:trilling_web/core/presentation/theme.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/presentation/home_page/home_page.dart';
import 'package:trilling_web/features/auth/presentation/login_page/login_page.dart';
import 'package:trilling_web/features/client_feature/export.dart';
import 'package:trilling_web/features/client_feature/presentation/pages/client_page.dart';
import 'package:trilling_web/features/client_feature/presentation/pages/new_client_page.dart';
import 'package:trilling_web/features/order_feature/domain/entities/order.dart'
    as OrderItem;
import 'package:trilling_web/features/order_feature/domain/entities/transfer.dart';
import 'package:trilling_web/features/order_feature/presentation/pages/liefer_schein_page.dart';
import 'package:trilling_web/features/order_feature/presentation/pages/new_order_page/new_order_page.dart';
import 'package:trilling_web/injection.dart';

import 'features/core_feature/presentation/bloc/corebloc/core_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // sl.get<Auth_Repo>().isAuthenticated();

    // ignore: no_leading_underscores_for_local_identifiers
    final GoRouter _router = GoRouter(
      redirectLimit: 100,
      initialLocation: '/',
      redirect: (state) {
        final loggedIn = sl.get<Auth_Repo>().isAuthenticated();
        final loggingIn = state.location == '/login';

        // add ! to the below line !loggedIn
        if (!loggedIn) return loggingIn ? null : '/login';

        if (loggingIn && loggedIn) return '/';

        return null;
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return HomePage(
                appUser: sl.get<Auth_Repo>().currentAppUser(),
              );
            },
            routes: [
              GoRoute(
                  path: 'Clients/:cid/neworder',
                  builder: (context, state) {
                    Client client = state.extra as Client;

                    return NewOrderPage(
                      client: client,
                    );
                  }),
              GoRoute(
                path: 'Clients/newClient',
                builder: (context, state) => NewClientPage(),
              ),
              GoRoute(
                  path: 'Clients/:cid/lieferscheid/:oid',
                  builder: (context, state) {
                    OrderItem.Order order = state.extra as OrderItem.Order;
                    final String clientId = state.params['cid']!;
                    final String orderId = state.params['oid']!;
                    return LieferScheinPage(
                      orderItem: order,
                    );
                  }),
              GoRoute(
                path: 'Clients/:cid',
                builder: (context, state) {
                  // use state.params to get router parameter values

                  final String clientId = state.params['cid']!;

                  return ClientPage(
                    clientId: clientId,
                    client: state.extra == null ? null : state.extra as Client,
                  );
                },
              ),
            ]),
      ],
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<CoreBloc>()..add(GetCoreDataEvent()),
          lazy: false,
        ),
      ],
      child: MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(500, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: whiteColor),
        ),
      ),
    );
  }
}
