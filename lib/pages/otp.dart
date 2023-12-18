import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:thasmai/pages/meditationdata.dart';
import 'package:thasmai/services/services.dart';
import '../constants/consts.dart';
import '../controller/controller.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
  });


  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  @override
  void initState() {
    super.initState();
  }

  final pinController = TextEditingController();
  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserController>(context, listen: false);
    var height = MediaQuery.of(context).size.height;

    const focusedBorderColor = Colors.white;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: focusedBorderColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.1,
                    fit: BoxFit.cover,
                    image: AssetImage(bgimage))),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(Icons.menu,
                                  color: Colors.white, size: 35),
                            );
                          },
                        ),
                        SizedBox(
                            width: 45, height: 45, child: Image.asset(logo)),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Directionality(
                            // Specify direction if desired
                            textDirection: TextDirection.ltr,
                            child: Center(
                              child: Pinput(
                                controller: pinController,
                                focusNode: focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme: defaultPinTheme,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 15),
                                validator: (value) {
                                  setState(() {});
                                  String res = provider.otp;
                                  return value == res
                                      ? null
                                      : 'Pin is incorrect';
                                },
                                onClipboardFound: (value) {
                                  debugPrint('onClipboardFound: $value');
                                  pinController.setText(value);
                                },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  Map<String, dynamic> data = <String, dynamic>{
                                    "email": provider.email,
                                    "otp": pin,
                                    "new_password":provider.password,
                                  };
                                  VerifyOtp(data, context);
                                  if (formKey.currentState!.validate()) {
                                    if (provider.success == true) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MeditationData(),
                                          ));
                                    }
                                  }
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    color: fillColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 60,
                      width: height,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.0))),
                        ),
                        onPressed: () {
                          setState(() {});
                          Map<String, dynamic> data = <String, dynamic>{
                            "email": provider.email,
                            "otp": provider.otp,
                            "new_password":provider.password,
                          };
                          VerifyOtp(data, context);
                          if (formKey.currentState!.validate()) {
                            if (code == "200") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MeditationData(),
                                  ));
                            }
                          }
                        },
                        child: const Text(
                          " Verify OTP",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          setState(() {});
                          sendOtp(
                            provider.email,
                            context,
                          );
                          print(provider.email);
                        },
                        child: Text("Resend OTP")),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
