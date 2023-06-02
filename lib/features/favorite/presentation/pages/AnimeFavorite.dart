import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/favorite/data/model/FavoriteAnime.dart';
import 'package:anime_app/features/favorite/presentation/cubit/watch_anime_cubit.dart';

class AnimeFavoriteScreen extends StatelessWidget {
  const AnimeFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'المفضلة',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: BlocBuilder<HomeCubit, HomeCubitState>(
              builder: (context, state) {
                var favoriteAnime = FavoriteCubit.get(context).favoriteAnime;
                return favoriteAnime.isEmpty
                    ? const Text('لايوجد اي شيء مفضل لديك')
                    : RefreshIndicator(
                        color: Colors.white,
                        backgroundColor: ColorsManager.primaryColor,
                        strokeWidth: 4.0,
                        onRefresh: () async {
                          HomeCubit.get(context).getFavorite();
                        },
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var data = favoriteAnime[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: SizeConfig.blockSizeVertical! * 50,
                                child: MainItem(
                                  onLongPress: () {
                                    HomeCubit.get(context).deleteFavoriteAnime(
                                        favoriteAnime: data);
                                  },
                                  onTap: () {
                                    _onTap(context: context, result: data);
                                  },
                                  image: data.image,
                                  textOnImage: data.title,
                                ),
                              ),
                            );
                          },
                          itemCount: favoriteAnime.length,
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  _onTap({required BuildContext context, required FavoriteAnime result}) {
    HomeCubit.get(context).getAllAnimeDetail(id: result.anime_id!);
    navigateTo(
      context: context,
      child: HomeDetailPage(),
    );
  }
}
