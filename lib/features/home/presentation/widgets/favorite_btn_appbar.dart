import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteBtnAppbar extends StatelessWidget {
  const FavoriteBtnAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            color: AppColor.kBorderGreyColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/Wishlist.svg',
            height: 20.0,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
