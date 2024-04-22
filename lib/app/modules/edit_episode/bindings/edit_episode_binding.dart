import 'package:get/get.dart';

import '../controllers/edit_episode_controller.dart';

class EditEpisodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEpisodeController>(
      () => EditEpisodeController(),
    );
  }
}
