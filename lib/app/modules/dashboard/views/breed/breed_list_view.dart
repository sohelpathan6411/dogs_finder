import 'dart:math';

import 'package:dogs_finder/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/themes/text_styles.dart';
import '../../../splash/controllers/splash_controller.dart';
import 'sub_breed_list_view.dart';

class BreedListView extends GetView<DashboardController> {
  const BreedListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final breedModel = Get.find<SplashController>().breedModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (breedModel.value.message!.isEmpty)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'find_by_breed'.tr,
              textAlign: TextAlign.start,
              style: TextStyles.kTSNFS22W600,
            ),
          ),
        breedModel.value.message!.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      itemCount: breedModel.value.message!.entries.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 10),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item =
                            breedModel.value.message!.entries.elementAt(index);
                        return InkWell(
                          onTap: () {
                            controller.onBreedSelection(
                                item.key.toString(), '');
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: colorWhite,
                                    border:
                                        Border.all(width: 1, color: primary),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Text(
                                  item.key.toString(),
                                  style: TextStyles.kTSNFS16W600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // if (controller.selectedBreed.value.isNotEmpty)
                  //   SubBreedListView(
                  //       subBreedList: breedModel.value.message!.entries
                  //           .where((element) =>
                  //               (element.key == controller.selectedBreed.value))
                  //           .),
                ],
              )
      ],
    );
  }
}
