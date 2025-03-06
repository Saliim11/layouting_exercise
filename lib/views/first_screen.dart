import 'package:flutter/material.dart';
import 'package:layouting_exercise/service/prefs_handler.dart';
import 'package:layouting_exercise/utils/image.dart';
import 'package:layouting_exercise/views/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  final TextEditingController _namaCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(Gambar.appBackg, fit: BoxFit.cover,)),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height /2,
                    child: Center(
                      child: CircleAvatar(
                        maxRadius: 75,
                        minRadius: 75,
                        backgroundImage: AssetImage(Gambar.appLogo),
                      ),
                    ),
                  ),
              
                  SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enter your name",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: _namaCont,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12
                    ),
                    decoration: InputDecoration(
                      hintText: "John Deh...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white, width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white, width: 1)
                      ),
                      fillColor: Colors.white
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 59,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 248, 198, 96),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              )
                            ),
                            onPressed: () {
                              PreferenceHandler.saveId(_namaCont.text);
                              Navigator.pushNamed(context, "/second");
                            },
                            child: Text(
                              "Start",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,)
                ],
              ),
            )
        ],
      ),
    );
  }
}