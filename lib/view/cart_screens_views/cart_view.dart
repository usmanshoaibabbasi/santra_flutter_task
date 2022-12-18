import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/utils/constants/images_paths.dart';
import 'package:santra_flutter_task/view_model/modifier_view_model/modifier_view_model.dart';

class CartScreenView extends StatelessWidget {
  final String productName;
  final String productCode;
  final String categoryName;
  const CartScreenView({
    super.key,
    required this.productName,
    required this.productCode,
    required this.categoryName,
  });

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
                    productName,
                    style: TextStyle(
                      color: AppColor().textYellowcolor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    productCode,
                    style: TextStyle(
                      color: AppColor().textWhitecolor,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    categoryName,
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
                itemCount: modifierViewModel.modifierGroupCartModalList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      '${modifierViewModel.modifierGroupCartModalList[index].subModifierIndex}',
                      style: TextStyle(
                        color: AppColor().textYellowcolor,
                        fontSize: 17,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
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
