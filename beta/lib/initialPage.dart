import 'package:beta/comingSoon.dart';
import 'package:flutter/material.dart';

class initialPage extends StatefulWidget {
  const initialPage({super.key});

  @override
  State<initialPage> createState() => _initialPageState();
}

class _initialPageState extends State<initialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: SizedBox(
                height: 450,
                child: Image(
                  image: AssetImage(
                    './assets/images/cs01.png',
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Get connected with Gauchos in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Center(
              child: Text(
                "Class Group Chats",
                style: TextStyle(
                    color: Color(0xff07C4C4),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Join the students in your class in a whole class\ngroup chat! Join study groups, ask and answer\nquestions, make your life easier. ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: BorderRadius.circular(25.0),
              elevation: 5,
              shadowColor: Colors.black,
              color: Colors.transparent,
              clipBehavior: Clip.none,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ComingSoon()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xFFF1F137),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
