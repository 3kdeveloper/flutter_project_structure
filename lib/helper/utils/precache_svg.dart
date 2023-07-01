import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_structure/helper/constants/images_resources.dart';

void precacheSvg() {
  Future.wait([
    svg.cache.putIfAbsent(cancel.cacheKey(null), () => cancel.loadBytes(null)),
  ]);
}

const cancel = SvgAssetLoader(ImagesResouces.cancelIcon);
