import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';

import 'package:anime_app/features/Home/presentation/widgets/MainItem.dart';
import 'package:anime_app/features/actors-voices/cubit/actors_cubit.dart';
import 'package:anime_app/features/actors-voices/pages/actorsDeatil.dart';
import 'package:anime_app/features/session/pages/HomeSeason.dart';

class ActorsScreen extends StatelessWidget {
  const ActorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'أفضل مؤدين الاصوات',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: BlocBuilder<ActorsCubit, ActorsState>(
              builder: (context, state) {
                var cubit = ActorsCubit.get(context).topPoeple;
                if (state is GetActorsDataLoadingState) {
                  return const MyCircularProgressIndicator();
                } else {
                  return cubit == null
                      ? const MyCircularProgressIndicator()
                      : GridView.builder(
                          itemBuilder: (context, index) {
                            var data = cubit.data![index];
                            return MainItem(
                              onTap: () {
                                navigateTo(
                                  context: context,
                                  child: const ActorsDetail(),
                                );
                                ActorsCubit.get(context)
                                    .getAllDataDetailActors(id: data.malId!);
                              },
                              image: data.images!.jpg!.imageUrl!,
                              textOnImage: data.name,
                            );
                          },
                          itemCount: cubit.data!.length,
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5,
                            crossAxisCount: 2,
                          ),
                        );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
