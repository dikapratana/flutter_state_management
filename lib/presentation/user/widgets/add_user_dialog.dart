import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:state_management/application/user/controller/user_controller.dart';
import 'package:state_management/application/user/cubit/user_cubit.dart';
import 'package:state_management/domain/core/user/model/user_req_res.dart';

class AddUserDialog extends StatelessWidget {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final userController = Get.put(UserController());

  AddUserDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () {},
              success: (value) {
                userController.addDataToList(value.userData);
                Navigator.pop(context);
              });
        },
        builder: (context, state) {
          return Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Nama'),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: jobController,
                decoration: const InputDecoration(hintText: 'Job'),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(bottom: 1),
                child: ElevatedButton(
                    onPressed: () {
                      final data = RequestData(
                          name: nameController.text, job: jobController.text);
                      context.read<UserCubit>().createNewUSer(data);
                    },
                    child: const Text('Tambah Data')),
              )
            ],
          );
        },
      ),
    );
  }
}
