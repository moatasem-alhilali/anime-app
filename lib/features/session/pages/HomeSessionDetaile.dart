import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/session/logic/session_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:flutter/material.dart';

import '../../Home/presentation/pages/HomeDetaile.dart';

class HomeSessionDetail extends StatelessWidget {
  const HomeSessionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<SessionCubit, SessionState>(
          builder: (context, state) {
            var sessionsAnime = SessionCubit.get(context).sessionsAnime;
            if (state is GetAnimeSessionLoadingState) {
              return const MyCircularProgressIndicator();
            } else {
              return sessionsAnime == null
                  ? const MyCircularProgressIndicator()
                  : GridView.builder(
                      itemCount: sessionsAnime.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        var result = sessionsAnime.data![index];
                        return MainItem(
                          onTap: () {
                            
                            HomeCubit.get(context)
                                .getAllAnimeDetail(id: result.malId!);
                            navigateTo(
                              context: context,
                              child: HomeDetailPage(),
                            );
                          },
                          image: result.images!.jpg!.imageUrl!,
                          textOnImage: result.title,
                        );
                      },
                    );
            }
          },
        ),
      ),
    );
  }
}
