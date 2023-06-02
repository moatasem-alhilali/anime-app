import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/manga/presentation/page/MangaDetail.dart';
import 'package:anime_app/features/manga/presentation/page/MangaImage.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

import 'ContentManga.dart';

class DataOurNewReleasesItem extends StatelessWidget {
  const DataOurNewReleasesItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaCubit, MangaState>(
      builder: (context, state) {
        var cubit = MangaCubit.get(context);
        var dataOurNewReleases = MangaCubit.get(context).dataOurNewReleases;
        if (state is GetDataMangaHomeLoadingState) {
          return const MyCircularProgressIndicator();
        } else {
          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: ColorsManager.primaryColor,
            strokeWidth: 4.0,
            onRefresh: () async {
              cubit.getDataMangaHome();
            },
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataOurNewReleases.length,
              itemBuilder: (context, index) {
                var result = dataOurNewReleases[index];
                return MainItem(
                  image: result.cover!,
                  onTap: () {
                    navigateTo(
                      context: context,
                      child: MangaDetail(
                        title: result.title,
                      ),
                    );
                    cubit.getDataMangaDetail(url: result.link!);
                  },
                  childInImage: ContentManga(
                    isAll: true,
                    isRating: false,
                    allChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              result.firstNumberChapter!,
                            ),
                            Text(
                              result.firstNumberChapterTime!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              result.secondNumberChapter!,
                            ),
                            Text(
                              result.secondNumberChapterTime!,
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    chapter: '',
                    title: result.title,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(
                              context: context,
                              child: const MangaImage(),
                            );
                            cubit.getDataMangaImage(
                                url: result.secondNumberChapterLink!);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorsManager.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              result.secondNumberChapter!,
                              style: const TextStyle(),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            navigateTo(
                              context: context,
                              child: const MangaImage(),
                            );
                            cubit.getDataMangaImage(
                              url: result.firstNumberChapterLink!,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              color: ColorsManager.primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              result.firstNumberChapter!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
