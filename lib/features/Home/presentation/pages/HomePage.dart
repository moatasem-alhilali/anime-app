import 'package:anime_app/core/constant.dart';

import 'package:anime_app/features/Home/presentation/pages/HomeDetaile.dart';
import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';

import '../../../../core/export.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BuildItem(),
    );
  }
}

class BuildItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: ColorsManager.primaryColor,
      strokeWidth: 4.0,
      onRefresh: () async {
        HomeCubit.get(context).getDataHome();
      },
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: HomeCubit.get(context).topAnimeModel!.data!.length,
        itemBuilder: (_, int index) {
          var result = cubit.topAnimeModel!.data![index];
          return MainItem(
            image: cubit.topAnimeModel!.data![index].images!.jpg!.imageUrl,
            textOnImage: result.title,
            onTap: () {
              cubit.getAllAnimeDetail(id: result.malId!);
              navigateTo(
                context: context,
                child: HomeDetailPage(),
              );
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
      ),
    );
  }
}
