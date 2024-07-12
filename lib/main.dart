import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfefront/core/bindings.dart';
import 'package:pfefront/screens/home/echange_client_vendeur_screen.dart';
import 'package:pfefront/screens/page_inscription_1.dart';
import 'package:pfefront/screens/page_inscription_2.dart';
import 'package:pfefront/screens/page_reserver_au_vendeur.dart';
import 'package:pfefront/screens/paiment_screen.dart';
import 'package:pfefront/screens/profile/edit_profile_screen.dart';
import 'package:pfefront/screens/profile/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:pfefront/screens/profile/verify_code_screen.dart';
import 'package:pfefront/screens/protection_donnee_personnel_screen.dart';

Future<void> main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
// FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(),
      // ),
      );
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('de'),
        Locale('fr'),
        Locale('el'),
        Locale('et'),
        Locale('nb'),
        Locale('nn'),
        Locale('pl'),
        Locale('pt'),
        Locale('ru'),
        Locale('hi'),
        Locale('ne'),
        Locale('uk'),
        Locale('hr'),
        Locale('tr'),
        Locale('lv'),
        Locale('lt'),
        Locale('ku'),
        Locale('nl'),
        Locale('it'),
        Locale('ko'),
        Locale('ja'),
        Locale('id'),
        Locale('cs'),
        Locale('ht'),
        Locale('sk'),
        Locale('ro'),
        Locale('bg'),
        Locale('ca'),
        Locale('he'),
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: FlutterSplashScreen.gif(
        gifPath: 'assets/images/example.gif',
        gifWidth: 269,
        gifHeight: 474,
        nextScreen: const PageInscription2(),
        duration: const Duration(milliseconds: 3515),
        onInit: () async {
          debugPrint("onInit");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
        },
      ),
    );
  }
}
