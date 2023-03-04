import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/application/auth/cubit/auth_cubit.dart';
import 'package:state_management/domain/auth/model/login_request.dart';
import 'package:state_management/presentation/home/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // implement listener
          if (state is AuthError) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text('error'),
                      content: Text(state.errorMessage),
                    ));
          } else if (state is AuthLoading) {
            print('loading');
          } else if (state is AuthLoginSuccess) {
            print(state.dataLogin);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    HomePage(loginResponse: state.dataLogin)));
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.grey.shade800,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ListTile(
                        title: TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Email address:",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: Colors.white30,
                          )),
                    )),
                    Divider(
                      color: Colors.grey.shade600,
                    ),
                    ListTile(
                        title: TextField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Password:",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: Colors.white30,
                          )),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: (state is AuthLoading)
                              ? _loadingButton()
                              : _loginButton(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Forgot your password?',
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ));
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan,
      ),
      onPressed: () {
        // panggil cubit to post user
        final requestData = LoginRequest(
            email: _emailController.text, password: _passwordController.text);
        context.read<AuthCubit>().signInUser(requestData);
      },
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white70, fontSize: 16.0),
      ),
    );
  }

  ElevatedButton _loadingButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan,
      ),
      onPressed: null,
      child: const Text('loading...'),
    );
  }
}
