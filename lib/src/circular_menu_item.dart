import 'package:flutter/material.dart';

class CircularMenuItem extends StatelessWidget {
  /// if icon and animatedIcon are passed, icon will be ignored
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;
  final double iconSize;
  final double padding;
  final double margin;
  final List<BoxShadow> boxShadow;
  final Image image;
  final AnimatedIcon animatedIcon;

  /// creates a menu item .
  /// [onTap] must not be null.
  /// [padding] and [margin]  must be equal or greater than zero.
  CircularMenuItem({
    @required this.onTap,
    this.icon,
    this.color,
    this.iconSize = 30,
    this.boxShadow,
    this.iconColor,
    this.image,
    this.animatedIcon,
    this.padding = 10,
    this.margin = 10,
  })  : assert(onTap != null),
        assert(padding >= 0.0),
        assert(margin >= 0.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: color ?? Theme.of(context).primaryColor,
                blurRadius: 10,
              ),
            ],
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Material(
          color: color ?? Theme.of(context).primaryColor,
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: animatedIcon != null
                  ? animatedIcon
                  : image != null
                      ? Container(
                color: iconColor,
                          child: image,
                          width: iconSize,
                        )
                      : Icon(
                          icon,
                          size: iconSize,
                          color: iconColor ?? Colors.white,
                        ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
