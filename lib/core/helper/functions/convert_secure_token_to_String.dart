import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';

Future<String> convertTokenToString() async {
  return await SharedPreferencesHelper.getSecuredString(
    key: Constant.keyToken,
  );
}
