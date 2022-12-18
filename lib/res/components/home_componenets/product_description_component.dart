import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:santra_flutter_task/model/modifiers_models/modifier_model.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/utils/constants/images_paths.dart';

class ProductDescriptionComponent extends StatelessWidget {
  final Data? data;
  const ProductDescriptionComponent({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          Image.asset(
            iPhone13ProMax,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
              child: SizedBox(
            // color: Colors.red,
            height: 100,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data!.productName!,
                      style: TextStyle(
                        color: AppColor().textYellowcolor,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      data!.productCode!,
                      style: TextStyle(
                        color: AppColor().textWhitecolor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      data!.categoryName!,
                      style: TextStyle(
                        color: AppColor().textWhitecolor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
          Container(
            padding: const EdgeInsets.all(
              6,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              color: AppColor().blackColor.withOpacity(
                    0.6,
                  ),
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              color: AppColor().iconcolor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
