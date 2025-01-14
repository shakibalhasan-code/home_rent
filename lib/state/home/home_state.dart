import 'package:get/get.dart';
import 'package:home_rent_ird_foundation/utils/const.dart';

import '../../data/models/home_model.dart';

class HomeState extends GetxController {
  final RxList<HomeModel> homes = <HomeModel>[].obs;
  var filterList = ['House', 'Apartment', 'Hotel', ' Villa'].obs;
  var filterTabSelectedIndex = 0.obs;

  @override
  void onInit() {
    homes.value = getHomeList();
    super.onInit();
  }

  List<HomeModel> getHomeList() {
    return [
      HomeModel(
          image: home1,
          homeName: 'Dreamsville House',
          homeOwner: 'Jl. Sultan Iskandar Muda',
          km: 1.3,
          priceYear: '3,00,000',
          totalBed: 4,
          totalBath: 3,
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
      HomeModel(
          image: home2,
          homeName: 'Ascot House',
          homeOwner: 'Jl. Cilandak Tengah',
          km: 1.3,
          priceYear: '2,50,000',
          totalBed: 5,
          totalBath: 6,
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
      HomeModel(
          image: home3,
          homeName: 'Shahriar House',
          homeOwner: 'J Shahriar Iskandar Muda',
          km: 1.3,
          priceYear: '3,80,000',
          totalBed: 2,
          totalBath: 2,
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
      HomeModel(
          image: home4,
          homeName: 'Jisan House',
          homeOwner: 'M Jisan Iskandar Muda',
          km: 1.3,
          priceYear: '4,20,000',
          totalBed: 5,
          totalBath: 3,
          description:
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
    ];
  }

  void selectedTabIndex(int i) {
    filterTabSelectedIndex.value = i;
  }
}
