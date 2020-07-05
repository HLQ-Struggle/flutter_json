
import 'package:fluttertoast/fluttertoast.dart';

/// @date 2020-07-05
/// @author HLQ_Struggle
/// @desc

void showToast(String hintMsg) {
  FlutterToast.showToast(
    msg: hintMsg,
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_SHORT,
  );
}
