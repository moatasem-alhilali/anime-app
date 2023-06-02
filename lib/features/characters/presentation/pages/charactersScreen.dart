import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

import 'CharactersDeatile.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'أفضل الشخصيات',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: BlocBuilder<CharactersCubit, CharactersState>(
              builder: (context, state) {
                var cubit = CharactersCubit.get(context);
                if (state is GetCharactersDataLoadingState) {
                  return const MyCircularProgressIndicator();
                }
                if (state is GetCharactersDataErrorState) {
                  return const WentWrong();
                }
                return cubit.charactersModel == null
                    ? const MyCircularProgressIndicator()
                    : GridView.builder(
                        itemBuilder: (context, index) {
                          var data = cubit.charactersModel!.data![index];
                          return MainItem(
                            onTap: () {
                              cubit.getAllDataDetailCharacters(
                                id: data.malId!,
                              );
                              //
                              navigateTo(
                                child: const CharactersDetail(),
                                context: context,
                              );
                              //
                              //translate
                            },
                            image: data.images!.jpg!.imageUrl!,
                            textOnImage: data.name,
                          );
                        },
                        itemCount: CharactersCubit.get(context)
                            .charactersModel!
                            .data!
                            .length,
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.5,
                          crossAxisCount: 2,
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
