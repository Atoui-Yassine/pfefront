import 'package:country_picker/country_picker.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pfefront/controllers/home_controller.dart';

class PageInscription2 extends GetView<HomeController> {
  const PageInscription2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Page d'échange client / vendeur",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: controller.keyFormInscrip,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Verifiez et completer vos données personnelles",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GetBuilder<HomeController>(
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
                      items: controller.civilityTitle.map((String items) {
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
                TextFormField(
                  //  controller: controller.userNameController,
                  decoration: const InputDecoration(
                    label: Text("Nom"),
                    hintText: "tapez votre nom ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre nom";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //controller: controller.emailController,
                  decoration: const InputDecoration(
                    label: Text("Nom de naissance (Facultatif)"),
                    hintText: "exp: Dupant",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return " sil vous plait tapez votre email";
                  //   } else if (!EmailValidator.validate(value)) {
                  //     return "tapez un email valide";
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  // controller: controller.phoneController,
                  decoration: const InputDecoration(
                    label: Text("Prenom"),
                    hintText: "tapez votre prenom ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre prenom";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //     controller: controller.nationnaliteController,
                  decoration: const InputDecoration(
                    label: Text("Date de naissance"),
                    hintText: "tapez votre date de naissance ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre date de naissance";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //     controller: controller.nationnaliteController,
                  decoration: const InputDecoration(
                    label: Text("Code postale de naissance"),
                    hintText: "tapez votre Code postalede naissance ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre Code postalee de naissance";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //     controller: controller.nationnaliteController,
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
                  //            controller: controller.villeDeNaissanceController,
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
                GetBuilder<HomeController>(
                    builder: (controller) => TextFormField(
                          readOnly: true,
                          onTap: () => showCountryPicker(
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
                          ),
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
                  // controller: controller.codePostaleController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Adresse Postale"),
                    hintText: "tapez votre adresse postale ",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.villa,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return " sil vous plait tapez votre adresse postale ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  //    controller: controller.emailController,
                  decoration: const InputDecoration(
                    label: Text("Email du Client"),
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
                  //    controller: controller.phoneController,
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
                const Text(
                  "Recevoir par voie électronique des offres commerciales du prêteur CA",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GetBuilder<HomeController>(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: controller.isCheckedYes,
                        onChanged: (value) =>
                            controller.handleYesChecked(value!),
                      ),
                      const Text(
                        'Oui',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 20.0),
                      Checkbox(
                        value: controller.isCheckedNo,
                        onChanged: (value) =>
                            controller.handleNoChecked(value!),
                      ),
                      const Text(
                        'Non',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }),
                // GetBuilder<HomeController>(
                //   builder: (controller) => Container(
                //     padding: const EdgeInsets.all(10.0),
                //     child: Checkbox(
                //       value: controller.checkBoxValue,
                //       activeColor: Colors.blue,
                //       onChanged: (newValue) {
                //         controller.changeCheckBoxValue(newValue!);
                //       },
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 20)),
                  onPressed: () {
                    if (controller.keyFormInscrip.currentState!.validate()) {
                      // controller.signUp();
                      print('form valide');
                    }
                  },
                  child: const Text(
                    "Je valide mes donnees et choix",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
