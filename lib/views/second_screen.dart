import 'package:flutter/material.dart';
import 'package:layouting_exercise/utils/color.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Card()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}