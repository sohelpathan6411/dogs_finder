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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subBreedList.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text('no_sub_breed'.tr,
                        textAlign: TextAlign.start, style: TextStyles.kTSNFS14),
                    Text(controller.selectedBreed.value,
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS14W700),
                  ],
                ),
              )
            : SizedBox(
                height: 70,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: subBreedList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10),
                  itemBuilder: (context, index) {
                    var item = subBreedList[index];
                    return InkWell(
                      onTap: () {
                        controller.onBreedSelection(
                            controller.selectedBreed.value, item.toString());
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: colorWhite,
                                border: Border.all(width: 1, color: primary),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(item.toString(),
                                style: TextStyles.kTSNFS14),
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
