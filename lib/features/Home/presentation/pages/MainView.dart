import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/resources/assets_manager.dart';
import 'package:anime_app/core/widgets/DetailItem.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/favorite/presentation/cubit/watch_anime_cubit.dart';
import 'package:anime_app/features/favorite/presentation/pages/AnimeFavorite.dart';
import 'package:anime_app/features/Discover/presentation/pages/HomeSearch.dart';
import 'package:anime_app/features/Discover/presentation/pages/HomeSearchImage.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/pages/HomePage.dart';
import 'package:anime_app/features/actors-voices/cubit/actors_cubit.dart';
import 'package:anime_app/features/actors-voices/pages/ActorsScreen.dart';
import 'package:anime_app/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:anime_app/features/characters/presentation/pages/charactersScreen.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/manga/presentation/page/MangaHome.dart';
import 'package:anime_app/features/news/presentation/cubit/news_scrap_cubit.dart';
import 'package:anime_app/features/news/presentation/pages/NewsHome.dart';
import 'package:anime_app/features/session/logic/session_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:anime_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        if (state is GetDataHomeLoadingState) {
          return const DefaultExceptionPage(
            isInternet: false,
            child: MyCircularProgressIndicator(),
          );
        }
        if (state is GetDataHomeErrorState) {
          return const DefaultExceptionPage(
            isInternet: true,
            child: WentWrong(),
          );
        }
        return cubit.topAnimeModel == null
            ? const DefaultExceptionPage(
                isInternet: false,
                child: MyCircularProgressIndicator(),
              )
            : Container(
                decoration: myDecoration(),
                child: Scaffold(
                  drawer: const MyDrawer(),
                  appBar: AppBar(
                    actions: [
                      IconButton(
                        onPressed: () {
                          navigateTo(
                            context: context,
                            child: HomeSearch(),
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                        ),
                      )
                    ],
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.transparent,
                  body: HomePage(),
                  // body: BasePageDetail(isFavorite: false),
                ),
              );
      },
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.background,
      child: Column(
        children: [
          Image.asset(
            'assets/icon/logo.png',
            fit: BoxFit.cover,
            height: SizeConfig.blockSizeVertical! * 30,
          ),
          _MyListTile(
            isSvg: true,
            title: 'المواسم',
            svg: AssetsManager.season,
            onTap: () {
              navigateTo(
                context: context,
                child: const HomeSession(),
              );
              SessionCubit.get(context).getSessionAllData();
            },
          ),
          _MyListTile(
            isSvg: true,
            svg: AssetsManager.searchByImage,
            title: 'البحث من خلال الصورة',
            onTap: () {
              navigateTo(
                child: HomeSearchImage(),
                context: context,
              );
            },
          ),
          _MyListTile(
            isSvg: true,
            svg: AssetsManager.manga,
            title: 'المانجا',
            onTap: () {
              navigateTo(
                child: const MangaHome(),
                context: context,
              );
              MangaCubit.get(context).getDataMangaHome();
            },
          ),
          _MyListTile(
            isSvg: true,
            svg: AssetsManager.news,
            title: 'الاخبار',
            onTap: () {
              navigateTo(context: context, child: NewsHome());
              NewsScrapCubit.get(context).getNewsScrap();
            },
          ),
          _MyListTile(
            isSvg: true,
            svg: AssetsManager.character,
            title: 'الشخصيات الاكثر شعبية',
            onTap: () {
              navigateTo(child: const CharactersScreen(), context: context);
              CharactersCubit.get(context).getTopCharacter();
            },
          ),
          _MyListTile(
            isSvg: true,
            svg: AssetsManager.voiceActors,
            title: 'مؤدين الاصوات الاكثر شعبية',
            onTap: () {
              ActorsCubit.get(context).getTopActors();

              navigateTo(child: const ActorsScreen(), context: context);
            },
          ),
          const MyDivider(),
          _MyListTile(
            isSvg: false,
            icon: Icons.favorite_border_outlined,
            title: 'انمياتي المفضلة',
            onTap: () {
              FavoriteCubit.get(context).getFavorite();
              navigateTo(child: const AnimeFavoriteScreen(), context: context);
            },
          ),
        ],
      ),
    );
  }
}

class _MyListTile extends StatelessWidget {
  _MyListTile(
      {Key? key, this.title, this.onTap, this.svg, this.icon, this.isSvg})
      : super(key: key);
  String? title;
  String? svg;
  bool? isSvg;
  IconData? icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        trailing: isSvg!
            ? SvgPicture.asset(
                svg!,
                color: Color.fromARGB(255, 181, 181, 181),
                height: 25,
              )
            : Icon(
                icon,
                color: Color.fromARGB(255, 181, 181, 181),
              ),
        selectedTileColor: ColorsManager.clr,
        selectedColor: ColorsManager.clr,
        leading: Text(
          title ?? 'اكتشف',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
