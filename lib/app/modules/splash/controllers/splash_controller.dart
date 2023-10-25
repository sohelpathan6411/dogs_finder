import 'package:dogs_finder/app/routes/app_pages.dart';
import 'package:dogs_finder/core/base/base_controller.dart';
import 'package:dogs_finder/core/utils/widget_utils/custom_snack_bars.dart';
import 'package:get/get.dart';

import '../../../data/model/breed_model.dart';
import '../services/dogs_repo_impl.dart';

class SplashController extends BaseController {
  Rx<BreedModel> breedModel = Rx(BreedModel()); //Obs variables

  @override
  void onInit() {
    getBreeds();

    super.onInit();
  }

  getBreeds() async {
    try {
      var result = await DogsRepoImpl(dioClient).getBreeds();
      result.fold((l) {
        breedModel.value = l;

        Get.offAllNamed(
            Routes.DASHBOARD); // Navigated to dashbaord once data is fetched
      }, (r) {
        CustomSnackbars().showErrorSnack(
            title: 'failed_to_load'.tr, message: 'try_again'.tr);
      });
    } catch (e) {
      CustomSnackbars()
          .showErrorSnack(title: 'failed_to_load'.tr, message: 'try_again'.tr);
    }
  }
}
