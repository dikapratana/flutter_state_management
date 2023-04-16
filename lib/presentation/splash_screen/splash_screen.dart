import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/application/auth/cubit/auth_cubit.dart';
import 'package:state_management/presentation/home/home_page.dart';
import 'package:state_management/presentation/sign_in/sign_in_page.dart';
import 'package:state_management/presentation/user/user_page.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..loadUserFromLocal(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthLoginSuccess) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const UserPage()));
          } else if (state is AuthError) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignInPage()));
          }
        },
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
