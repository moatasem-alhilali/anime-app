import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';

import 'package:anime_app/features/manga/presentation/widget/DataOurNewReleasesItem.dart';
import 'package:anime_app/features/manga/presentation/widget/NewAddedItem.dart';
import 'package:anime_app/features/manga/presentation/widget/PopularItem.dart';

class MangaHome extends StatelessWidget {
  const MangaHome({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text('المانجا'),
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'ios-1',
              ),
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
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
                        Tab(child: Text("شائعة اليوم")),
                        Tab(child: Text("مضاف حديثا")),
                        Tab(child: Text("جديد اصداراتنا")),
                      ],
                    ),
                    //!============================
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 80,
                      child: const TabBarView(
                        children: [
                          PopularItem(),
                          NewAddedItem(),
                          DataOurNewReleasesItem(),
                        ],
                      ),
                    ),
                    //! ============================
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
