import 'package:get/get.dart';

Rx<String> transformMoney(int value) {
  final textRepresentation = value
      .toDouble()
      .toDouble()
      .toStringAsFixed(2)
      .replaceAll('.', '')
      .split('')
      .reversed
      .toList(growable: true)
      .obs;

  textRepresentation.value.insert(2, ',');

  for (var i = 2 + 4; true; i = i + 4) {
    if (textRepresentation.value.length > i) {
      textRepresentation.value.insert(i, '.');
    } else {
      break;
    }
  }

  var currency = Get.locale.toString() == 'pt_BR' ? 'R\$'.obs : '\$'.obs;

  return '$currency ${textRepresentation.value.reversed.join('')}'.obs;
}
