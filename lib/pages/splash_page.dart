import 'dart:developer';

import 'package:firebase_auth_bloc/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unauthentificated) {
          Navigator.pushNamedAndRemoveUntil(context, SigninPage.routeName,
              (route) {
            log('listener : $state');
            log('ModalRoute : ${ModalRoute.of(context)!.settings.name}');
            return route.settings.name == ModalRoute.of(context)!.settings.name
                ? true
                : false;
          });
        } else if (state.authStatus == AuthStatus.authentificated) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        return const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
