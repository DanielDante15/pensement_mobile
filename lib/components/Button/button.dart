import 'package:flutter/material.dart';

class BButton extends StatelessWidget {
  const BButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.fontSize,
    this.width,
    this.icon,
    this.height,
    this.borderRadius,
    this.iconSize,
    this.buttonStyle,
  }) : super(key: key);

  final void Function() onPress;
  final String text;
  final double? fontSize;
  final double? iconSize;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? borderRadius;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    final defaultBorderRadius = BorderRadius.circular(borderRadius ?? 0);

    if (width != null) {
      if (icon != null) {
        return Column(
          children: [
            SizedBox(
              width: width,
              child: ElevatedButton.icon(
                onPressed: onPress,
                icon: Icon(icon, size: (iconSize ?? 20) * 1.3),
                label: Text(
                  text,
                  style: TextStyle(fontSize: fontSize ?? 16),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: defaultBorderRadius,
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SizedBox(
              width: width,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: defaultBorderRadius,
                    ),
                  ),
                ),
                onPressed: onPress,
                child: Text(
                  text,
                  style: TextStyle(fontSize: fontSize ?? 16),
                ),
              ),
            ),
          ],
        );
      }
    } else {
      if (icon != null) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                width: 30,
                height: height,
                child: ElevatedButton.icon(
                  onPressed: onPress,
                  icon: Icon(icon, size: (iconSize ?? 20) * 1.3),
                  label: Text(
                    text,
                    style: TextStyle(fontSize: fontSize ?? 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: defaultBorderRadius,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                width: 30,
                height: height,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: defaultBorderRadius,
                      ),
                    ),
                  ),
                  onPressed: onPress,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: fontSize ?? 16),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    }
  }
}
