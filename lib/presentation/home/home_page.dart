// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:state_management/application/profile/bloc/profileb_bloc.dart';
import 'package:state_management/domain/auth/model/login_response.dart';
import 'package:state_management/domain/core/user/model/user_response.dart';
import 'package:state_management/presentation/sign_in/sign_in_page.dart';
import 'package:state_management/utils/constants.dart' as constants;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late LoginResponse loginResponse;

  @override
  void initState() {
    final data = GetStorage().read(constants.userLocalKey);
    loginResponse = LoginResponse.fromJson(jsonDecode(data));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfilebBloc()..add(const ProfilebEvent.getAllUserData()),
      child: BlocConsumer<ProfilebBloc, ProfilebState>(
        listener: (context, state) {
          // TODO: implement listener
          state.maybeMap(
              orElse: () {},
              isLoading: (value) {
                print("is loading");
              },
              isSuccess: (value) {
                print(value.userResponse.toJson());
              });
        },
        builder: (context, state) {
          return state.maybeMap(
              orElse: () => homePageError(context),
              isLoading: (value) => homePageLoading(),
              isSuccess: (value) =>
                  homePageScaffold(value.userResponse.data ?? []),
              isError: (value) => homePageError(context));
        },
      ),
    );
  }

  Scaffold homePageError(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Shomething Wrong'),
          IconButton(
              onPressed: () {
                context
                    .read<ProfilebBloc>()
                    .add(const ProfilebEvent.getAllUserData());
              },
              icon: const Icon(Icons.replay))
        ],
      ),
    ));
  }

  Scaffold homePageLoading() {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Scaffold homePageScaffold(List<ListData> data) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loginResponse.token ?? ''),
        actions: [
          IconButton(
              onPressed: () {
                GetStorage().erase();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index].avatar ?? ''),
                    ),
                    title: Text(data[index].firstName ?? ''),
                    subtitle: Text(data[index].email ?? ''),
                  ))),
    );
  }
}
