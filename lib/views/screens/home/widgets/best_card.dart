import 'package:flutter/material.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';

Widget buildBestPropertyCard(HomeModel homeModel) {
  return Container(
    height: 100,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            homeModel.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeModel.homeName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                homeModel.priceYear,
                style: TextStyle(
                  color: Colors.blue[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.king_bed_outlined, size: 20, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('${homeModel.totalBed} Bedroom'),
                  SizedBox(width: 16),
                  Icon(Icons.bathroom_outlined, size: 20, color: Colors.grey),
                  SizedBox(width: 4),
                  Text('${homeModel.totalBath} Bathroom'),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
