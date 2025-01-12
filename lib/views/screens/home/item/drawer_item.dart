import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

class DrawerItem extends StatefulWidget {
  final String icon;
  final String label;
  final bool isClicked;
  final VoidCallback onTap;

  const DrawerItem(
      {Key? key,
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
            leading: SvgPicture.asset(
              widget.icon,
              color: widget.isClicked ? primaryColor : whiteColor,
              height: 24,
              width: 24,
            ),
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
