import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String otpCode = '';
    int previousLength = 0;
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
                child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 15),
                child: Text("Masukkan Kode Verifikasi",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
              ),
              FutureBuilder(
                future: controller.getEmailToken(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                      width: 300,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                          "Kami telah mengirimkan verifikasi kode ke email: ${controller.email}",
                          style: TextStyle(
                              height: 1.3,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Theme.of(context).hintColor),
                          textAlign: TextAlign.center),
                    );
                  }
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: OtpTextField(
                    fieldWidth: 60,
                    numberOfFields: 4,
                    borderColor: Theme.of(context).hintColor,
                    cursorColor: Theme.of(context).primaryColor,
                    textStyle: TextStyle(fontSize: 26),
                    showFieldAsBox: true,
                    onCodeChanged: (code) {
                      // if(otpCode.length > 4) {
                      //   otpCode = code;
                      //   print("Otp Replace: $otpCode");
                      // } else {
                      //   otpCode += code;
                      //   print("Otp: $otpCode");
                      // }
                      if (code.length > previousLength) {
                        otpCode += code[code.length - 1];
                        print(otpCode);
                      } else if (code.length < 4) {
                        otpCode = otpCode.substring(0, otpCode.length - 1);
                        print(otpCode);
                      }
                    }),
              ),
              Center(
                child:
                    Image.asset("assets/img/ilustration/ilustration_otp.png"),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            onPrimary: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            padding:
                                const EdgeInsets.symmetric(vertical: 20.0)),
                        onPressed: () {
                          controller.verifyOtp(otpCode);
                        },
                        child: const Text("Lanjutkan"),
                      )))
            ]))));
  }
}
