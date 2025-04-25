import 'package:flutter/material.dart';
import 'package:potter_book/constants/app_color.dart';
import 'package:potter_book/constants/app_svg_paths.dart';

class HouseModel {
  List<House> houses = [
    const House(
      name: 'Gryffindor',
      logoPath: AppSvgPaths.gryffindor,
      color: AppColor.gryffindor,
    ),
    const House(
      name: 'Hufflepuff',
      logoPath: AppSvgPaths.hufflepuff,
      color: AppColor.hufflepuff,
    ),
    const House(
      name: 'Ravenclaw',
      logoPath: AppSvgPaths.ravenclaw,
      color: AppColor.ravenclaw,
    ),
    const House(
      name: 'Slytherin',
      logoPath: AppSvgPaths.slytherin,
      color: AppColor.slytherin,
    ),
  ];
}

class House {
  final String name;
  final String logoPath;
  final Color color;

  const House({
    required this.name,
    required this.logoPath,
    required this.color,
  });
}
