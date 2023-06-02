import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/manga/presentation/page/MangaDetail.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

import 'ContentManga.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaCubit, MangaState>(
      builder: (context, state) {
        var cubit = MangaCubit.get(context);
        var popularManga = MangaCubit.get(context).popularManga;
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: popularManga.length,
              itemBuilder: (context, index) {
                var result = popularManga[index];
                double rating = result.rating!;
                return SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 60,
                  child: MainItem(
                    image: result.cover!,
                    onTap: () {
                      navigateTo(
                          context: context,
                          child: MangaDetail(
                            title: result.title,
                          ));
                      cubit.getDataMangaDetail(url: result.link!);
                    },
                    childInImage: ContentManga(
                      rating: rating,
                      isRating: true,
                      isAll: false,
                      chapter: result.chapter,
                      title: result.title,
                    ),
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
