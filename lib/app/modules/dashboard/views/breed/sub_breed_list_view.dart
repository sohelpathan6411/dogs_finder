import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Row(
                  children: [
                    Text('sub_breed'.tr,
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS14
                            .copyWith(color: colorGreen.shade700)),
                    Text(controller.selectedBreed.value,
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS14W700),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
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
                          child: Container(
                            decoration: BoxDecoration(
                                color: colorWhite,
                                border: Border.all(
                                    width: item.toString() ==
                                            controller.selectedSubBreed.value
                                        ? 0.8
                                        : 0.2,
                                    color: primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(
                              item.toString(),
                              style: TextStyles.kTSNFS14,
                              textAlign: TextAlign.center,
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
