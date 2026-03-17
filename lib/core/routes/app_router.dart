import 'package:flutter/material.dart';
import 'package:idealis_mobile/features/dashboard/presentation/pages/dashboard.dart';
import 'package:idealis_mobile/features/ingredient/presentation/pages/inventory_page.dart';
import 'package:idealis_mobile/features/recipe/presentation/pages/recipe_page.dart';
import 'package:idealis_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:idealis_mobile/shared/widgets/buttons/custom_bottom_nav.dart';

/// Main shell that holds the bottom navigation and page switching.
class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    InventoryPage(),
    RecipePage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
