import 'package:beta/login.dart';
import 'package:beta/otppage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 196, 196),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              const Row(
                children: [
                  Text(
                    "Create\nAccount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const Text(
                "Get the sauce",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 93, 97),
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 40),
              const TextFieldWidget(
                  label: "Full Name", emoji: Icons.face_outlined),
              const TextFieldWidget(
                  label: "Username", emoji: Icons.person_outlined),
              const TextFieldWidget(
                  label: "Password", emoji: Icons.lock_outline),
              const TextFieldWidget(
                  label: "UCSB Email", emoji: Icons.mail_outlined),
              const TextFieldWidget(
                  label: "Phone Number", emoji: Icons.phone_outlined),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          MaterialPageRoute(
                            builder: (context) => const otpPage(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFF1F137),
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
                          "Sign Up!",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    child: const Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 94, 99),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogInPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final String label;
  final IconData emoji;

  const TextFieldWidget({
    super.key,
    required this.label,
    required this.emoji,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPassword = false;
    if (widget.label == "Password") {
      isPassword = true;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 167, 166, 166),
                offset: Offset(0, -2)),
            BoxShadow(
              color: Colors.white,
              blurRadius: 1.75,
              spreadRadius: -1.75,
            ),
          ],
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(
              color: _isFocused
                  ? const Color.fromRGBO(0, 0, 0, 1)
                  : Colors.grey[600]),
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: _isFocused ? null : widget.label,
            contentPadding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            border: InputBorder.none,
            prefixIcon: Icon(
              widget.emoji,
              color: _isFocused ? Colors.black : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
