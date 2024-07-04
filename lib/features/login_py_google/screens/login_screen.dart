import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:maps_app/core/internet/check_internet.dart';
import 'package:maps_app/features/login_py_google/logic/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SvgPicture.asset(
            fit: BoxFit.cover,
            'assets/log.svg',
          ),
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width / 4.5,
          bottom: 80.0,
          width: 200.0.w,
          height: 50.0.h,
          child: Consumer(
            builder: (context, ref, child) => SignInButton(
              Buttons.Google,
              onPressed: () async {
                if (await CommunicationsCheck.checkIntrnet(context)) {
                  final isLoged =
                      await ref.read(googleSignin).signInWithGoogle();
                  if (isLoged != null) {
                    // ignore: use_build_context_synchronously
                    context.go('/MapScreen');
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}
