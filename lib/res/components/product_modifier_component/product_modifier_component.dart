import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/model/modifiers_models/modifier_model.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/utils/utils.dart';
import 'package:santra_flutter_task/view_model/modifier_view_model/modifier_view_model.dart';

class ProductModifierComponent extends StatelessWidget {
  final ModifierGroup modifierGroupIndexData;
  final int passindex;

  const ProductModifierComponent({
    super.key,
    required this.modifierGroupIndexData,
    required this.passindex,
  });

  @override
  Widget build(BuildContext context) {
    final modifierViewModel = Provider.of<ModifierViewModel>(
      context,
      listen: true,
    );
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Modifier Code : ${modifierGroupIndexData.groupCode}',
            style: TextStyle(
              color: AppColor().textYellowcolor,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  debugPrint(
                      'before ${modifierViewModel.modifierGroupSelectionModalList[passindex].modifierselection}');
                  bool previousselectModifierVal = modifierViewModel
                      .modifierGroupSelectionModalList[passindex]
                      .modifierselection!;
                  modifierViewModel.selectModifier(
                    index: passindex,
                    passval: !previousselectModifierVal,
                  );
                  debugPrint(
                      'after ${modifierViewModel.modifierGroupSelectionModalList[passindex].modifierselection}');
                },
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: modifierViewModel
                                  .modifierGroupSelectionModalList[passindex]
                                  .modifierselection ==
                              true
                          ? Colors.red
                          : Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(80),
                      )),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '${modifierGroupIndexData.name}',
                style: TextStyle(
                  color: AppColor().textYellowcolor,
                  fontSize: 17,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                'Min ${modifierGroupIndexData.limitModifiers.toString().split(',').first} Max ${modifierGroupIndexData.limitModifiers.toString().split(',').last}',
                style: TextStyle(
                  color: AppColor().textYellowcolor,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: modifierGroupIndexData.subModifiers!.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        var listMainIndex = modifierViewModel
                            .modifierGroupSelectionModalList[passindex];
                        if (listMainIndex.modifierselection == false) {
                          debugPrint(
                              'Please slect main modi ${listMainIndex.modifierselection}');
                          Utils.snackBar(
                            context: context,
                            message: 'Please slect main modifier',
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                          );
                        } else {
                          debugPrint(
                              'before selected sub modi ${listMainIndex.subModifier![index]}');
                          bool subModifierPreviousVal = modifierViewModel
                              .modifierGroupSelectionModalList[passindex]
                              .subModifier![index];
                          if (listMainIndex.subModifier![index] == false &&
                              listMainIndex.subModifierTotalSelected! >
                                  listMainIndex.subModifierMaxSelection! - 1) {
                            debugPrint('You can not select');
                            Utils.snackBar(
                              context: context,
                              message: 'Reached Max Selection',
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                            );
                          } else {
                            modifierViewModel.selectSubModifier(
                              mainImdex: passindex,
                              index: index,
                              passval: !subModifierPreviousVal,
                              passPrice: int.parse(modifierGroupIndexData.subModifiers![index].priceModifier!),
                            );
                            debugPrint(
                                'After selected sub modi ${listMainIndex.subModifier![index]}');
                            debugPrint(
                                'After selected sub modifierTotal ///// ${listMainIndex.subModifierTotalSelected}');
                          }
                        }
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: modifierViewModel
                                        .modifierGroupSelectionModalList[
                                            passindex]
                                        .subModifier![index] ==
                                    false
                                ? Colors.transparent
                                : Colors.green,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(0),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${modifierGroupIndexData.subModifiers![index].nameModifier}',
                      style: TextStyle(
                        color: AppColor().textYellowcolor,
                        fontSize: 17,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
