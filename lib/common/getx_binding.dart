import 'package:get/get.dart';

import '../domain/controller/emoji_controller.dart';

class GetxBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EmojiController());
  }
}