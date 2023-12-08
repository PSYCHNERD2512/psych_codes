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
              SizedBox(height: 0),
              Text(
                "Get the sauce",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 93, 97),
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 40),
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
                      borderRadius: BorderRadius.circular(25.0),
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.transparent,
                      clipBehavior: Clip.none,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Sign Up!",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                          color: Colors.black,
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
    bool isPassword = false;
    if (widget.label == "Password") {
      isPassword = true;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17.5),
          boxShadow: [
            BoxShadow(
              color: _isFocused
                  ? Colors.black.withOpacity(0.8) // Dark black when focused
                  : Colors.transparent,
              spreadRadius: -10.0,
              blurRadius: 20.0,
              offset: Offset(0, 4),
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
            contentPadding: EdgeInsets.fromLTRB(0, 3, 0, 0),
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
