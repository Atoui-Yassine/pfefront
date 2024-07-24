import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';
import 'package:pfefront/core/networking/app_api.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/screens/profile/edit_profile_screen.dart';
import 'package:pfefront/screens/profile/new_password_screen.dart';

class CustomDrawer extends GetView<ProfileController> {
  CustomDrawer({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   //     padding: const EdgeInsets.all(10.0),
                    //   decoration: BoxDecoration(
                    //     //  color: APP,
                    //     borderRadius: BorderRadius.circular(15.0),
                    //   ),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       GetBuilder<ProfileController>(
                    //         builder: (controller) => InkWell(
                    //           child: controller.pickedFile != null &&
                    //                   controller.fileBytes != null
                    //               ? CircleAvatar(
                    //                   radius: 50.0,
                    //                   backgroundImage: MemoryImage(
                    //                     controller.fileBytes!,
                    //                   ),
                    //                 )
                    //               : CircleAvatar(
                    //                   radius: 30.0,
                    //                   backgroundImage: NetworkImage(
                    //                     "${AppApi.getImageUrl}${controller.photoController!.text}",
                    //                   ),
                    //                 ),
                    //           onTap: () {
                    //             controller.pickFile();
                    //           },
                    //         ),
                    //       ),
                    //       const SizedBox(width: 5),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const SizedBox(
                    //               height: 20,
                    //             ),
                    //             Text(
                    //               '${AppStorage.readName()}', // Afficher dynamiquement le nom d'utilisateur
                    //               style: const TextStyle(
                    //                 fontSize: 16.0,
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //             ),
                    //             Text(
                    //               '${AppStorage.readEmail()}', // Afficher dynamiquement l'e-mail
                    //               style: TextStyle(
                    //                 fontSize: 14.0,
                    //                 color: Colors.grey[600],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                 
                 
                 
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.white, // Couleur de fond du container
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: SettingsGroup(
                        items: [
                          SettingsItem(
                            onTap: () {
                              Get.to(const EditProfileScreen());
                            },
                            icons: Icons.edit_outlined,
                            title: "Edit Profile",
                          ),
                          SettingsItem(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const NewPasswordScreen()));
                              // controller.showChangePasswordDialog(context);
                            },
                            icons: Icons.lock_rounded,
                            title: "Change Password",
                          ),
                          // SettingsItem(
                          //   onTap: () {},
                          //   icons: Icons.language,
                          //   title: "Language",
                          //   subtitle: "English",
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.blue,
              ),
              title: const Text('Log out'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content: const Text(
                          'Êtes-vous sûr de vouloir vous déconnecter ?'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text('Annuler'),
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Fermer le AlertDialog
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Déconnexion'),
                          onPressed: () {
                            controller.logOut();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
