import 'package:flutter/material.dart';
import 'package:potter_book/constants/app_radius.dart';

class CharacterDetailTile extends StatelessWidget {
  final String info;
  final Size size;

  const CharacterDetailTile({
    super.key,
    required this.info,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final parts = info.split(':');
    final title = parts.length > 1 ? '${parts[0]}:' : info;
    final content = parts.length > 1 ? parts.sublist(1).join(':') : '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: size.width,
        height: size.width * 0.15,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(AppRadius.segmentRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surface.withAlpha(30),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
