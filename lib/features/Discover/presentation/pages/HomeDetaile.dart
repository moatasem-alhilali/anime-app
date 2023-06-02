import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/widgets/CustomButton.dart';
import 'package:anime_app/core/widgets/DirectionText.dart';
import 'package:anime_app/features/Discover/presentation/cubit/search_cubit.dart';
import 'package:anime_app/features/Home/presentation/widgets/CustomContainerImage.dart';

class HomeDetailSearch extends StatelessWidget {
  HomeDetailSearch({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: SizeConfig.blockSizeVertical! * 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomContainerImage(
                    image:
                      SearchCubit.get(context).  searchModel!.data![index!].images!.jpg!.largeImageUrl,
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    height: SizeConfig.blockSizeVertical! * 60,
                    decoration: BoxDecoration(
                      color: ColorsManager.clr,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Text(
                          SearchCubit.get(context)
                                .  searchModel!.data![index!].title!,
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          _ActionsDetail(index: index),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionsDetail extends StatelessWidget {
  _ActionsDetail({
    Key? key,
    this.index,
  });
  int? index;
  // AnimeDetailModel? animeDetailModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomButton(
              text: SearchCubit.get(context).searchModel!.data![index!].type,
              borderRadius: 8,
              height: SizeConfig.blockSizeVertical! * 5,
              width: double.infinity,
            ),
            DirectionText(
              text: "${SearchCubit.get(context).searchModel!.data![index!].popularity}",
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            DirectionText(
              text: "${SearchCubit.get(context).searchModel!.data![index!].episodes}",
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
            DirectionText(
              text: "${SearchCubit.get(context).searchModel!.data![index!].members}",
              textStyle: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'مشاركة',
              ),
            ),
            Expanded(
              child: CustomButton(
                text: 'تنزيل',
              ),
            ),
            Expanded(
              child: CustomButton(
                text: 'تشغيل',
                color: ColorsManager.white,
                fillColor: ColorsManager.primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

