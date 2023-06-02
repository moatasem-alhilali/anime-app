import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/DetailItem.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/news/presentation/cubit/news_scrap_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({this.image, this.title});
  String? image;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: BasePageDetail(
              isFavorite: false,
            
              image: image,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorsManager.primaryColor,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<NewsScrapCubit, NewsScrapState>(
                    builder: (context, state) {
                      var cubit = NewsScrapCubit.get(context);
                      if (state is GetNewsScrapeDetailLoadingState) {
                        return const MyCircularProgressIndicator();
                      } else {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.dataDetail.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var result = cubit.dataDetail[index];
                            return Text(
                              result,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return const Divider(
                              color: Colors.grey,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
