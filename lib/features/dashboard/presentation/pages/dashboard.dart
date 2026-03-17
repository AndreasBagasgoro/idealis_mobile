import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/header.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/inventory_section.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/recommendation_section.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/recipe_section.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header — now scrolls with content
              Header(
                username: 'John Doe',
                logoPath: 'assets/images/idealis_text.png',
                onNotificationTap: () {
                  print('Ini tombol notifikasi');
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 210, maxHeight: 220),
                      child: RecommendationSection(
                        title: 'Sop Ayam',
                        description:
                            'Menggunakan ayam, wortel, dan kentang dari inventaris Anda. ',
                      ),
                    ),
                    SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 150, maxHeight: 200),
                      child: InventorySection(
                        expiringCount: 5,
                        expiringDays: 3,
                        totalCount: 24,
                      ),
                    ),
                    SizedBox(height: 16),
                    RecipeSection(
                      recipes: [
                        RecipeCardData(
                          image: 'assets/images/sop_ayam.png',
                          title: 'Sop Ayam',
                          cookedCount: 12,
                          category: 'Sup',
                        ),
                        RecipeCardData(
                          image: 'assets/images/nasi_goreng.png',
                          title: 'Nasi Goreng',
                          cookedCount: 25,
                          category: 'Nasi',
                        ),
                      ],
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
