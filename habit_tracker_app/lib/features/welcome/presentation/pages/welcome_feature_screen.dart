import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/navigation/routers.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_text_button.dart';
import 'package:sizer/sizer.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class WelcomeFeatureScreen extends StatelessWidget {
  const WelcomeFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isFinished = ValueNotifier(false);

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: ColorsApp.primary,
      body: ListView(
        children: [
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/welcome.png',
                  fit: .cover,
                  width: 100.sw,
                  height: 63.h,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome\nto UpHabit",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 71, 70, 70),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ValueListenableBuilder<bool>(
              valueListenable: isFinished,
              builder: (context, value, _) {
                return SwipeableButtonView(
                  isFinished: value,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 1), () {
                      isFinished.value = true;
                    });
                  },
                  onFinish: () {
                    context.push(Routes.signUp);
                    isFinished.value = false;
                  },
                  activeColor: ColorsApp.accent,
                  buttonWidget: Icon(
                    Icons.arrow_forward,
                    color: ColorsApp.accent,
                  ),
                  buttonText: "Get Started",
                  buttontextstyle: TextStyle(
                    color: Colors.white,
                    fontWeight: .bold,
                    fontSize: 18,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AuthTextButton(
                text: "Already have an account",
                actionText: "Log In",
                route: '/login',
                actionColor: Colors.black,
                textColor: Colors.black54,
              ),
          ),
        ],
      ),
    );
  }
}
