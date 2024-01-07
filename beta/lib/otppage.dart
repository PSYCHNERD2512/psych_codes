import 'package:beta/login.dart';
import 'package:flutter/material.dart';

class otpPage extends StatelessWidget {
  const otpPage({super.key});

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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 59, 0, 0),
                child: SizedBox(
                  height: 406,
                  child: Center(
                    child: SizedBox(
                      height: 273,
                      child: Image(
                        image: AssetImage(
                          './assets/images/splash.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Row(
                children: [
                  Text(
                    "Verify your email",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Please enter the 4 digit code sent to\nyourmail@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const OtpVerificationField(),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  null;
                },
                child: const Center(
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: Color(0xfffF1F137),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Material(
                borderRadius: BorderRadius.circular(25.0),
                elevation: 5,
                shadowColor: Colors.black,
                color: Colors.transparent,
                clipBehavior: Clip.none,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      _showConfirmationDialog(context);
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
                        "Confirm",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
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

class OtpVerificationField extends StatefulWidget {
  const OtpVerificationField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OtpVerificationFieldState createState() => _OtpVerificationFieldState();
}

class _OtpVerificationFieldState extends State<OtpVerificationField> {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          final bool isFirstBox = index == 0;
          final bool isLastBox = index == 3;

          return Container(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.horizontal(
                left: isFirstBox ? const Radius.circular(8.0) : Radius.zero,
                right: isLastBox ? const Radius.circular(8.0) : Radius.zero,
              ),
            ),
            height: 47.0,
            width: 80,
            child: Theme(
              data: ThemeData(
                // Set the primary color to white to avoid the purple shade
                primaryColor: Colors.white,
              ),
              child: TextField(
                cursorColor: Colors.white,
                controller: controllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,

                maxLength: 1,
                style: const TextStyle(color: Colors.white), // Set text color
                onChanged: (value) {
                  if (value.length == 1 && index < 3) {
                    // Move focus to the next TextField
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: InputDecoration(
                  counterText: '',
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    // borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.horizontal(
                      left:
                          isFirstBox ? const Radius.circular(8.0) : Radius.zero,
                      right:
                          isLastBox ? const Radius.circular(8.0) : Radius.zero,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    "assets/images/bottle.png",
                    height: 150,
                  ),
                  const Text(
                    "Verified!",
                    style: TextStyle(
                      color: Color(0xff07C4C4),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Yahoo! You have successfully\nverified the account. ",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                          builder: (context) => const LogInPage()),
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
                      "Continue",
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
    },
  );
}
