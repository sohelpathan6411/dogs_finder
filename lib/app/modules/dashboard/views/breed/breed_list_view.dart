import 'package:dogs_finder/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/utils/widget_utils/search_selection_dialog_view.dart';
import '../../../splash/controllers/splash_controller.dart';
import 'sub_breed_list_view.dart';

class BreedListView extends GetView<DashboardController> {
  const BreedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final breedModel = Get.find<SplashController>().breedModel;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (breedModel.value.message!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Text(
                        'breeds'.tr,
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS18W600,
                      ),
                      Text(
                        " (${breedModel.value.message!.entries.length})",
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS16W400,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var item = await Get.dialog(SearchSelectionDialogView(
                      items: breedModel.value.message!.entries
                          .map((e) => e.key)
                          .toList(),
                      searchHint: 'breeds'.tr,
                      title: 'breeds'.tr,
                    ));
                    if (item != null) {
                      controller.onBreedSelection(item.toString(), '');
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 15, left: 15),
                    child: Icon(
                      Icons.search,
                      color: primary,
                      size: 26.w,
                    ),
                  ),
                ),
              ],
            ),
          breedModel.value.message!.isEmpty
              ? const SizedBox()
              : Column(
                  children: [
                    SizedBox(
                      height: 55.h,
                      child: ListView.builder(
                        itemCount: breedModel.value.message!.entries.length,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = breedModel.value.message!.entries
                              .elementAt(index);
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {
                                  controller.onBreedSelection(
                                      item.key.toString(), '');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: bgColor,
                                      border: Border.all(
                                          width: item.key.toString() ==
                                                  controller.selectedBreed.value
                                              ? 0.8
                                              : 0.2,
                                          color: fontColor),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    item.key.toString(),
                                    style: TextStyles.kTSNFS14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    controller.selectedBreed.value.isEmpty
                        ? const SizedBox()
                        : SubBreedListView(
                            subBreedList: breedModel.value.message!.entries
                                .where((element) => (element.key ==
                                    controller.selectedBreed.value))
                                .first
                                .value),
                  ],
                ),
        ],
      ),
    );
  }
}
