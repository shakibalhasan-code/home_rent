import 'package:flutter/material.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: FilterChip(
        label: Text(
          label,
          style: bodySmallText.copyWith(
            color: isSelected ? Colors.white : greyColor,
          ),
        ),
        selected: isSelected,
        onSelected: (bool value) => onTap(),
        backgroundColor: simpleGrey,
        selectedColor: primaryColor.withOpacity(0.7),
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.transparent, width: 0), // Fully transparent border
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
