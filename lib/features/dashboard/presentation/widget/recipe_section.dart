import 'package:flutter/material.dart';
import 'package:idealis_mobile/core/constants/app_colors.dart';
import 'package:idealis_mobile/features/dashboard/presentation/widget/recipe_card.dart';

class RecipeSection extends StatelessWidget {
  final List<RecipeCardData> recipes;

  const RecipeSection({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only show the first 2 recipes
    final displayedRecipes = recipes.take(2).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resep Favorit Anda 😍',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < displayedRecipes.length; i++) ...[
                    if (i > 0) const SizedBox(width: 12),
                    Expanded(
                      child: RecipeCard(
                        image: displayedRecipes[i].image,
                        title: displayedRecipes[i].title,
                        cookedCount: displayedRecipes[i].cookedCount,
                        category: displayedRecipes[i].category,
                        onClick: displayedRecipes[i].onClick,
                        className: displayedRecipes[i].className,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data model for recipe card entries passed into RecipeSection
class RecipeCardData {
  final String image;
  final String title;
  final int cookedCount;
  final String? category;
  final VoidCallback? onClick;
  final String? className;

  const RecipeCardData({
    required this.image,
    required this.title,
    required this.cookedCount,
    this.category,
    this.onClick,
    this.className,
  });
}
