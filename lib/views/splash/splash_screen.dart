import 'package:flutter/material.dart';
import 'package:layouting_exercise/service/prefs_handler.dart';
import 'package:layouting_exercise/utils/color.dart';
import 'package:layouting_exercise/utils/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void getDataUser() async {
    //get data user
    var userId = await PreferenceHandler.getId();
    print("ini isi userId andaa: $userId");

    Future.delayed(Duration(seconds: 2), () {
     if (userId != '') {
        Navigator.pushReplacementNamed(context, '/second');
      } else {
        Navigator.pushReplacementNamed(context, "/welcome");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hijauMuda,
      body: Center(
        child: Image.asset(
          Gambar.appLogo,
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}