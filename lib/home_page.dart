// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_google_fit/calories_data.dart';
import 'package:my_google_fit/total_steps_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my google fit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TotalStepsPage()),
                  );
                },
                style: TextButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Color(0xFF0c3cac),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("total steps")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CaloriesData()),
                  );
                },
                style: TextButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Color.fromARGB(255, 38, 47, 69),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("Calories data")),
          ],
        ),
      ),
    );
  }
}
