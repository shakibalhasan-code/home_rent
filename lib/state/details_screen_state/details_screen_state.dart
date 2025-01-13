import 'package:get/get.dart';

class DetailsScreenState extends GetxController {
  var isTextExpanded = false.obs;

  String getTruncatedText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }
}
