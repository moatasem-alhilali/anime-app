import 'package:anime_app/core/export.dart';

class ContentManga extends StatelessWidget {
  ContentManga(
      {Key? key,
      this.rating,
      this.chapter,
      this.isRating,
      this.title,
      this.allChild,
      this.isAll,
      this.date});

  double? rating;
  bool? isRating;
  bool? isAll;
  Widget? allChild;
  String? title;
  String? chapter;
  Widget? date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$title',
          style: const TextStyle(),
        ),
        chapter == ''
            ? Container()
            : Text(
                chapter!,
                style: const TextStyle(),
              ),
        !isRating!
            ? Container()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'التقيم: ',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    for (int i = 0; i < rating!; i++)
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Color.fromARGB(255, 186, 144, 3),
                      ),
                  ],
                ),
              ),
        isAll! ? allChild! : Container(),
        date == null ? Container() : date!,
      ],
    );
  }
}
