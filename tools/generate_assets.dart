import 'dart:io';

import 'package:image/image.dart';

void main() {
  final imageDir = Directory('assets/images');
  if (!imageDir.existsSync()) {
    imageDir.createSync(recursive: true);
  }

  final files = {
    'mi_ayam.png': ColorRgb8(255, 176, 0),
    'batagor.png': ColorRgb8(43, 159, 90),
    'es_teh.png': ColorRgb8(79, 195, 247),
    'bakso.png': ColorRgb8(229, 115, 115),
    'nasi_goreng.png': ColorRgb8(249, 168, 37),
  };

  for (final entry in files.entries) {
    final image = Image(width: 400, height: 300);
    fill(image, color: entry.value);

    final file = File('${imageDir.path}/${entry.key}');
    file.writeAsBytesSync(PngEncoder(level: 9).encode(image));
    stdout.writeln('Created ${entry.key}');
  }
}
