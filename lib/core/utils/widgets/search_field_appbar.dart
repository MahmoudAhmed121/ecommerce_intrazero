import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldAppbar extends StatelessWidget {
  final VoidCallback? onTap;

  final bool readOnly;

  final TextEditingController? controller;

  final void Function(String)? onChanged;

  const SearchFieldAppbar({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        controller: controller,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onTap: onTap,
        readOnly: readOnly,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hintStyle: AppStyle.font14_700Weight,
          hintText: 'Search for what',
          border: AppStyle.outlineBorder,
          prefixIcon: IconButton(
            onPressed: null,
            icon: Image.asset(
              'assets/images/search_outline.png',
              color: AppColor.kTextColor,
              height: 20.0,
            ),
          ),
          enabledBorder: AppStyle.outlineBorder,
          focusedBorder: AppStyle.outlineBorder,
        ),
      ),
    );
  }
}
