import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:state_management/application/user/controller/user_controller.dart';
import 'package:state_management/presentation/user/widgets/add_user_dialog.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (userController) => Scaffold(
        body: ListView.builder(
            itemCount: userController.getListUserData.length,
            itemBuilder: (context, index) => Slidable(
                  // Specify a key if the Slidable is dismissible.
                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: (context) {
                          Get.put(UserController()).deleteDataToList(
                              userController.getListUserData[index]);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title:
                        Text(userController.getListUserData[index].name ?? ''),
                    subtitle: Text(
                        '${userController.getListUserData[index].job ?? ''}\n${userController.getListUserData[index].createdAt ?? ''}'),
                    isThreeLine: true,
                    leading:
                        Text(userController.getListUserData[index].id ?? ''),
                  ),
                )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(title: "Tambah User", content: AddUserDialog());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
