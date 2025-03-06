import 'dart:async';

import 'package:flutter/material.dart';
import 'package:layouting_exercise/utils/color.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {
  late AnimationController controllers;
  List pilgan = ["2000", "2025", "2023", "2024"];
  String kunjaw = "2025";

  int? _pilihan;
  Timer? _timer;
  int _progressIndicator = 0;
  int _seconds = 30;
  void startTimer(){
    const onesec = Duration(seconds: 1);
    _timer = Timer.periodic(
      onesec, 
      (Timer timer) {
        if (_seconds == 0) {
          setState(() {
            timer.cancel();
            controllers.stop();
          });
          Navigator.pop(context);
        }else {
          setState(() {
            _seconds--;
            _progressIndicator++;
          });
        }
      }
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();

    controllers = AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          })
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 240, 243),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // _timer!.cancel();
                      controllers.stop();
                      Navigator.pop(context);
                    } ,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios, 
                          color: hijauTua,
                          size: 16,
                        ),
                        Text(
                          "Previous",
                          style: TextStyle(
                            color: hijauTua,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Text(
                  "7/10",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),

                Spacer(),
              ],
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      elevation: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 20),
                              blurRadius: 50,
                              spreadRadius: -10,
                              color: Color.fromRGBO(0, 0, 0, 0.15)
                            )
                          ]
                        ),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 4,
                        child: Text(
                          "Tahun berapa saat ini?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        child: Text(
                          "$_seconds",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: hijauTua
                          ),
                        )
                      ),
                      Spacer()
                    ],
                  ),
                  Row(
                    children: [
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        child: CircularProgressIndicator(
                          strokeWidth: 7,
                          strokeCap: StrokeCap.round,
                          value: _progressIndicator / 30,
                          valueColor: AlwaysStoppedAnimation<Color>(hijauTua),
                          backgroundColor: hijauMuda,
                          
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ],
              ),
            ),

            ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(color: Color.fromARGB(255, 239, 240, 243),);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pilgan.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: _pilihan == index ? pilgan[_pilihan!] == kunjaw ? hijauMuda : Colors.red.shade200  : Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _pilihan = index;
                      });
                    },
                    child: ListTile(
                      title: Text(
                        pilgan[index],
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: _pilihan == index ? 
                      Icon(Icons.check_circle)
                      :
                      Icon(Icons.circle_outlined)
                    ),
                  ),
                );
              },
            ),
            
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 59,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hijauTua,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));
                      },
                      child: Text(
                        "Next",
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
          ],
        ),
      ),
    );
  }
}