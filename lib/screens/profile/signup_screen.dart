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

class SignUpScreen extends GetView<ProfileController> {
  const SignUpScreen({super.key});

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
      widget: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.keyFormSignUp,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre username";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre email";
                    } else if (!EmailValidator.validate(value)) {
                      return "tapez un email valide";
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre phone";
                    } else if (value.length < 8) {
                      return "tapez un phone number valide";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.nationnaliteController,
                  decoration: const InputDecoration(
                    label: Text("Nationalite"),
                    hintText: "tapez votre nationalite ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre nationalite";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.villeDeNaissanceController,
                  decoration: const InputDecoration(
                    label: Text("Ville De Naissance"),
                    hintText: "tapez votre Ville De Naissance ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.villa,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre Ville De Naissance";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
GetBuilder<ProfileController>(
                    builder: (controller) => TextFormField(
                      readOnly: true,
                      onTap: () =>    showCountryPicker(
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
                            )
                          ,
                      controller: controller.countryControllerController,
                      decoration: const InputDecoration(
                        label: Text("Pays De Naissance"),
                        //   hintText: "tapez votre Ville De Naissance ",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.villa,
                          color: Colors.grey,
                        ),
                      ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return " sil vous plait tapez votre Ville De Naissance";
                      //     }
                      //     return null;
                      //   },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre code postale ";
                    } else if (value.length < 4) {
                      return "tapez un code postale valide";
                    }
                    return null;
                  },
                ),
                GetBuilder<ProfileController>(
                  builder: (controller) => DropdownButton(
                      hint: const Text('role'),
                      // Initial Value
                      value: controller.selectedValue,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),

                      // Array list of items
                      items: controller.listRole.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (value) {
                        controller.onChnagedDropDown(value!);
                      }),
                ),
                GetBuilder<ProfileController>(
                  builder: (controller) => DropdownButton(
                      hint: const Text("civility tilte"),
                      // Initial Value
                      value: controller.selectedValueCivilityTitle,

                      // Down Arrow Icon
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),

                      // Array list of items
                      items: civilityTitle.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (value) {
                        controller.onChnagedDropDownCivilityTitle(value!);
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<ProfileController>(
                  builder: (controller) => Row(
                    children: [
                      Visibility(
                        visible: controller.visibility,
                        child: InkWell(
                          child: Container(
                              width: MediaQuery.sizeOf(context).width *
                                  0.9, // Largeur du container
                              //   height: 150, // Hauteur du container
                              padding: const EdgeInsets.all(
                                  18), // Espace intérieur du container
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors
                                        .black), // Bordure arrondie du container
                              ),
                              child: const Text('ajouter un image')),
                          onTap: () {
                        //    controller.pickFile();
                          },
                        ),
                      ),
                      // controller.pickedFile != null &&
                      //         controller.fileBytes != null
                      //     ? Column(
                      //         children: [
                      //           Image.memory(
                      //             controller.fileBytes!,
                      //             width: 50,
                      //             height: 50,
                      //           ),
                      //           Text(controller.pickedFile!.name),
                      //         ],
                      //       )
                      //     :
                           const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GetBuilder<ProfileController>(
                  builder: (controller) => TextFormField(
                    controller: controller.passworsController,
                    obscureText: controller.isVisible,
                    // controller: passworsController,
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      hintText: "tapez votre password ",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      suffixIcon: IconButton(
                        //()=> fonction fleche   (){ } fonction anonyme
                        onPressed: () => controller.showPassword(),
                        icon: Icon(
                          // if else  condition   ? condition true : conditionfalse
                          controller.isVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " sil vous plait tapez votre password";
                      } else if (value.length < 6) {
                        return "tapez un password valide";
                      }
                      return null;
                    },
                  ),
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
                    if (controller.keyFormSignUp.currentState!.validate()) {
                      controller.signUp();
                      print('form valide');
                    }
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text.rich(
                  TextSpan(text: "Already have an account? ", children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
