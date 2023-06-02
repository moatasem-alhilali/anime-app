import 'package:anime_app/core/constant.dart';
import 'package:anime_app/core/export.dart';
import 'package:anime_app/features/Home/presentation/widgets/CustomContainerImage.dart';

class DetailItem extends StatelessWidget {
  DetailItem({
    Key? key,
    this.child,
    this.image,
    this.childImage,
    this.onTap,
    this.icon,
  }) : super(key: key);

  String? image;
  Widget? child;
  Widget? childImage;
  void Function()? onTap;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.blockSizeVertical! * 40,
          child: CustomContainerImage(
            image: image,
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: onTap,
                    child: CircleAvatar(
                      backgroundColor: ColorsManager.clr,
                      child: Icon(
                        icon ?? Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: myDecoration(),
          child: child!,
        )
      ],
    );
  }
}

class BasePageDetail extends StatelessWidget {
  BasePageDetail({super.key,this.isFavorite,this.body,this.favoriteFunction,this.image});
  bool ?isFavorite;
  Widget?body;
  String?image;
  void Function()? favoriteFunction;
  String imageUrl =
      "https://www.pennlive.com/resizer/_rPtDd5L4oj9-6WOF1_p0EONoHM=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/QWWFTLE7PBE6XABGT6Y62Q2KKA.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myDecoration(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      // color: Colors.red,
                      height: SizeConfig.blockSizeVertical! * 50,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(image??imageUrl,
                              height: SizeConfig.blockSizeVertical! * 50,
width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: ColorsManager.primaryColor,
                                      child: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Spacer(),

                                  isFavorite!?
                                  InkWell(
                                    onTap:favoriteFunction,
                                    child: CircleAvatar(
                                      backgroundColor: ColorsManager.primaryColor,
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ):Container(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    body!,

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
