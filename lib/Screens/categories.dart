import 'package:flutter/material.dart';
import 'package:mealapp/Screens/meals.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;
  void _onSelectcategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Meals(
        meals: filteredMeals,
        title: category.title,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
              onSelect: () {
                _onSelectcategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
