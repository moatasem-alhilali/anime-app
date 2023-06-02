import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/resources/app_theme.dart';
import 'package:anime_app/core/widgets/DetailItem.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/Home/presentation/cubit/home_cubit_cubit.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/actors-voices/cubit/actors_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/size_config.dart';

class ActorsDetail extends StatelessWidget {
  const ActorsDetail({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 3,
        child: BlocBuilder<ActorsCubit, ActorsState>(
          builder: (context, state) {
            var cubit = ActorsCubit.get(context);
            if (state is GetActorsFullDataLoadingState) {
              return const MyCircularProgressIndicator();
            } else {
              cubit.translate(cubit.fullActorsModel!.data!.about!);

              return cubit.fullActorsModel == null
                  ? const Text('لايوجد بيانات بعد')
                  : BasePageDetail(
                      isFavorite: false,
                      image:
                          cubit.fullActorsModel!.data!.images!.jpg!.imageUrl ??
                              '',
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TabBar(
                            onTap: (index) {
                              var id = cubit.fullActorsModel!.data!.malId!;
                              print(id);
                              if (index == 1) {
                                ActorsCubit.get(context).getImagesActorsData(
                                    id: cubit.fullActorsModel!.data!.malId!);
                              }
                              if (index == 2) {
                                ActorsCubit.get(context).getVoiceActorsData(
                                    id: cubit.fullActorsModel!.data!.malId!);
                              }
                            },
                            labelColor: Colors.white,
                            indicatorColor: ColorsManager.primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: const [
                              Tab(
                                child: Text('حول الشخصية'),
                              ),
                              Tab(
                                child: Text('  الصور '),
                              ),
                              Tab(
                                child: Text('المسلسلات'),
                              ),
                            ],
                          ),
                          //!anime movie car

                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 50,
                            child: TabBarView(
                              children: [
                                _infoActors(cubit: cubit),
                                cubit.actorsPictures == null
                                    ? Container()
                                    : _ActorsImage(cubit: cubit),
                                cubit.fullActorsModel == null
                                    ? Container()
                                    : _ActorsAnime(cubit: cubit),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            }
          },
        ),
      ),
    );
  }
}

class _ActorsImage extends StatelessWidget {
  const _ActorsImage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ActorsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsCubit, ActorsState>(
      builder: (context, state) {
        if (state is GetImageActorsLoadingState) {
          return const MyCircularProgressIndicator();
        }
        if (state is GetImageActorsErrorState) {
          return const WentWrong();
        }
        return cubit.actorsPictures == null
            ? const Text('لايوجد صور بعد')
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.actorsPictures!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainItem(
                    image: cubit.actorsPictures!.data![index].jpg!.imageUrl!,
                  );
                },
              );
      },
    );
  }
}

class _ActorsAnime extends StatelessWidget {
  const _ActorsAnime({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ActorsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsCubit, ActorsState>(
      builder: (context, state) {
        var cubit = ActorsCubit.get(context);
        if (state is GetVoiceActorsLoadingState) {
          return const MyCircularProgressIndicator();
        }
        if (state is GetVoiceActorsErrorState) {
          return const WentWrong();
        }
        return cubit.actorsVoice == null
            ? const Text('لايوجد بيانات')
            : ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.actorsVoice!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: SizeConfig.blockSizeVertical! * 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MainItem(
                                  onTap: () {
                                    navigateTo(
                                      context: context,
                                      child: HomeDetailPage(),
                                    );
                                    HomeCubit.get(context).getAllAnimeDetail(
                                      id: cubit.actorsVoice!.data![index].anime!
                                          .malId!,
                                    );
                                  },
                                  image: cubit.actorsVoice!.data![index].anime!
                                      .images!.jpg!.imageUrl!,
                                  textOnImage: cubit
                                      .actorsVoice!.data![index].anime!.title,
                                ),
                              ),
                              Text(' اسم الانمي'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: MainItem(
                                  textOnImage: cubit.actorsVoice!.data![index]
                                      .character!.name,
                                  image: cubit.actorsVoice!.data![index]
                                      .character!.images!.jpg!.imageUrl!,
                                ),
                              ),
                              const Text('دور الشخصية'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const MyDivider();
                },
              );
      },
    );
  }
}

class _infoActors extends StatelessWidget {
  const _infoActors({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ActorsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            cubit.fullActorsModel!.data!.name!,
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
                  "${cubit.fullActorsModel!.data!.favorites}",
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.grey,
                  size: 23,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  cubit.fullActorsModel!.data!.birthday!.split(':')[0],
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const MyDivider(),
        BlocBuilder<ActorsCubit, ActorsState>(
          builder: (context, state) {
            if (state is TranslateActorsState) {
              return Text(
                state.result!,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorsManager.gray,
                ),
              );
            } else {
              return Text(
                cubit.fullActorsModel!.data!.about!,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorsManager.gray,
                ),
              );
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
