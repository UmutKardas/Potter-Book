import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/constants/app_radius.dart';
import 'package:potter_book/features/home/model/house_model.dart';

class HouseSegmentView extends StatelessWidget {
  const HouseSegmentView({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: _segmentDecoration(),
        child: Padding(
          padding: AppPadding.segmentPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                house.logoPath,
                width: size.width * 0.3,
                height: size.width * 0.3,
              ),

              Text(house.name, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _segmentDecoration() {
    return BoxDecoration(
      color: house.color,
      borderRadius: BorderRadius.circular(AppRadius.segmentRadius),
      boxShadow: [
        BoxShadow(
          color: house.color.withAlpha(100),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
