// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/color_consts.dart';
import '../../themes/text_styles.dart';

class SearchSelectionDialogView extends StatefulWidget {
  SearchSelectionDialogView({
    Key? key,
    required this.items,
    required this.searchHint,
    required this.title,
    this.function,
  }) : super(key: key);

  List<String> items = [];
  String searchHint = '';
  String title = '';
  final Function(int index)? function;

  List<String> filteredItems = [];

  @override
  State<StatefulWidget> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchSelectionDialogView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    widget.filteredItems.addAll(widget.items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        height: widget.items.isEmpty
            ? 220.0
            : widget.items.length <= 3
                ? 300
                : 500.0,
        width: double.maxFinite,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18.0),
            child: Text(widget.title,
                textAlign: TextAlign.center, style: TextStyles.kTSNFS22W600),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _searchController,
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primary.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primary.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primary.withOpacity(0.4),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          hintText: widget.searchHint,
                          suffixIcon: _searchController.text.isEmpty
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () {
                                    _searchController.clear();
                                    setState(() {
                                      widget.filteredItems = widget.items;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.clear,
                                    color: primary,
                                  ))),
                      onChanged: (value) {
                        setState(() {
                          widget.filteredItems = widget.items
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.filteredItems.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: const Divider(
                        thickness: .1,
                        color: primary,
                      ),
                    ),
                    shrinkWrap: true,
                    itemCount: widget.filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          widget.filteredItems[index],
                          textAlign: TextAlign.center,
                          style: TextStyles.kTSNFS16W400,
                        ),
                        onTap: () {
                          // Do something when an item is selected
                          if (widget.function != null) widget.function!(index);
                          Get.back(result: widget.filteredItems[index]);
                        },
                      );
                    },
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 8),
                      child: Text(
                        "No data available",
                        style: TextStyles.kTSNFS14,
                      ),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
