import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/manga/presentation/cubit/manga_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangaImage extends StatelessWidget {
  const MangaImage({super.key});

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
            child: Column(
              children: [
                BlocBuilder<MangaCubit, MangaState>(
                  builder: (context, state) {
                    var mangaImage = MangaCubit.get(context).mangaImage;
                    if (state is GetDataMangaDetailLoadingState) {
                      return const MyCircularProgressIndicator();
                    } else if (state is GetDataMangaDetailSuccessState) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mangaImage.length,
                        itemBuilder: (context, index) {
                          return Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: ColorsManager.clr)),
                            child: Image.network(
                              mangaImage[index],
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      );
                    } else {
                      return const MyCircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
