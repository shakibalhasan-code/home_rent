import 'package:home_rent_ird_foundation/utils/const.dart';

class HomeModel {
  final String homeName;
  final String homeOwner;
  final double km;
  final String priceYear;
  final int totalBed;
  final int totalBath;
  final String description;
  final String image;

  HomeModel(
      {required this.image,
      required this.homeName,
      required this.homeOwner,
      required this.km,
      required this.priceYear,
      required this.totalBed,
      required this.totalBath,
      required this.description});
}
