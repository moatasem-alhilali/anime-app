import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Discover/presentation/cubit/search_cubit.dart';
import 'package:anime_app/features/Discover/presentation/widgets/MyTextFormField.dart';
import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';

import 'package:anime_app/features/session/pages/HomeSeason.dart';

import 'HomeSearchImage.dart';

String endpoint = "anime";

class HomeSearch extends StatelessWidget {
  HomeSearch({super.key});
  final _controller = ScrollController();
  TextEditingController controller = TextEditingController();
  String people = "people";
  String characters = "characters";
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
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
                controller: _controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextFormField(
                      onTapSuf: () {},
                      controller: controller,
                      onTapPre: () {
                        _getSearch(context);
                      },
                      onFieldSubmitted: (text) {
                        _getSearch(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //kana
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('فلتر البحث'),
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(
                                context: context, child: HomeSearchImage());
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'البحث عن طريق صورة الانمي؟',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _MyBTNFilter(
                          title: "اسم الشخصية",
                          onTap: () {
                            endpoint = 'characters';
                            cubit.setEmptyData();
                          },
                        ),
                        _MyBTNFilter(
                          title: 'مؤدي الصوت',
                          onTap: () {
                            endpoint = people;
                            cubit.setEmptyData();
                          },
                        ),
                        _MyBTNFilter(
                          title: 'اسم الانمي',
                          onTap: () {
                            cubit.setEmptyData();

                            endpoint = "anime";
                          },
                        ),
                      ],
                    ),

                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        if (state is SearchLoadingState) {
                          return const MyCircularProgressIndicator();
                        } else {
                          var searchModel =
                              SearchCubit.get(context).searchModel;
                          var searchActors =
                              SearchCubit.get(context).searchActors;
                          var searchCharacter =
                              SearchCubit.get(context).searchCharacter;
                          return searchModel == null &&
                                  searchCharacter == null &&
                                  searchActors == null
                              ? const Center(child: Text('لايوجد بيانات حاليا'))
                              : const ItemSearchAnime();
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

  void _getSearch(context) {
    var cubit = SearchCubit.get(context);
    if (endpoint == "anime") {
      cubit.searchForAnime(q: controller.text);
      cubit.searchModel = null;
    }
    if (endpoint == 'characters') {
      cubit.getSearchCharacter(q: controller.text);
      cubit.searchCharacter = null;
    }
    if (endpoint == people) {
      cubit.getSearchActors(q: controller.text);
      cubit.searchActors = null;
    }
  }
}

int getLength(context) {
  int? result;
  var data = SearchCubit.get(context);
  if (endpoint == "anime") {
    result = data.searchModel!.data!.length;
  }
  if (endpoint == "characters") {
    result = data.searchCharacter!.data!.length;
  }
  if (endpoint == "people") {
    result = data.searchActors!.data!.length;
  }
  return result!;
}

class _MyBTNFilter extends StatelessWidget {
  _MyBTNFilter({
    this.onTap,
    this.title,
  });
  String? title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorsManager.primaryColor),
          ),
          child: Text(
            title ?? 'اسم الشخصية',
            style: TextStyle(color: ColorsManager.primaryColor),
          ),
        ),
      ),
    );
  }
}

class ItemSearchAnime extends StatelessWidget {
  const ItemSearchAnime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getLength(context),
      itemBuilder: (context, index) {
        if (endpoint == 'characters') {
          var result = SearchCubit.get(context).searchCharacter;

          return _ItemSearch(
            image: result!.data![index].images!.jpg!.imageUrl!,
            title: result.data![index].name,
          );
          //levi
        } else if (endpoint == 'people') {
          var result = SearchCubit.get(context).searchActors;

          return _ItemSearch(
            image: result!.data![index].images!.jpg!.imageUrl!,
            title: result.data![index].name,
          );
        } else {
          var result = SearchCubit.get(context).searchModel;

          return _ItemSearch(
            image: result!.data![index].images!.jpg!.imageUrl!,
            title: result.data![index].title,
            onTap: () {
              HomeCubit.get(context)
                  .getAllAnimeDetail(id: result.data![index].malId!);
              navigateTo(
                context: context,
                child: HomeDetailPage(),
              );
              //kana
            },
          );
        }
      },
    );
  }
}

class _ItemSearch extends StatelessWidget {
  _ItemSearch({this.onTap, this.image, this.title});
  String? image;
  String? title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: SizeConfig.blockSizeVertical! * 20,
        width: SizeConfig.blockSizeHorizontal! * 90,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsManager.clr,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                  height: SizeConfig.blockSizeVertical! * 20,
                ),
              ),
              Expanded(
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title!,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
