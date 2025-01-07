import 'package:get/get.dart';

import '../controllers/historypembelian_controller.dart';

class HistorypembelianBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistorypembelianController>(
      () => HistorypembelianController(),
    );
  }
}
