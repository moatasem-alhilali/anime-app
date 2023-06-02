import 'package:anime_app/core/export.dart';

import 'CustomContainerImage.dart';

class MainItem extends StatelessWidget {
  MainItem({
    super.key,
    this.onTap,
    this.child,
    this.image,
    this.textOnImage,
    this.textStyle,
    this.childInImage,
    this.onLongPress,
  });
  void Function()? onTap;
  Widget? child;
  Widget? childInImage;
  String? textOnImage;
  String? image;
  TextStyle? textStyle;
  void Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.all(8),
        width: SizeConfig.blockSizeHorizontal! * 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: ColorsManager.clr,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomContainerImage(
                alignment: Alignment.bottomCenter,
                image: image,
                child: childInImage ??
                    Text(
                      textOnImage ?? '',
                      maxLines: 20,
                      textDirection: TextDirection.rtl,
                      style: textStyle ?? const TextStyle(fontSize: 14),
                    ),
              ),
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
