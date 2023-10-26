import 'package:dogs_finder/app/modules/splash/controllers/splash_controller.dart';
import 'package:dogs_finder/core/base/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/consts/app_consts.dart';
import '../../../../core/utils/widget_utils/custom_snack_bars.dart';
import '../../../data/model/imges_list_model.dart';
import '../../../data/model/random_image_model.dart';
import '../../splash/services/dogs_repo_impl.dart';

class DashboardController extends BaseController {
  Rx<RandomImageModel> randomImage = Rx(RandomImageModel());
  Rx<ImagesListModel> imagesList = Rx(ImagesListModel());
  late ScrollController scrollController;

  Rx<String> selectedBreed = ''.obs;
  Rx<String> selectedSubBreed = ''.obs;

  Rx<int> pageNumber = 1.obs;

  @override
  Future<void> onInit() async {
    selectedBreed.value = Get.find<SplashController>()
        .breedModel
        .value
        .message!
        .entries
        /* .entries
        .where((element) => ((element.value as List).isNotEmpty)) */
        .first
        .key;

    getRandomImage();
    getImagesList();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);

    super.onInit();
  }

  @override
  Future<void> onClose() async {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  _scrollListener() {
    if (scrollController.position.pixels ==
            (scrollController.position.maxScrollExtent) &&
        imagesList.value.message != null) {
      if (imagesList.value.message!.length > (pageSize * pageNumber.value)) {
        pageNumber.value++;
      }
    }
  }

  onPullToRefresh() async {
    pageNumber.value = 1;
    await getRandomImage();
    await getImagesList();
    return true;
  }

  onBreedSelection(breed, subBreed) {
    pageNumber.value = 1;
    selectedBreed.value = breed;
    selectedSubBreed.value = subBreed;

    getRandomImage();
    getImagesList();
  }

  getRandomImage() async {
    try {
      randomImageStatus.value = ApiStatus.LOADING;
      randomImage.value = RandomImageModel();
      var result = await DogsRepoImpl(dioClient).getRandomImage(
          breed: selectedBreed.value, subBreed: selectedSubBreed.value);
      result.fold((l) {
        randomImage.value = l;
        randomImageStatus.value = ApiStatus.SUCCESS;
      }, (r) {
        if (r.toString().contains('No Network found')) {
          CustomSnackbars().showErrorSnack(
              title: 'no_internet'.tr, message: 'connect_wifi_data'.tr);
        } else {
          CustomSnackbars().showErrorSnack(
              title: 'failed_to_load'.tr, message: 'try_again'.tr);
        }
        randomImageStatus.value = ApiStatus.FAIL;
      });
    } catch (e) {
      CustomSnackbars()
          .showErrorSnack(title: 'failed_to_load'.tr, message: 'try_again'.tr);
    }
  }

  getImagesList() async {
    try {
      imagesListStatus.value = ApiStatus.LOADING;

      imagesList.value = ImagesListModel();
      var result = await DogsRepoImpl(dioClient).getImagesList(
          breed: selectedBreed.value, subBreed: selectedSubBreed.value);

      result.fold((l) {
        imagesList.value = l;

        imagesListStatus.value = ApiStatus.SUCCESS;
      }, (r) {
        imagesListStatus.value = ApiStatus.FAIL;
      });
    } catch (e) {
      CustomSnackbars()
          .showErrorSnack(title: 'failed_to_load'.tr, message: 'try_again'.tr);
    }
  }
}
