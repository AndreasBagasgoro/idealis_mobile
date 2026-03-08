import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/header.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/inventory_section.dart';
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SafeArea(
          child: Header(
            username: 'John Doe', 
            logoPath: 'assets/images/idealis_text.png',
            onNotificationTap: () {
              print('Ini tombol notifikasi');
            },
          ),
        ),
        ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: InventorySection(title: 'Inventory', description: 'Manage your inventory items'),
      ),
    );
  }
}