import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trilling_web/features/auth/domain/entities/appuser.dart';
import 'package:trilling_web/features/auth/domain/repositries/auth_repo.dart';
import 'package:trilling_web/features/auth/infrastructure/repositries/auth_imp.dart';
import 'package:trilling_web/features/auth/presentation/home_page/core/sidemenuItem.dart';
import 'package:trilling_web/features/auth/presentation/login_page/bloc/auth_bloc/auth_bloc.dart';
import 'package:trilling_web/features/auth/presentation/login_page/core/logo.dart';
import 'package:trilling_web/injection.dart';

class HomePage extends StatelessWidget {
  AppUser? appUser;
  HomePage({
    Key? key,
    this.appUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // appUser ??= sl.get<Auth_Repo>().currentAppUser()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Trilling Party Service',
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 5,
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        sl.get<Auth_Repo>().signOut();
                      },
                      child: Text('sad')),
                  SideMenuItem(
                    height: height,
                    text: 'Home',
                    iconData: Icons.home,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
