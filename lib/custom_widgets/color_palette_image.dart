import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorPaletteImage extends StatefulWidget {
  final CachedNetworkImageProvider provider;
  final String url;
  final double? size;
  final Function(int color) onColorGenerated;
  final bool Function() isColorFetched;

  ColorPaletteImage({
    super.key,
    this.size,
    required this.url,
    required this.onColorGenerated,
    required this.isColorFetched,
  }) : provider = CachedNetworkImageProvider(url);

  @override
  State<ColorPaletteImage> createState() =>
      _CustomImageColorPaletteState();
}

class _CustomImageColorPaletteState extends State<ColorPaletteImage> {
  @override
  void initState() {
    var colorGenerated = widget.isColorFetched.call();
    if (!colorGenerated) {
      generateColors();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image(image: widget.provider);
  }

  void generateColors() async {
    return PaletteGenerator.fromImageProvider(widget.provider).then((value) {
      var color = value.dominantColor?.color;
      if (color == null) return;
      widget.onColorGenerated.call(color.value);
    });
  }
}
