import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  //resuable toast message
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
    );
  }
}
