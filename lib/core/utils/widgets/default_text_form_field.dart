import 'package:ecommerce_intrazero/core/utils/constants/app_color.dart';
import 'package:ecommerce_intrazero/core/utils/constants/app_style.dart';
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final double height;
  final double? width;
  final TextInputType textInputType;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChanged;
  final Color bgColor;
  final Color? labelColor;

  final Color? textColor;
  final String hint;
  final bool isDense;
  final bool obscureText;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final dynamic maxLines;
  final FormFieldValidator<String>? validator;
  final String label;
  final String counterText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? suffixIconPressed;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color floatingLabelColor;
  final bool isClickable;
  final bool expands;
  final bool hasCode;
  final void Function()? onEditingComplete;
  final EdgeInsetsGeometry? textPadding;

  final bool isRequired;

  const DefaultTextFormField({
    super.key,
    required this.controller,
    this.height = 50,
    this.width,
    this.maxLines = 1,
    required this.textInputType,
    this.onSubmit,
    this.onChanged,
    this.validator,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconPressed,
    this.obscureText = false,
    this.isClickable = true,
    this.hint = '',
    this.counterText = '',
    this.onTap,
    this.isDense = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.bgColor = AppColor.kBackGroundColor,
    this.labelColor,
    this.focusNode,
    this.maxLength,
    this.margin,
    this.contentPadding,
    this.floatingLabelColor = AppColor.kPrimaryColor,
    this.textColor = Colors.black,
    this.expands = false,
    this.hasCode = false,
    this.textPadding,
    this.isRequired = false,
    this.onEditingComplete,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late FocusNode myFocusNode;
  int lengthCounter = 0;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: widget.onTap,
              child: SizedBox(
                width: widget.width ?? MediaQuery.sizeOf(context).width * .92,
                child: TextFormField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: TextStyle(
                    color: widget.textColor,
                  ),
                  onEditingComplete: widget.onEditingComplete,
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  expands: widget.expands,
                  decoration: InputDecoration(
                    filled: true,
                    counterText: widget.maxLength != null
                        ? '$lengthCounter/${widget.maxLength}'
                        : '',
                    fillColor: widget.bgColor,
                    hintText: widget.hint,
                    suffixIcon: widget.suffixIcon != null
                        ? IconButton(
                            icon: widget.suffixIcon!,
                            onPressed: widget.suffixIcon != null
                                ? widget.suffixIconPressed
                                : null,
                          )
                        : null,
                    isDense: widget.isDense,
                    contentPadding: widget.isDense
                        ? const EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 12,
                          )
                        : widget.contentPadding,
                    border: AppStyle.outlineBorder,
                    disabledBorder: AppStyle.outlineBorder,
                    enabledBorder: AppStyle.outlineBorder,
                    focusedBorder: AppStyle.outlineBorder,
                  ),
                  onFieldSubmitted: widget.onSubmit,
                  onChanged: widget.maxLength != null
                      ? (value) {
                          setState(() {
                            lengthCounter = widget.controller.text.length;
                          });
                        }
                      : widget.onChanged,
                  validator: widget.validator,
                  keyboardType: widget.textInputType,
                  obscureText: widget.obscureText,
                  enabled: widget.isClickable,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
