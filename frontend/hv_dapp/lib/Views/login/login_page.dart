import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hv_dapp/Views/homeScreen/main_screen.dart';
import 'package:hv_dapp/Views/login/signup_page.dart';
import 'package:hv_dapp/constants/appstyle.dart';
import 'package:hv_dapp/constants/back_ground_container.dart';
import 'package:hv_dapp/constants/constants.dart';
import 'package:hv_dapp/constants/reusable_text.dart';
import 'package:lottie/lottie.dart';
import 'package:okto_flutter_sdk/okto_flutter_sdk.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final okto = Okto("f7aa7c2d-6eab-4ca8-b441-4db577c50c17", BuildType.sandbox);
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
      'openid',
    ],
    clientId: "295484592591-qoe4q1rggtksk3cfl9kgpkato6fcndip.apps.googleusercontent.com",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: ReusableText(
            text: 'HackVerse',
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
        backgroundColor: kBackground,
      ),
      body: BackGroundContainer(
        color: kOffWhite,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h),
              Lottie.asset("assets/anime/anim.json"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: Size(200.w, 40.h),
                      ),
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
                          if (googleUser == null) {
                            // The user canceled the sign-in
                            print('User canceled sign-in');
                            return;
                          }
                          
                          final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
                          if (googleAuth == null) {
                            // Authentication failed
                            print('Google authentication failed');
                            return;
                          }

                          final String? idToken = googleAuth.idToken;
                          if (idToken == null) {
                            // Token is null
                            print('ID token is null');
                            return;
                          }

                          final res = await okto.authenticate(idToken: idToken);
                          if (res is AuthenticationResponse) {
                            await okto.setPin(pin: 'USER_PIN'); // Call only on sign up
                          }
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => const MainScreen()));
                        } catch (e) {
                          throw Exception(e);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: kLightWhite,
                            radius: 15.r,
                            child: Image.asset("assets/anime/download.png",
                                height: 20.h, width: 20.w),
                          ),
                          ReusableText(
                            text: "Click to Login",
                            style: appStyle(16, kLightWhite, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        minimumSize: Size(200.w, 40.h),
                      ),
                      onPressed: () {
                        // Logic to handle sign-up or log-in for users without Solana account
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(), // Define your SignUpPage
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: kLightWhite,
                            radius: 15.r,
                            child: Icon(
                              CupertinoIcons.add,
                              size: 20.h,
                              color: kBackground,
                            ),
                          ),
                          ReusableText(
                            text: "Sign up without Solana",
                            style: appStyle(16, kLightWhite, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
