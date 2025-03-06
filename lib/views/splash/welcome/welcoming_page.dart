import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:layouting_exercise/utils/image.dart';

class WelcomingPage extends StatefulWidget {
  const WelcomingPage({super.key});

  @override
  State<WelcomingPage> createState() => _WelcomingPageState();
}

class _WelcomingPageState extends State<WelcomingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showNextButton: false,
        showDoneButton: true,
        done: Text("Syudaa"),
        onDone: () {
          Navigator.pushReplacementNamed(context, "/");
        },
        pages: [
          PageViewModel(
            title: "Halaman pertama",
            bodyWidget: Center(
              child: Column(
                children: [
                  Image.asset(
                    Gambar.welcome,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                  ),

                  Text("ini gambar ala2 welcoming page nii")
                ],
              ),
            )
          ),
          PageViewModel(
            title: "Halaman kedua",
            bodyWidget: Center(
              child: Column(
                children: [
                  Image.asset(
                    Gambar.appLogo,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                  ),

                  Text("nah kalo yang ini gambar logonya nii")
                ],
              ),
            )
          ),
          PageViewModel(
            title: "Halaman Ketiga",
            bodyWidget: Center(
              child: Column(
                children: [
                  Image.asset(
                    Gambar.appBackg,
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                  ),

                  Text("kalo yang ini background khusus nyaa yaa")
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}