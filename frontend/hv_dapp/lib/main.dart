import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hv_dapp/Views/homeScreen/main_screen.dart';
import 'package:hv_dapp/constants/constants.dart';
import 'package:hv_dapp/Views/login/login_page.dart';
import 'package:okto_flutter_sdk/okto_flutter_sdk.dart';

Widget defaultHome = const LoginPage();
void main() async {
  await GetStorage.init(); 
// WidgetsFlutterBinding.ensureInitialized();
//   Okto('f7aa7c2d-6eab-4ca8-b441-4db577c50c17', BuildType.sandbox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            scaffoldBackgroundColor: kDark,
            iconTheme: const IconThemeData(color: kDark),
            primarySwatch: Colors.grey
          ),
          home: child,
        );
      },  
      child: defaultHome,
    );
  }
}

