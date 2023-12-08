import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 196, 196),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Row(
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
              SizedBox(height: 10),
              Text(
                "Get the sauce",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 93, 97),
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              TextFieldWidget(label: "Full Name", emoji: Icons.face_outlined),
              TextFieldWidget(label: "Username", emoji: Icons.person_outlined),
              TextFieldWidget(label: "Password", emoji: Icons.lock_outline),
              TextFieldWidget(label: "UCSB Email", emoji: Icons.mail_outlined),
              TextFieldWidget(
                  label: "Phone Number", emoji: Icons.phone_outlined),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      clipBehavior: Clip.none,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Sign Up!",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 241, 241, 55),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(0),
                    child: Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 94, 99),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
     
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 94, 99),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.transparent,
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                    ),
                  ),
                ],
              ),
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
    required this.label,
    required this.emoji,
  });

  @override
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
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(color: _isFocused ? Colors.black : Colors.grey[600]),
          decoration: InputDecoration(
            labelText: _isFocused ? null : widget.label,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border: InputBorder.none,
            prefixIcon: Icon(widget.emoji,
                color: _isFocused ? Colors.black : Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
