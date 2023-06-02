import 'package:anime_app/core/export.dart';
import 'package:anime_app/core/resources/assets_manager.dart';
import 'package:anime_app/core/widgets/DirectionText.dart';

class ItemNews extends StatelessWidget {
  ItemNews({super.key, this.image, this.text, this.content});
  String? text;
  String? image;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff232327),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              image!,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  text!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  content!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
