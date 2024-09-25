import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfefront/controllers/TaskInfo%20.dart';
import 'package:pfefront/controllers/profile_controller.dart';
import 'package:pfefront/core/networking/app_api.dart';
import 'package:pfefront/core/storage/app_storage.dart';
import 'package:pfefront/models/contratReq.dart';
import 'package:pfefront/models/contrat_model.dart';
import 'package:pfefront/screens/home/create_financement_screen.dart';
import 'package:widget_slider/widget_slider.dart';
import 'package:intl/intl.dart';
// import 'dart:html' as html;

class HomeController extends GetxController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  GlobalKey<FormState> keyFormInscrip = GlobalKey<FormState>();

   ProfileController? controllerPro ;
  TextEditingController montantTotaleController = TextEditingController();
  TextEditingController montantFinancierController = TextEditingController();
  TextEditingController apportPersonnelController = TextEditingController();
  String formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now());
  String d = DateTime.now().day.toString();
  int m = DateTime.now().month;
  int m1 = DateTime.now().month + 1;
TextEditingController emailController = TextEditingController();
TextEditingController nomController = TextEditingController();
TextEditingController prenomController = TextEditingController();
  int m2 = DateTime.now().month + 2;
  int m3 = DateTime.now().month + 3;
  int m4 = DateTime.now().month + 4;
  int datefin = DateTime.now().day;
  String y = DateTime.now().year.toString();

  final controller = SliderController(
    duration: const Duration(milliseconds: 600),
  );
  final dio = Dio();
TextEditingController countryControllerController = TextEditingController();
  @override
  void onInit() {
    countryControllerController.text = "country";
     controllerPro = Get.find<ProfileController>();
    super.onInit();
  }

//------------------------------------image-------------------

  File? image;
  File? imageFace2;
  final picker = ImagePicker(); // Image picker instance


//Image Picker function to get image from gallery
  Future getImageFromGallery(int a) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (a == 1) {
        image = File(pickedFile.path);
      } else if (a == 2) {
        imageFace2 = File(pickedFile.path);
      }
    }
    update(); // Update the UI to reflect the selected image
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera(int a) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (a == 1) {
        image = File(pickedFile.path);
      } else if (a == 2) {
        imageFace2 = File(pickedFile.path);
      }
    }
    update(); // Update the UI to reflect the selected image
  }

  //Show options to get image from camera or gallery
  Future showOptions(BuildContext context, int a) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery(a);
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera(a);
            },
          ),
        ],
      ),
    );
  }


//------------------------------------image-------------------

  createFinancement() async {
    Map<String, dynamic> data = {
      "montanttotal": montantFinancierController.text,
      "montantafinancer": montantTotaleController.text,
      "apportpersonnel": apportPersonnelController.text,
      "dateAchat": "${DateTime.now()}"
    };
    try {
       TaskInfo? taskinfo = await getCurrentTask();
        print('taskinfo================$taskinfo');
      if (taskinfo?.taskDefinitionKey == "Activity_07ya32i"){
            var response =
                      await dio.post(AppApi.createFinancementUrl, queryParameters: data);
                  if (response.statusCode == 200) {
                    print('login success');
                    double m = double.parse(apportPersonnelController.text.isNotEmpty
                        ? montantFinancierController.text
                        : montantTotaleController.text);
                     await completeTask(taskinfo?.id, data);   
                    Get.to(CreateFinancement(
                        m.toInt(),
                        apportPersonnelController.text.isNotEmpty
                            ? montantFinancierController.text
                            : montantTotaleController.text));
                  }
      }
      
    } catch (e) {
      print('error================$e');
    }
  }
