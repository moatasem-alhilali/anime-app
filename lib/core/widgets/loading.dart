import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/resources/assets_manager.dart';
import 'package:lottie/lottie.dart';

class WentWrong extends StatelessWidget {
  const WentWrong({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      fit: BoxFit.cover,
      alignment: Alignment.center,
      animate: true,
      width: SizeConfig.blockSizeHorizontal! * 30,
      height: SizeConfig.blockSizeVertical! * 30,
      AssetsManager.wrong,
    );
  }
}

class NoInterNet extends StatelessWidget {
  const NoInterNet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset(
        AssetsManager.noInternet,
      ),
    );
  }
}
