import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/core/widgets/base_layout.dart';
import 'package:pfefront/core/widgets/custom_drop_dow_button.dart';
import 'package:pfefront/screens/profile/login_screen.dart';

class EditProfileScreen extends GetView<ProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> civilityTitle = [
      "Ms",
      "Mrs.",
      "Mr.",
      "Miss.",
      "Not Specified",
      "Prefer Not to say"
    ];
    return BaseLayout(
      appBar: AppBar(
          //  backgroundColor: Colors.blue,

          ),
      widget: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.keyForm,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Modifie Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Image.asset(
                  "assets/images/edit-profile-.png",
                  width: 180,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: controller.userNameController,
                  decoration: const InputDecoration(
                    label: Text("UserName"),
                    hintText: "tapez votre username ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: "tapez votre email ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.phoneController,
                  decoration: const InputDecoration(
                    label: Text("Phone"),
                    hintText: "tapez votre phone ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<ProfileController>(
                    builder: (controller) => InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              useSafeArea: true,
                              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                              exclude: <String>['KN', 'MF'],
                              favorite: <String>['SE'],
                              //Optional. Shows phone code before the country name.
                              showPhoneCode: true,
                              onSelect: (Country country) {
                                controller.selectCountry(
                                    country.displayNameNoCountryCode);
                                print(
                                    'Select country: ${country.displayName} ${country.e164Sc} ${country.e164Key} ');
                              },
                              // Optional. Sheet moves when keyboard opens.
                              moveAlongWithKeyboard: false,
                              // Optional. Sets the theme for the country list picker.
                              countryListTheme: CountryListThemeData(
                                // Optional. Sets the border radius for the bottomsheet.
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                // Optional. Styles the search field.
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                // Optional. Styles the text in the search field
                                searchTextStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context)
                                .width, // Largeur du container
                            //   height: 150, // Hauteur du container
                            padding: const EdgeInsets.all(
                                18), // Espace intérieur du container
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors
                                      .black), // Bordure arrondie du container
                            ),
                            child: Text(
                              controller.selectedValueCountry,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        )),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.codePostaleController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Code Postale"),
                    hintText: "tapez votre code postale ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                ),
                // GetBuilder<ProfileController>(builder: (controller) {
                //   return CustomDropDowButton(
                //     hintText: "civility tilte",
                //     selectedValue: controller.selectedValueCivilityTitle,
                //     list: civilityTitle,
                //     onChanged: (p0) =>
                //         controller.onChnagedDropDownCivilityTitle(p0!),
                //   );
                // }),

                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 20)),
                  onPressed: () {
                    if (controller.keyForm.currentState!.validate()) {
                      print('form valide');
                    }
                  },
                  child: const Text(
                    "Modeifie",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
