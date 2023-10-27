import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/themes/text_styles.dart';
import '../../controllers/dashboard_controller.dart';

class SubBreedListView extends GetView<DashboardController> {
  final List subBreedList;

  const SubBreedListView({Key? key, required this.subBreedList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return subBreedList.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'sub_breed'.tr,
                      textAlign: TextAlign.start,
                      style: TextStyles.kTSNFS10.copyWith(color: textColor),
                    ),
                    Text(controller.selectedBreed.value,
                        textAlign: TextAlign.start, style: TextStyles.kTSNFS12),
                  ],
                ),
              ),
              SizedBox(
                height: 45.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: subBreedList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10),
                  itemBuilder: (context, index) {
                    var item = subBreedList[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                          onTap: () {
                            controller.onBreedSelection(
                                controller.selectedBreed.value,
                                item.toString());
                          },
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  border: Border.all(
                                      width: 0.8,
                                      color: item.toString() ==
                                              controller.selectedSubBreed.value
                                          ? primary
                                          : textColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8))),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                item.toString(),
                                style: TextStyles.kTSNFS12.copyWith(
                                    color: item.toString() ==
                                            controller.selectedSubBreed.value
                                        ? primary
                                        : textColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
  }
}
