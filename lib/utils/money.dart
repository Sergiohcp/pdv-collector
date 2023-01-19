

transformMoney(double value) {
  final textRepresentation = value
      .toDouble()
      .toDouble()
      .toStringAsFixed(2)
      .replaceAll('.', '')
      .split('')
      .reversed
      .toList(growable: true);

  textRepresentation.insert(2, ',');

  for (var i = 2 + 4; true; i = i + 4) {
    if (textRepresentation.length > i) {
      textRepresentation.insert(i, '.');
    } else {
      break;
    }
  }

  return 'R\$ ${textRepresentation.reversed.join('')}';
}
