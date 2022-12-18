import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/model/modifier_group_selection_model/modifier_group_selection_model.dart';
import 'package:santra_flutter_task/model/modifiers_models/modifier_model.dart';
import 'package:santra_flutter_task/res/components/product_modifier_component/product_modifier_component.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/utils/constants/images_paths.dart';
import 'package:santra_flutter_task/utils/routes/routes_name.dart';
import 'package:santra_flutter_task/utils/utils.dart';
import 'package:santra_flutter_task/view_model/modifier_view_model/modifier_view_model.dart';

class ProductModifierScreen extends StatefulWidget {
  Data? productData;
  ProductModifierScreen({
    super.key,
    required this.productData,
  });

  @override
  State<ProductModifierScreen> createState() => _ProductModifierScreenState();
}

class _ProductModifierScreenState extends State<ProductModifierScreen> {
  @override
  void initState() {
    ///
    final modifierViewModel = Provider.of<ModifierViewModel>(
      context,
      listen: false,
    );
    modifierViewModel.modifierGroupSelectionModalList.clear();
    modifierViewModel.modifierGroupCartModalList.clear();
    modifierViewModel.setCanAddCart(true);
    modifierViewModel.setInitialPrice();
    modifierViewModel.modifierListSelection(
      context: context,
      modifierGroupList: widget.productData!.modifierGroup,
    );

    debugPrint(
        'first ${widget.productData!.modifierGroup![1].limitModifiers.toString().split(',').first}');
    debugPrint(
        'last ${widget.productData!.modifierGroup![1].limitModifiers.toString().split(',').last}');
    debugPrint(
        'last ${widget.productData!.modifierGroup![1].subModifiers!.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final modifierViewModel = Provider.of<ModifierViewModel>(
      context,
      listen: false,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().appBackgroundcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.width * 0.6,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iPhone13ProMax),
                  fit: BoxFit.contain,
                ),
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.productData!.productName!,
                    style: TextStyle(
                      color: AppColor().textYellowcolor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.productData!.productCode!,
                    style: TextStyle(
                      color: AppColor().textWhitecolor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    widget.productData!.categoryName!,
                    style: TextStyle(
                      color: AppColor().textWhitecolor,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Consumer<ModifierViewModel>(
                          builder: (context, valueOfModifierViewModel, child) {
                        return Text(
                          'AED ${valueOfModifierViewModel.priceofModifier}',
                          style: TextStyle(
                            color: AppColor().textWhitecolor,
                            fontSize: 14,
                          ),
                        );
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          color: AppColor().yellowcolor.withOpacity(
                                0.4,
                              ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: const Text(
                            'Special Instruction',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  /// Modifier List ///
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemCount: widget.productData!.modifierGroup!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductModifierComponent(
                      modifierGroupIndexData:
                          widget.productData!.modifierGroup![index],
                      passindex: index);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ///
                modifierViewModel.setCanAddCart(true);
                modifierViewModel.modifierGroupCartModalList.clear();
                var listIndex =
                    modifierViewModel.modifierGroupSelectionModalList;
                for (int i = 0; i < listIndex.length; i++) {
                  if (listIndex[i].subModifierTotalSelected! <
                      listIndex[i].subModifierMinSelection!) {
                    // debugPrint(
                    //     'subModifierTotalSelected  ${listIndex[i].subModifierTotalSelected} index $i ');
                    // debugPrint(
                    //     'subModifierMinSelection ${listIndex[i].subModifierMinSelection} index  $i');
                    modifierViewModel.setCanAddCart(false);
                  }
                  for (int j = 0; j < listIndex[i].subModifier!.length; j++) {
                    if (listIndex[i].subModifier![j] == true) {
                      ModifierGroupCartModal modifierGroupCartModal =
                          ModifierGroupCartModal(
                        modifierIndex: i,
                        subModifierIndex: widget.productData!.modifierGroup![i]
                            .subModifiers![j].nameModifier,
                      );
                      modifierViewModel.modifierGroupCartModalList
                          .add(modifierGroupCartModal);
                      // debugPrint(widget.productData!.modifierGroup![i]
                      //     .subModifiers![j].nameModifier);
                    }
                  }
                }
                if (modifierViewModel.canAddCart == true) {
                  /// Good To Go
                  ///
                  debugPrint('Good To Go');
                  Navigator.pushNamed(
                    context,
                    RoutesName.cartscreenroute,
                    arguments: {
                      'productName': widget.productData!.productName!,
                      'productCode': widget.productData!.productCode!,
                      'categoryName': widget.productData!.categoryName!,
                    },
                  );
                  // for (int k = 0;
                  //     k < modifierViewModel.modifierGroupCartModalList.length;
                  //     k++) {
                  //   debugPrint(
                  //       '${modifierViewModel.modifierGroupCartModalList[k].subModifierIndex}');
                  // }
                } else {
                  ///
                  Utils.snackBar(
                    context: context,
                    message: 'Select All Modifier with Requirements',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                }
              },
              child: Container(
                width: screenSize.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Add Cart',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
