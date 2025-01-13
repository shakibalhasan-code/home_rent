import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/views/glob_widgets/my_icon_widget.dart';

class DrawerItem extends StatefulWidget {
  final String icon;
  final String label;
  final bool isClicked;
  final VoidCallback onTap;
  final bool? isTint;

  const DrawerItem(
      {Key? key,
      this.isTint,
      required this.icon,
      required this.label,
      required this.isClicked,
      required this.onTap})
      : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.onTap();
        });
      },
      borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
            color: widget.isClicked ? whiteColor : null),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: ListTile(
            leading: MyIconWidget(
                isTint: widget.isTint,
                svgIcon: widget.icon,
                iconColor: widget.isClicked ? primaryColor : whiteColor),
            title: Text(
              widget.label,
              style: defaultTextStyle.copyWith(
                  fontSize: 16,
                  color: widget.isClicked ? primaryColor : whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
