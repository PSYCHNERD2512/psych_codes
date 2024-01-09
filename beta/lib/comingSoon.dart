import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
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
                height: 400,
                child: Image(
                  image: AssetImage(
                    './assets/images/party.png',
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Find fun things to do in IV and on Campus with",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Center(
              child: Text(
                "Live Event Map",
                style: TextStyle(
                    color: Color(0xff9200FF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Center(
                child: Text(
                  "Watch the stories others are posting of the event and decide before you leave the house if this is the right event for you. Find parties, sporting events, club events, sales, deals! Advertise your event for free by posting it!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
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
                onPressed: () {},
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
                    "Let's Go!",
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
    ;
  }
}
