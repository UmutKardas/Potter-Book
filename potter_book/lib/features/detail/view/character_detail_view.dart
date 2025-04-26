import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:potter_book/constants/app_padding.dart';
import 'package:potter_book/constants/app_radius.dart';
import 'package:potter_book/controller/character_controller.dart';
import 'package:potter_book/extension/string_extension.dart';
import 'package:potter_book/features/detail/view/character_detail_tile.dart';
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
          CharacterDetailTile(
            info: 'House: ${character.house.name.capitalize()}',
            size: size,
          ),
        if (character.gender.name.isNotEmpty)
          CharacterDetailTile(
            info: 'Gender: ${character.gender.name}',
            size: size,
          ),
        if (character.ancestry.name.isNotEmpty)
          CharacterDetailTile(
            info: 'Ancestry: ${character.ancestry.name}',
            size: size,
          ),
        if (character.species.name.isNotEmpty)
          CharacterDetailTile(
            info: 'Species: ${character.species.name}',
            size: size,
          ),
        if (character.actor.isNotEmpty)
          CharacterDetailTile(info: 'Actor: ${character.actor}', size: size),
      ],
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
