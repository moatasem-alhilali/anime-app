import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/manga/presentation/page/MangaImage.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

class MangaDetail extends StatelessWidget {
  MangaDetail({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const _ChapterItem(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChapterItem extends StatelessWidget {
  const _ChapterItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaCubit, MangaState>(
      builder: (context, state) {
        var popularMangaDetail = MangaCubit.get(context).popularMangaDetail;
        if (state is GetDataMangaDetailLoadingState) {
          return const MyCircularProgressIndicator();
        } else {
          return popularMangaDetail == null
              ? const MyCircularProgressIndicator()
              : GridView.builder(
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: popularMangaDetail.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var result = popularMangaDetail[index];
                    return InkWell(
                      onTap: () {
                        navigateTo(
                          context: context,
                          child: const MangaImage(),
                        );
                        MangaCubit.get(context)
                            .getDataMangaImage(url: result.chapterLinks!);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorsManager.clr,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(result.chapterNumber!),
                            Text(
                              result.chapterDate!,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2 / 4,
                  ),
                );
        }
      },
    );
  }
}
