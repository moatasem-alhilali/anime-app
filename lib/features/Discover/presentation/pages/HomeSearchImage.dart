import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Discover/data/repositories/SearchRepository.dart';
import 'package:anime_app/features/Discover/presentation/cubit/search_cubit.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSearchImage extends StatelessWidget {
  HomeSearchImage({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        SearchCubit.get(context).SearchByImage();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorsManager.clr,
                        ),
                        width: double.infinity,
                        child: const Text(
                          'اختر صورة الانمي',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchImageLoadingState) {}
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: SizeConfig.blockSizeVertical! * 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: Text(
                                    'يجب ان لاتكون الصوره معدله او يوجد فلاتر فيها يجب ان تكون الصوره مأخوذه من  من حلقه معينه للحصول على نتائج بحث مرضية',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                fileImage == null
                                    ? Container()
                                    : Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.file(
                                            fit: BoxFit.cover,
                                            File(fileImage!.path),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'نتائج البحث',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    //
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        var searchImageData =
                            SearchCubit.get(context).searchImageData;
                        if (state is SearchImageLoadingState) {
                          return const MyCircularProgressIndicator();
                        } else {
                          return searchImageData == null
                              ? const Text(
                                  'لم تقم بتحديد اي صورة بعد',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                )
                              : const ItemSearch();
                        }
                      },
                    ),
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

class ItemSearch extends StatelessWidget {
  const ItemSearch({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: SearchCubit.get(context).searchImageData!.result!.length,
      itemBuilder: (context, index) {
        var data = SearchCubit.get(context).searchImageData!.result![index];

        return SizedBox(
          height: SizeConfig.blockSizeVertical! * 60,
          child: MainItem(
            onTap: () async {
              if (!await launchUrl(Uri.parse(data.video!))) {
                throw Exception('Could not launch !');
              }
            },
            image: data.image,
            textOnImage: data.filename,
            childInImage: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(' اسم الانمي: ${data.filename}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'رقم الحلقه: ${data.episode}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'نسبة التشابه: ${data.similarity!.round()}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
