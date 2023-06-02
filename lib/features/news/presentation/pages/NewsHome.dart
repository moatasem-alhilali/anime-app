import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_scrap_cubit.dart';
import 'NewsDetail.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('اخبار الانمي'),
            ),
            body: BlocBuilder<NewsScrapCubit, NewsScrapState>(
              builder: (context, state) {
                var cubit = NewsScrapCubit.get(context);
                if (state is GetNewsScrapeLoadingState) {
                  return const MyCircularProgressIndicator();
                } else {
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TabBar(
                            labelColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                child: Text('اخبار الانمي'),
                              ),
                              Tab(
                                child: Text(' لائحة الانمي'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 80,
                            child: TabBarView(
                              children: [
                                _AnimeNews(cubit: cubit, isAnimeNews: true),
                                _AnimeNews(cubit: cubit, isAnimeNews: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimeNews extends StatelessWidget {
  _AnimeNews({
    Key? key,
    this.isAnimeNews,
    required this.cubit,
  }) : super(key: key);

  final NewsScrapCubit cubit;
  bool? isAnimeNews;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: ColorsManager.primaryColor,
      strokeWidth: 4.0,
      onRefresh: () async {
        cubit.getNewsScrap();
      },
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: isAnimeNews!
            ? cubit.newsScrapData.length
            : cubit.animeNewsInfo.length,
        itemBuilder: (BuildContext context, int index) {
          var data = cubit.newsScrapData[index];
          var dataInfo = cubit.animeNewsInfo[index];
          var image =
              data.cover!.split("background-image: url('")[1].split("');")[0];
          var imageinfo = dataInfo.cover!
              .split("background-image: url('")[1]
              .split("');")[0];
          return cubit.newsScrapData.isEmpty
              ? const MyCircularProgressIndicator()
              : SizedBox(
                  height: SizeConfig.blockSizeVertical! * 40,
                  child: MainItem(
                    onTap: () {
                      if (isAnimeNews!) {
                        navigateTo(
                          context: context,
                          child: NewsDetail(
                            image: image,
                            title: data.title,
                          ),
                        );
                        cubit.getNewsScrapDetail(link: data.link!);
                      } else {
                        navigateTo(
                          context: context,
                          child: NewsDetail(
                            image: imageinfo,
                            title: dataInfo.title,
                          ),
                        );
                        cubit.getNewsScrapDetail(link: dataInfo.link!);
                      }
                    },
                    image: isAnimeNews! ? image : imageinfo,
                    childInImage: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isAnimeNews! ? data.title! : dataInfo.title!,
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          isAnimeNews! ? data.date! : dataInfo.date!,
                        ),
                      ],
                    ),
                  ),
                );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
      ),
    );
  }
}
