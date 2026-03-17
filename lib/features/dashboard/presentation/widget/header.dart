import "package:flutter/material.dart";
import 'package:idealis_mobile/core/constants/app_colors.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Header extends StatelessWidget {
  final String username;
  final String logoPath;
  final VoidCallback? onNotificationTap;

  const Header({
    super.key,
    required this.username,
    required this.logoPath,
    this.onNotificationTap,
  });


  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: 

     Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(     
              children: [
                Image.asset(logoPath, width: 71, height: 50),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:  MainAxisAlignment.start,
                children: [
                Text(
                    'Hello, $username! 🙌🏻',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Siap untuk hari yang penuh rasa?',
                    style: TextStyle(fontSize: 16, color: AppColors.white),
                  ),
                ],
              ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: onNotificationTap ?? () {},
                icon: Icon(Icons.notifications_outlined, color: AppColors.black, size: 28,),
              ),
            ),
            ],)
          ],
        ),
      ),
    ),
    );

  }
}
