import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/DetailItem.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';

import 'package:anime_app/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

class CharactersDetail extends StatelessWidget {
  const CharactersDetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var cubit = CharactersCubit.get(context);
    return DefaultTabController(
      length: 4,
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          var fullCharacterModel =
              CharactersCubit.get(context).fullCharacterModel;

          if (state is GetAllCharactersDataLoadingState) {
            return const MyCircularProgressIndicator();
          }
          if (state is GetAllCharactersDataErrorState) {
            return const WentWrong();
          }
          return fullCharacterModel == null
              ? const Text('لايوجد بيانات بعد')
              : BasePageDetail(
                  image: fullCharacterModel.data!.images!.jpg!.imageUrl!,
                  isFavorite: false,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              fullCharacterModel.data!.name!,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "${fullCharacterModel.data!.favorites!}",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.fact_check_rounded,
                                    color: Colors.grey,
                                    size: 23,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    fullCharacterModel.data!.nameKanji!,
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      TabBar(
                        onTap: (index) {
                          var id = cubit.fullCharacterModel!.data!.malId;
                          if (index == 1) {
                            cubit.getDetailCharactersPictures(id: id!);
                          }
                          if (index == 2) {
                            cubit.getDetailAnimeCharacters(id: id!);
                          }
                          if (index == 3) {
                            cubit.getDetailCharactersVoices(id: id!);
                          }
                        },
                        labelColor: Colors.white,
                        indicatorColor: ColorsManager.primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(
                            child: Text('حول '),
                          ),
                          Tab(
                            child: Text('  الصور '),
                          ),
                          Tab(
                            child: Text('المسلسلات'),
                          ),
                          Tab(
                            child: Text('الاصوات '),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 50,
                        child: TabBarView(
                          children: [
                            BlocBuilder<CharactersCubit, CharactersState>(
                              builder: (context, state) {
                                CharactersCubit.get(context)
                                    .translate(fullCharacterModel.data!.about!);
                                if (state is TranslateCharactersState) {
                                  return Text(
                                    state.result!,
                                    maxLines: 8,
                                    style: const TextStyle(fontSize: 16),
                                  );
                                } else {
                                  return Text(
                                    fullCharacterModel.data!.about!,
                                    maxLines: 8,
                                    style: const TextStyle(fontSize: 16),
                                  );
                                }
                              },
                            ),

                            //second
                            _CharacterPictures(cubit: cubit),

                            //third
                            _CharacterAnimes(cubit: cubit),

                            //fourth

                            _CharacterVoice(cubit: cubit),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class _CharacterPictures extends StatelessWidget {
  const _CharacterPictures({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is GetPicturesCharactersDataLoadingState) {
          return const MyCircularProgressIndicator();
        }
        if (state is GetPicturesCharactersDataErrorState) {
          return const WentWrong();
        }
        return cubit.characterPictures == null
            ? const Text('لايوجد صور بعد')
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                // physics: const BouncingScrollPhysics(),
                itemCount: cubit.characterPictures!.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return MainItem(
                    image: cubit.characterPictures!.data![i].jpg!.imageUrl,
                  );
                },
              );
      },
    );
  }
}

class _CharacterAnimes extends StatelessWidget {
  const _CharacterAnimes({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is GetAnimeCharactersDataLoadingState) {
          return const MyCircularProgressIndicator();
        }
        if (state is GetAnimeCharactersDataErrorState) {
          return const WentWrong();
        }
        return cubit.characterAnimes == null
            ? const Text('لايوجد بيانات بعد')
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                // physics: const BouncingScrollPhysics(),
                itemCount: cubit.characterAnimes!.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return MainItem(
                    onTap: () {
                      navigateTo(
                        context: context,
                        child: HomeDetailPage(),
                      );
                      HomeCubit.get(context).getAllAnimeDetail(
                          id: cubit.characterAnimes!.data![i].anime!.malId!);
                    },
                    image: cubit.characterAnimes!.data![i].anime!.images!.jpg!
                        .imageUrl!,
                    textOnImage: cubit.characterAnimes!.data![i].anime!.title,
                  );
                },
              );
      },
    );
  }
}

class _CharacterVoice extends StatelessWidget {
  const _CharacterVoice({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final CharactersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is GetVoiceCharactersDataLoadingState) {
          return const MyCircularProgressIndicator();
        }
        if (state is GetVoiceCharactersDataErrorState) {
          return const WentWrong();
        }
        return cubit.characterActorsVoices == null
            ? const Text('لايوجد بيانات بعد')
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.characterActorsVoices!.data!.length,
                itemBuilder: (BuildContext context, int i) {
                  return MainItem(
                    image: cubit.characterActorsVoices!.data![i].person!.images!
                        .jpg!.imageUrl,
                    textOnImage:
                        cubit.characterActorsVoices!.data![i].person!.name!,
                  );
                },
              );
      },
    );
  }
}