Future<void> completeTask(String? taskId, Map<String, dynamic> data) async {
  try {
    String url = "${AppApi.baseUrl}api/process/task/$taskId/complete";

    Map<String, dynamic> body = data;

    var response = await Dio().post(url, data: body);

    if (response.statusCode == 200) {
      print("Task completed successfully");
    } else {
      print("Failed to complete task, status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error completing task: $e");
  }
}

  updateMonatant(String v, String v2) {
    montantFinancierController.text =
        (double.parse(v) - double.parse(v2)).toString();
    update();
  }

  XFile? pickedFile;
  Uint8List? fileBytes;
  List<String> listCarte = ["Carte Nationale d'Identité", "Passeport"];
  String? selectedValueMaritalStatus;
  void onChnagedDropDownMaritalStatus(String value) {
    selectedValueMaritalStatus = value;
    update();
  }

  String? selectedValueCivilityTitle;
  List<String> civilityTitle = [
    "Ms",
    "Mrs.",
    "Mr.",
    "Miss.",
    "Not Specified",
    "Prefer Not to say"
  ];

  void onChnagedDropDownCivilityTitle(String v) {
    selectedValueCivilityTitle = v;
    update();
  }

  bool? checkBoxValue = false;
  bool isCheckedYes = false;
  bool isCheckedNo = false;

  void handleYesChecked(bool value) {
    if (value) {
      isCheckedYes = true;
      isCheckedNo = false; // Deselect 'No'
      update();
    } else {
      isCheckedYes = false;
      update();
    }
  }

  void handleNoChecked(bool value) {
    if (value) {
      isCheckedNo = true;
      isCheckedYes = false; // Deselect 'Yes'
      update();
    } else {
      isCheckedNo = false;
      update();
    }
  }

  

  void selectCountry(String country) {
    countryControllerController.text = country;
    update();
  }

  ContratModel? contratModel;
  getContrat() async {
    try {
      String? id=AppStorage.readIdcontrat();
      int? idclient = int.tryParse(id ?? ''); 
      var response =
          await dio.get("${AppApi.getContratUrl}$idclient");
      if (response.statusCode == 200) {
        contratModel = ContratModel.fromJson(response.data);
        print("contrat model========== $contratModel");
        AppStorage.saveNumContrat(contratModel!.codecontrat);
      }
    } catch (e) {
      print("error model ============= $e");
    }
  }
Future<void> creatContrat(String date, int nbrTran) async {
  // Date when the contract ends (we'll add months based on nbrTran)
  DateTime now = DateTime.now();
  DateTime endDate;

  // Calculate end date based on the number of months (nbrTran)
  if (nbrTran == 2) {
    endDate = DateTime(now.year, now.month + 2, now.day);
  } else if (nbrTran == 3) {
    endDate = DateTime(now.year, now.month + 3, now.day);
  } else {
    endDate = DateTime(now.year, now.month + 4, now.day);
  }

  // Try parsing the incoming date (start date)
  DateTime startDate;
  try {
    // Assuming 'date' is in 'M/d/yyyy' format, adjust the format if needed
    startDate = DateFormat('M/d/yyyy').parse(date);
    print("Start Date parsed successfully: $startDate");
  } catch (e) {
    print("Error parsing start date: $e");
    return;
  }

  // Format start and end dates to 'yyyy-MM-dd'
  String formattedStartDate = DateFormat("yyyy-MM-dd").format(startDate);
  String formattedEndDate = DateFormat("yyyy-MM-dd").format(endDate);
  
  print("Formatted Start Date: $formattedStartDate");
  print("Formatted End Date: $formattedEndDate");

  // Generate a random contract code
  String codecontrat = generateRandomCode(8);
  
  // Create contract model
  ContratModel contratModel = ContratModel(
    codecontrat: codecontrat,
    datedebut: formattedStartDate,
    datefin: formattedEndDate,
  );

  print("Creating contract: $contratModel");

  // Get client ID from AppStorage
  String? id = AppStorage.readId();
  if (id == null) {
    print("No client ID found in storage.");
    return;
  }

  // Define the URL
  String url = "${AppApi.baseUrl}contrat/created/$id";

  // Send the contract data to the backend
  var response = await Dio().post(url, data: contratModel.toJson());

  // Handle the response
  if (response.statusCode == 200) {
    print("Contract created successfully: ${response.data}");
    
    // Get the returned contract ID and store it in AppStorage
    String contratId = response.data['id'].toString();
    AppStorage.saveIdcontrat(contratId);

    print("Contract ID saved: $contratId");
  } else {
    print("Failed to create contract: ${response.statusCode}");
  }
}
// Function to generate a random alphanumeric code
String generateRandomCode(int length) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}
Future<TaskInfo?> getCurrentTask() async {
  try {
    String? processInstanceId = AppStorage.readProcessInstanceId();
    
    if (processInstanceId == null) {
      print("No process instance ID found");
      return null;
    }

    String url = "${AppApi.baseUrl}api/process/taskcurrent/$processInstanceId";

    var response = await dio.get(url);

   var taskData = response.data as Map<String, dynamic>;

        if (taskData.containsKey('taskDefinitionKey') && taskData.containsKey('id')) {
        String taskDefinitionKey = taskData['taskDefinitionKey'];
        String id = taskData['id'];
        
        print("Task Definition Key: $taskDefinitionKey, Task ID: $id");

        // Return a TaskInfo object
        return TaskInfo(id: id, taskDefinitionKey: taskDefinitionKey);
        
    } else {
      print("Failed to fetch current task. Status code: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print('Error fetching current task: $e');
    return null;
  }
}

startProcess(String processKey) async {
  String startUrl = "${AppApi.baseUrl}api/process/start/$processKey";

  try {
    var response = await dio.post(startUrl, data: {});

    if (response.statusCode == 200) {
      print("Process: ${response.data}");
      var processInstanceId = response.data;

      print("Process started successfully with ID: $processInstanceId");

      AppStorage.saveProcessInstanceId(processInstanceId);
    }
  } catch (e) {
    print('Error starting process: $e');
  }
}
Future<void> killProcess() async {
  try {
    String?  processInstanceId =AppStorage.readProcessInstanceId();
    String url = "${AppApi.baseUrl}api/process/kill/$processInstanceId";

    var response = await Dio().delete(url);

    if (response.statusCode == 200) {
      print("Process with ID $processInstanceId killed successfully.");
    } else {
      print("Failed to kill process. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error killing process: $e");
  }
}

}
