import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_ird_foundation/core/models/home_model.dart';
import 'package:home_rent_ird_foundation/utils/app_style.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';

class BestPropertyCard extends StatelessWidget {
  final HomeModel homeModel;
  final VoidCallback onTap;

  const BestPropertyCard({
    Key? key,
    required this.homeModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
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
                    style: defaultTextStyle,
                  ),
                  SizedBox(height: 4),
                  Text('Rp. ${homeModel.priceYear} /Year',
                      style: bodySmallText.copyWith(color: primaryColor)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        icBed,
                        height: 24,
                        width: 24,
                        color: greyColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${homeModel.totalBed} Bedroom',
                        style: bodySmallText.copyWith(color: greyColor),
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        icBath,
                        height: 24,
                        width: 24,
                        color: greyColor,
                      ),
                      SizedBox(width: 4),
                      Text('${homeModel.totalBath} Bathroom',
                          style: bodySmallText.copyWith(color: greyColor)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
