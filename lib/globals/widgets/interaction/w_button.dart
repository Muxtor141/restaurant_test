
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/assets/colors/colors.dart';
import 'package:test_app/globals/widgets/additional/w_scale.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final BoxBorder? border;
  final double borderRadius;
  final Widget? child;
  final Color disabledColor;
  final bool isDisabled;
  final bool isLoading;
  final double? scaleValue;
  final List<BoxShadow>? shadow;
  final bool hasError;
  final bool hasWidth;

  const WButton({
    required this.onTap,
    this.text = '',
    this.color = primaryColor,
    this.hasError = false,
    this.hasWidth = true,
    this.textColor = white,
    this.borderRadius = 12,
    this.disabledColor = disabled,
    this.isDisabled = false,
    this.isLoading = false,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.textStyle,
    this.border,
    this.child,
    this.scaleValue,
    this.shadow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
        scaleValue: scaleValue ?? 0.95,
        onTap: () {
          if (!(isLoading || isDisabled)) {
            onTap();
          }
        },
        isDisabled: isDisabled,
        child: Container(
          width: hasWidth ? width ?? double.maxFinite : null,
          height: height ?? 50,
          margin: margin,
          padding: padding ?? const EdgeInsets.only(top: 15, bottom: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isDisabled ? disabledColor : color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: hasError ? Border.all(color: red, width: 1) : border,
            boxShadow: shadow,
          ),
          child: isLoading
              ? const Center(
                  child: CupertinoActivityIndicator(
                  color: Colors.white,
                ))
              : child ??
                  Text(
                    text,
                    style: isDisabled
                        ? Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            height: 1.36,
                            color: textColor)
                        : textStyle ??
                            Theme.of(context).textTheme.headline2!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                height: 1.36,
                                color: textColor),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
        ),
      );
}
