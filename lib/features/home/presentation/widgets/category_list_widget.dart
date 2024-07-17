import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 150,
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItemView(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CategoryHomeProductScreen(),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryHomeProductScreen extends StatelessWidget {
  const CategoryHomeProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            title: 'Category',
          ),
        ],
      ),
    );
  }
}
