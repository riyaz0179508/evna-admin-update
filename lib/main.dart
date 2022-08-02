
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evna_admin/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    Fluttertoast.showToast(msg: "Connected with Mobile", backgroundColor: Colors.green);
  } else if (connectivityResult == ConnectivityResult.wifi) {
    Fluttertoast.showToast(msg: "Connected with Wifi", backgroundColor: Colors.green);
  } else {
    Fluttertoast.showToast(msg: "No internet Connection", backgroundColor: Colors.red);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
