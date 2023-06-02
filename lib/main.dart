import 'package:anime_app/core/BlocObserver/BlocObserver.dart';
import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/dio_helper.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/DefaultExceptionPage.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/Discover/presentation/cubit/search_cubit.dart';
import 'package:anime_app/features/Home/data/repositories/AnimeRepository.dart';
import 'package:anime_app/features/Home/presentation/pages/MainView.dart';
import 'package:anime_app/features/actors-voices/cubit/actors_cubit.dart';
import 'package:anime_app/features/characters/presentation/cubit/Repositry/CharactersRepository.dart';
import 'package:anime_app/features/characters/presentation/cubit/characters_cubit.dart';
import 'package:anime_app/features/favorite/data/repositories/DBHELPER.dart';
import 'package:anime_app/features/favorite/presentation/cubit/watch_anime_cubit.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/news/presentation/cubit/news_scrap_cubit.dart';
import 'package:anime_app/features/session/logic/Repository/Repository.dart';
import 'package:anime_app/features/session/logic/session_cubit.dart';

import 'features/Discover/data/repositories/SearchRepository.dart';
import 'features/actors-voices/repositories/AnimeRepository.dart';
import 'features/favorite/data/repositories/WatchRepository.dart';
import 'features/manga/data/Repository/Repository.dart';
import 'features/news/data/repositories/Repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await DBHelperFavorite.initDb();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavoriteCubit(
            favoriteRepository: FavoriteRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => NewsScrapCubit(
            repositoryNews: RepositoryNews(),
          ),
        ),
        BlocProvider(
          create: (context) => ActorsCubit(
            actorsRepository: ActorsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SessionCubit(
            sessionRepository: SessionRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CharactersCubit(
            charactersRepository: CharactersRepository(),
          ),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(animeRepository: AnimeRepository())..checkConnection(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            searchRepository: SearchRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => MangaCubit(
            repositoryManga: RepositoryManga(),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        initialRoute: '/',
        themeMode: ThemeMode.dark,
        onGenerateRoute: RouterGenerator.getRoute,
        darkTheme: appDarkTheme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            if (state is NoConnectedState) {
              return const DefaultExceptionPage(
                isInternet: true,
                child: NoInterNet(),
              );
            }
            return MainView();
          },
        ),
      ),
    );
  }
}

