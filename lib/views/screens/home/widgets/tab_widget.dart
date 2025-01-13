import 'package:flutter/material.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';

Widget buildFilterChip(String label, bool isSelected) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    child: FilterChip(
      label: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      onSelected: (bool value) {},
      backgroundColor: Colors.white,
      selectedColor: primaryColor,
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
