import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';

class InventorySection extends StatelessWidget {
  final String title;
  final String description;
  final String? logoPath;

  const InventorySection({
    Key? key,
    required this.title,
    required this.description,
    this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.5),
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
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rekomendasi menu hari ini 👨🏻‍🍳',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                logoPath != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(logoPath!, width: 80, height: 80),
                    )
                    : Container(
                      width: 160,
                      height: 120,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.fastfood, color: AppColors.white),
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    // ✅ Description
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    // ✅ Tombol Lihat Resep
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Lihat Resep',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
