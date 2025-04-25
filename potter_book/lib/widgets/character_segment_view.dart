import 'package:flutter/material.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/constants/app_radius.dart';

class CharacterSegmentView extends StatelessWidget {
  const CharacterSegmentView({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: Padding(
      padding: AppPadding.segmentPadding,
      child: _segmentStyle(context),
    ),
  );

  Container _segmentStyle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/harry.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(AppRadius.segmentRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: _segmentContent(context),
    );
  }

  Stack _segmentContent(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(100),
            borderRadius: BorderRadius.circular(AppRadius.segmentRadius),
          ),
        ),
        Padding(
          padding: AppPadding.segmentPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:
                CrossAxisAlignment.start, // Burada sola yaslıyoruz
            children: [
              Text(
                'Harry Potter',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Gryffindor',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
