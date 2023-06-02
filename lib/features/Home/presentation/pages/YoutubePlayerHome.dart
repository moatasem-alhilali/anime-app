import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/data/models/AnimeYoutubeVideo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlayerPage extends StatefulWidget {
  YouTubePlayerPage(
      {Key? key, this.title, this.youtubeId, this.animeYoutubeVideo})
      : super(key: key);
  String? title;
  AnimeYoutubeVideo? animeYoutubeVideo;

  String? youtubeId;

  @override
  State<YouTubePlayerPage> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayerPage> {
  late YoutubePlayerController controller;

  @override
  initState() {
    var url = 'HJGKY-phKc0';
    controller = YoutubePlayerController(
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        enableCaption: true,
      ),
      initialVideoId: widget.youtubeId!,
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        return YoutubePlayerBuilder(
          player: YoutubePlayer(controller: controller),
          builder: (_, child) {
            return Container(
              decoration: myDecoration(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                body: ListView(
                  children: [
                    child,
                    _ActionVedio(controller: controller),
                  ],
                ),
              ),
            );
          },
        );
      },
      listener: (context, state) {},
    );
  }
}

class _ActionVedio extends StatelessWidget {
  const _ActionVedio({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: ColorsManager.clr,
        // borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.clr.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              controller.seekTo(
                const Duration(seconds: -2),
              );
            },
            child: const Icon(Icons.skip_previous_rounded),
          ),
          TextButton(
            onPressed: () {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            },
            child: controller.value.isPlaying
                ? const Icon(Icons.stop_circle_outlined)
                : const Icon(Icons.play_arrow),
          ),
          IconButton(
            onPressed: () {
              controller.seekTo(
                const Duration(seconds: 2),
              );
            },
            icon: const Icon(
              Icons.skip_next,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
