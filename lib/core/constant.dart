import 'package:anime_app/core/export.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool IS_FAVORITE = false;
bool CONFECTED = false;
void navigateToWithNamed({context, routeName}) {
  Navigator.pushNamed(context, routeName);
}

void navigateTo({context, Widget? child}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => child!),
  );
}

Future<dynamic> MyBottomSheet(
    {required BuildContext context, required Widget child}) {
  return showModalBottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: ColorsManager.background,
    context: context,
    enableDrag: true,
    builder: (_) {
      return child;
    },
  );
}

//========================
Decoration myDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.topRight,
      colors: [
        Color(0xff0d0e15),
        Color(0xff0d0e15),
        Color.fromARGB(255, 21, 24, 34),
      ],
      stops: [
        0.0,
        0.0,
        1.0,
      ],
    ),
  );
}

Future<void> myDialog({
  required BuildContext context,
  required AlertDialog alertDialog,
}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

showToast({String? message}) {
  Fluttertoast.showToast(
    msg: message ?? 'This is a Top Long Toast',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black.withOpacity(0.7),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

FToast? fToast;

showToastCancel() {
  Widget toastWithButton = Container(
    // height: 200,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color.fromARGB(120, 255, 255, 255),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          child: Text(
            "هل تريد حفظ مكان قرائتك",
            softWrap: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            fToast!.removeCustomToast();
          },
          child: SvgPicture.asset('assets/icon/back.svg', color: Colors.black),
        ),
      ],
    ),
  );
  fToast!.showToast(
    child: toastWithButton,
    gravity: ToastGravity.CENTER,
    toastDuration: const Duration(seconds: 50),
  );
}
