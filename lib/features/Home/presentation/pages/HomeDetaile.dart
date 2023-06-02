import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/CustomButton.dart';
import 'package:anime_app/core/widgets/DetailItem.dart';
import 'package:anime_app/core/widgets/loading.dart';
import 'package:anime_app/features/Home/data/models/animeDetailFull.dart';

import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:readmore/readmore.dart';

import 'YoutubePlayerHome.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        var animeDetailFull = HomeCubit.get(context).animeDetailFull;
        var cubitMain = HomeCubit.get(context);
        if (state is GetAllAnimeDataDetailLoadingState) {
          return const MyCircularProgressIndicator();
        }
        return HomeCubit.get(context).animeDetailFull == null
            ? const MyCircularProgressIndicator()
            : BasePageDetail(
                isFavorite: true,
                favoriteFunction: () {
                  cubitMain
                      .addToFavorite(
                    title: animeDetailFull!.data!.title!,
                    anime_id: animeDetailFull.data!.malId!,
                    image: animeDetailFull.data!.images!.jpg!.imageUrl!,
                  )
                      .then((value) {
                    if (value == 0) {
                      showToast(message: ' موجود بالفعل');
                    } else {
                      showToast(message: 'تم الاضافه بنجاح');
                    }
                    print(value);
                  });
                },
                image: animeDetailFull!.data!.images!.jpg!.imageUrl!,
                body: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            animeDetailFull.data!.title!,
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
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 23,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  HomeCubit.get(context)
                                      .animeDetailFull!
                                      .data!
                                      .rating!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer,
                                  color: Colors.grey,
                                  size: 23,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  HomeCubit.get(context)
                                      .animeDetailFull!
                                      .data!
                                      .duration!,
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const MyDivider(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              var id = HomeCubit.get(context)
                                  .animeDetailFull!
                                  .data!
                                  .malId;
                              HomeCubit.get(context).getAnimeReview(id: id!);
                              ReviewBS(context);
                            },
                            text: 'المراجعات',
                            color: Colors.white,
                            borderColor: ColorsManager.clr,
                            fillColor: ColorsManager.clr,
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            color: Colors.white,
                            borderColor: ColorsManager.clr,
                            fillColor: ColorsManager.clr,
                            text: 'الاخبار',
                            onTap: () {
                              var id = HomeCubit.get(context)
                                  .animeDetailFull!
                                  .data!
                                  .malId;
                              HomeCubit.get(context).getAnimeNews(id: id!);
                              _NewsBS(context);
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            color: Colors.white,
                            borderColor: ColorsManager.clr,
                            fillColor: ColorsManager.clr,
                            text: 'موصى به',
                            onTap: () {
                              var id = HomeCubit.get(context)
                                  .animeDetailFull!
                                  .data!
                                  .malId;
                              HomeCubit.get(context)
                                  .getAnimeRecommended(id: id!);
                              _RecommendedBS(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            color: Colors.white,
                            borderColor: ColorsManager.clr,
                            fillColor: ColorsManager.clr,
                            text: 'عرض الأنمي',
                            onTap: () {
                              _youtubePlayerBS(context);
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            color: Colors.white,
                            borderColor: ColorsManager.clr,
                            fillColor: ColorsManager.clr,
                            text: 'الطاقم',
                            onTap: () {
                              cubitMain.getAnimeStaff(
                                  id: animeDetailFull.data!.malId!);
                              _StaffBS(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    const MyDivider(),
                    BlocBuilder<HomeCubit, HomeCubitState>(
                      builder: (context, state) {
                        var cubit = HomeCubit.get(context).animeDetailFull;
                        if (state is GetAllAnimeDataDetailLoadingState) {
                          return const MyCircularProgressIndicator();
                        }
                        return cubit == null
                            ? Container()
                            : _ChipsDetail(
                                cubit: cubit,
                              );
                      },
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'ملخص ',
                            style: TextStyle(
                                color: ColorsManager.white, fontSize: 18),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            HomeCubit.get(context)
                                .translate(animeDetailFull.data!.synopsis!);
                          },
                          icon: const Icon(Icons.translate),
                        ),
                      ],
                    ),
                    BlocBuilder<HomeCubit, HomeCubitState>(
                      builder: (context, state) {
                        if (state is TranslateState) {
                          return ReadMoreText(
                            state.result!,
                            trimLines: 3,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            textDirection: TextDirection.rtl,
                            trimCollapsedText: 'قرائة المزيد',
                            trimExpandedText: 'قرائة القليل',
                            moreStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                            lessStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          );
                        } else {
                          return ReadMoreText(
                            animeDetailFull.data!.synopsis!,
                            trimLines: 3,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'عرض اكثر',
                            trimExpandedText: 'عرض اقل',
                            moreStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                            ),
                            lessStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
      },
    );
  }

  Future<dynamic> _youtubePlayerBS(BuildContext context) {
    return MyBottomSheet(
      context: context,
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          var data = HomeCubit.get(context).animeYoutubeVideo;
          if (state is GetAnimeYoutubeVideoErrorState) {
            return const Text('حدث خطاء ما');
          }
          return data == null
              ? const MyCircularProgressIndicator()
              : GridView.builder(
                  itemCount: data.data!.promo!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: SizeConfig.blockSizeVertical! * 50,
                      child: MainItem(
                        image:
                            data.data!.promo![index].trailer!.images!.imageUrl,
                        textOnImage: data.data!.promo![index].title,
                        onTap: () {
                          navigateTo(
                            child: YouTubePlayerPage(
                              title: data.data!.promo![index].title ?? '',
                              youtubeId:
                                  data.data!.promo![index].trailer!.youtubeId!,
                              animeYoutubeVideo: data,
                            ),
                            context: context,
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('اضغط هنا للمشاهده'),
                        ),
                      ),
                    );
                  },
                );
          // }
        },
      ),
    );
  }

  Future<dynamic> _RecommendedBS(BuildContext context) {
    return MyBottomSheet(
      context: context,
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          var data = HomeCubit.get(context).animeRecommended;
          if (state is GetAnimeRecommendedLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: const CircularProgressIndicator()),
              ],
            );
          } else {
            return data == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Center(child: const CircularProgressIndicator()),
                    ],
                  )
                : GridView.builder(
                    itemCount: data.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: SizeConfig.blockSizeVertical! * 50,
                        child: MainItem(
                          image: data.data![index].entry!.images!.jpg!.imageUrl,
                          textOnImage: data.data![index].entry!.title,
                          onTap: () {
                            HomeCubit.get(context).getAllAnimeDetail(
                                id: data.data![index].entry!.malId!);
                            navigateTo(
                              context: context,
                              child: HomeDetailPage(),
                            );
                          },
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  Future<dynamic> _StaffBS(BuildContext context) {
    return MyBottomSheet(
      context: context,
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          var data = HomeCubit.get(context).animeStaff;
          if (state is GetAnimeStaffErrorState) {
            return const WentWrong();
          }
          if (state is GetAnimeStaffLoadingState) {
            return const MyCircularProgressIndicator();
          } else {
            return data == null
                ? const MyCircularProgressIndicator()
                : GridView.builder(
                    itemCount: data.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: SizeConfig.blockSizeVertical! * 50,
                        child: MainItem(
                          image:
                              data.data![index].person!.images!.jpg!.imageUrl!,
                          textOnImage: data.data![index].person!.name!,
                          onTap: () {
                            HomeCubit.get(context).getAllAnimeDetail(
                                id: data.data![index].person!.malId!);
                            navigateTo(
                              context: context,
                              child: HomeDetailPage(),
                            );
                          },
                        ),
                      );
                    },
                  );
          }
        },
      ),
    );
  }

  Future<dynamic> _NewsBS(BuildContext context) {
    return MyBottomSheet(
      context: context,
      child: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            var data = HomeCubit.get(context).animeNews;
            if (state is GetAnimeNewsLoadingState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(child: const CircularProgressIndicator()),
                ],
              );
            } else if (state is GetAnimeNewsSuccessState) {
              return data == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: const CircularProgressIndicator()),
                      ],
                    )
                  : Column(
                      children: [
                        for (int i = 0; i < data.data!.length; i++)
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: ColorsManager.clr,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.data![i].authorUsername!,
                                      ),
                                      Text(
                                        data.data![i].date!.split(':')[0],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        data.data![i].excerpt!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                data.data![i].images!.jpg!.imageUrl == ""
                                    ? Container()
                                    : Expanded(
                                        child: ClipRRect(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            data.data![i].images!.jpg!
                                                .imageUrl!,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                      ],
                    );
            } else {
              return const MyCircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> ReviewBS(BuildContext context) {
    return MyBottomSheet(
      context: context,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<HomeCubit, HomeCubitState>(
            builder: (context, state) {
              var data = HomeCubit.get(context).animeOverview;
              if (state is GetAnimeOverviewLoadingState) {
                return const MyCircularProgressIndicator();
              } else if (state is GetAnimeOverviewSuccessState) {
                return Column(
                  children: [
                    for (int i = 0; i < data!.data!.length; i++)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: ColorsManager.clr,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              '${data.data![i].user!.images!.jpg!.imageUrl}'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${data.data![i].user!.username}',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${data.data![i].date}'.split(':')[0],
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${data.data![i].review}',
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const MyDivider(),
                        ],
                      ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(2.0),
      child: Divider(),
    );
  }
}

class _ChipsDetail extends StatelessWidget {
  _ChipsDetail({
    Key? key,
    this.cubit,
  }) : super(key: key);

  DataFullModel? cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('الحلقات'),
                Text(
                  '${cubit!.data!.episodes}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                const Text('الاعضاء'),
                Text(
                  '${cubit!.data!.members}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                const Text('الشعبية'),
                Text(
                  '${cubit!.data!.popularity}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: [
                const Text('الاعجابات'),
                Text(
                  '${cubit!.data!.favorites}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Divider(),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Text(
                      'الانواع',
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < cubit!.data!.genres!.length; i++)
                        Text(
                          '${cubit!.data!.genres![i].name}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Text(
                      'المنتجين',
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < cubit!.data!.producers!.length; i++)
                        Text(
                          '${cubit!.data!.producers![i].name}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Text(
                      'الاستديو',
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < cubit!.data!.studios!.length; i++)
                        Text(
                          '${cubit!.data!.studios![i].name}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4),
                    child: Text(
                      'المرخصين ',
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < cubit!.data!.licensors!.length; i++)
                        Text(
                          '${cubit!.data!.licensors![i].name}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
