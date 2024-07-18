import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeAppBar extends StatelessWidget {
  final bool scrolled;
  final int currentHomeTab;

  const HomeAppBar({
    super.key,
    required this.scrolled,
    required this.currentHomeTab,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        return SliverAppBar(
          forceElevated: scrolled,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.12,
          backgroundColor: AppColor.kBackGroundColor,
          surfaceTintColor: AppColor.kBackGroundColor,
          pinned: true,
          stretch: true,
          centerTitle: false,
          leadingWidth: 0.0,
          title: currentHomeTab == 2
              ? RichText(
                  text: TextSpan(
                    text: 'Cart: ',
                    style: Theme.of(context).textTheme.headlineLarge,
                    children: [
                      TextSpan(
                        text: 'Products: ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.kTextColor),
                      ),
                    ],
                  ),
                )
              : Hero(
                  tag: 'search',
                  child: Material(
                    child: SearchFieldAppbar(
                      readOnly: true,
                      onTap: () {
                        context.pushNamed(searchScreen);
                      },
                    ),
                  ),
                ),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          actions: [
            if (currentHomeTab == 0) ...const [
              FavoriteBtnAppbar(),
              NotificationAppbar(),
            ],
          ],
        );
      },
    );
  }
}
