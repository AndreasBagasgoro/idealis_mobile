import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/inventory_card.dart';

class InventorySection extends StatelessWidget {
  final int expiringCount;
  final int expiringDays;
  final int totalCount;

  const InventorySection({
    super.key,
    required this.expiringCount,
    required this.expiringDays,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Inventaris 🗄️',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Card 1 - Segera Kadaluarsa
                  Expanded(
                    child: InventoryCard(
                      title: 'Segera Kadaluarsa',
                      icon: Icons.hourglass_bottom_rounded,
                      iconColor: Color(0xFFBFA659),
                      countText: '$expiringCount item',
                      label: 'dalam $expiringDays hari',
                      borderLeftColor: Color(0xFFBFA659),
                      backgroundColor: Color(0xFFFFFAEA),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Card 2 - Ringkasan Inventaris
                  Expanded(
                    child: InventoryCard(
                      title: 'Ringkasan Inventaris',
                      icon: Icons.inventory_2_outlined,
                      iconColor: Color(0xFF4D774F),
                      countText: '$totalCount item',
                      label: 'total tersedia',
                      borderLeftColor: Color(0xFF4D774F),
                      backgroundColor: Color(0xFFF2F9F3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
