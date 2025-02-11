const String base = 'assets';
const String baseSvg = '$base/svg';
const String basePng = '$base/png';

String svg(String name) => '$baseSvg/$name.svg';
String png(String name) => '$basePng/$name.png';

final flameIcon = png('flame_icon');
