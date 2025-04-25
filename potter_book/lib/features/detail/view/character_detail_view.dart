import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/constants/app_radius.dart';
import 'package:potter_book/controller/character_controller.dart';
import 'package:potter_book/extension/string_extension.dart';
import 'package:potter_book/model/character.dart';

class CharacterDetailView extends ConsumerWidget {
  const CharacterDetailView({super.key, required this.characterID});

  final String characterID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Character?> characterAsyncValue = ref.watch(
      characterProvider(characterID),
    );
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pagePadding,
          child: characterAsyncValue.when(
            data: (character) {
              if (character == null) {
                Future.microtask(() => Navigator.pop(context));
                return const Center(child: Text('Character not found'));
              }
              return _buildCharacterDetails(character, size, context);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterDetails(
    Character character,
    Size size,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Conditional CircleAvatar rendering
        if (character.image?.isNotEmpty ?? false)
          CircleAvatar(
            radius: size.width * 0.2,
            backgroundImage: NetworkImage(character.image!),
          ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            character.name.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 10),
        if (character.house.name.isNotEmpty)
          _listTile(
            size,
            context,
            'House: ${character.house.name.capitalize()}',
          ),
        if (character.gender.name.isNotEmpty)
          _listTile(size, context, 'Gender: ${character.gender.name}'),
        if (character.ancestry.name.isNotEmpty)
          _listTile(size, context, 'Ancestry: ${character.ancestry.name}'),
        if (character.species.name.isNotEmpty)
          _listTile(size, context, 'Species: ${character.species.name}'),
        if (character.actor.isNotEmpty)
          _listTile(size, context, 'Actor: ${character.actor}'),
      ],
    );
  }

  Widget _listTile(Size size, BuildContext context, String info) {
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
            child: Text(info, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Character Details",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          context.go('/');
        },
      ),
    );
  }
}
