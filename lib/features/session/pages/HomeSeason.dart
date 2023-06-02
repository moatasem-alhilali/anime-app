import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/session/logic/session_cubit.dart';
import 'package:anime_app/features/session/pages/HomeSessionDetaile.dart';
import 'package:flutter/material.dart';

bool? isClicked = false;

class HomeSession extends StatefulWidget {
  const HomeSession({super.key});

  @override
  State<HomeSession> createState() => _HomeSeasonState();
}

class _HomeSeasonState extends State<HomeSession> {
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
            ),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'جميع المواسم',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<SessionCubit, SessionState>(
                    builder: (context, state) {
                      if (state is GetSessionErrorState) {
                        const MyCircularProgressIndicator();
                      }
                      if (state is GetSessionLoadingState) {
                        return const MyCircularProgressIndicator();
                      } else {
                        var count = SessionCubit.get(context)
                            .sessionsDataModel!
                            .data!
                            .length;
                        var data =
                            SessionCubit.get(context).sessionsDataModel!.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              children: [
                                for (int i = 0; i < count; i++)
                                  MyTab(
                                    onTap: () {
                                      var count = data[i].seasons!.length;
                                      var datsSession = data[i].seasons!;
                                      int? year = data[i].year;
                                      _showMyDialog(
                                        context: context,
                                        count: count,
                                        dataSession: datsSession,
                                        year: year,
                                      );
                                    },
                                    text: data[i].year.toString(),
                                  ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TabBar(
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child: Text('انميات الموسم الحالي'),
                      ),
                      Tab(
                        child: Text('انميات الموسم القادم '),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical! * 80,
                    child: TabBarView(
                      children: [
                        _ItemSession(),
                        _ItemUpComing(),
                      ],
                    ),
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

class _ItemSession extends StatelessWidget {
  _ItemSession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        var sessionsAnimeNow = SessionCubit.get(context).sessionsAnimeNow;
        var sessionUpComing = SessionCubit.get(context).sessionUpComing;
        if (state is GetSessionLoadingState) {
          return const MyCircularProgressIndicator();
        } else if (state is GetSessionErrorState) {
          return const MyCircularProgressIndicator();
        } else {
          return sessionsAnimeNow == null && sessionUpComing == null
              ? const MyCircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: sessionsAnimeNow!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var result = sessionsAnimeNow.data![index];
                    return MainItem(
                      image: result.images!.jpg!.imageUrl,
                      textOnImage: result.title,
                      onTap: () {
                        HomeCubit.get(context)
                            .getAllAnimeDetail(id: result.malId!);
                        navigateTo(
                          context: context,
                          child: HomeDetailPage(),
                        );
                      },
                    );
                  },
                );
        }
      },
    );
  }
}

class _ItemUpComing extends StatelessWidget {
  _ItemUpComing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        var sessionUpComing = SessionCubit.get(context).sessionUpComing;
        if (state is GetSessionLoadingState) {
          return const MyCircularProgressIndicator();
        } else if (state is GetSessionErrorState) {
          return const MyCircularProgressIndicator();
        } else {
          return sessionUpComing == null
              ? const MyCircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: sessionUpComing.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var result = sessionUpComing.data![index];
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        // color: ColorsManager.clr,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: MainItem(
                        image: result.images!.jpg!.imageUrl,
                        textOnImage: result.title,
                        onTap: () {
                          print(result.malId);
                          HomeCubit.get(context).getAllAnimeDetail(
                            id: sessionUpComing.data![index].malId!,
                          );
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
    );
  }
}

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  MyTab({
    Key? key,
    this.onTap,
    this.text,
  }) : super(key: key);
  void Function()? onTap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text ?? 'winter',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog({
  required BuildContext context,
  int? count,
  List<String>? dataSession,
  int? year,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.start,
        scrollable: true,
        backgroundColor: ColorsManager.clr,
        alignment: Alignment.center,
        title: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              for (int i = 0; i < count!; i++)
                InkWell(
                  onTap: () {
                    navigateTo(
                      context: context,
                      child: const HomeSessionDetail(),
                    );
                    SessionCubit.get(context)
                        .getAnimeSession(year: year!, session: dataSession![i]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsManager.background,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      getWinter(dataSession![i]),
                      style: const TextStyle(fontFamily: 'ios-1'),
                    ),
                  ),
                ),
            ],
          ),
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 25,
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'رجوع',
              style: const TextStyle(fontFamily: 'ios-1'),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

String getWinter(String session) {
  String result = "";
  switch (session) {
    case "winter":
      result = "انميات فصل الشتاء";
      break;
    case "spring":
      result = "انميات فصل الربيع";
      break;
    case "summer":
      result = "انميات فصل الصيف ";
      break;
    case "fall":
      result = "انميات فصل خريف  ";
      break;

    default:
      result = "";
      break;
  }
  return result;
}
