import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/characters/presentation/cubit/characters_cubit.dart';

import 'HomeDetaile.dart';

class SeeAllAnime extends StatelessWidget {
  const SeeAllAnime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: BlocConsumer<CharactersCubit, CharactersState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    var result =
                        HomeCubit.get(context).topAnimeModel!.data![index];

                    return MainItem(
                      onTap: () {
                        HomeCubit.get(context)
                            .getAllAnimeDetail(id: result.malId!);
                        navigateTo(
                          context: context,
                          child: HomeDetailPage(),
                        );
                      },
                      image: result.images!.jpg!.imageUrl!,
                      textOnImage: result.title,
                    );
                  },
                  itemCount: HomeCubit.get(context).topAnimeModel!.data!.length,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: 2,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
