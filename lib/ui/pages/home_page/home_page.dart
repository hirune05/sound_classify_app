import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sound_classify_app/thems/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/soundfit.png'),
            const SizedBox(
              height: 40,
            ),
            buildKindContainer(
              '見て体験',
              'assets/images/see.png',
              AppColors.lightGreen,
              () => context.go('/home/seeing'),
            ),
            const SizedBox(
              height: 40,
            ),
            buildKindContainer(
              '聞いて体験',
              'assets/images/hear.png',
              AppColors.lightPink,
              () => context.go('/home/listening'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKindContainer(
    String title,
    String imagePath,
    Color color,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: color,
            width: 180,
            height: 36,
            child: Text(title,
                style: TextStyle(fontSize: 24, color: AppColors.white)),
          ),
          Container(
            color: color,
            width: 300,
            height: 160,
            child: Image.asset(imagePath),
          ),
        ],
      ),
    );
  }
}
