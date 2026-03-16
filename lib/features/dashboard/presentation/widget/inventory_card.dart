import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';

class InventoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String countText;
  final String label;
  final Color? borderLeftColor;
  final Color? backgroundColor;

  const InventoryCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.countText,
    required this.label,
    this.borderLeftColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.background,
        borderRadius: BorderRadius.circular(10),
        border:
            borderLeftColor != null
                ? Border(left: BorderSide(color: borderLeftColor!, width: 4))
                : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.15),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, color: iconColor, size: 40),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    countText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: iconColor,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
