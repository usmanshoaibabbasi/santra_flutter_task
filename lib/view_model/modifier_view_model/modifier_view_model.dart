import 'package:flutter/cupertino.dart';
import 'package:santra_flutter_task/model/modifier_group_selection_model/modifier_group_selection_model.dart';

class ModifierViewModel with ChangeNotifier {
  List<ModifierGroupSelectionModal> modifierGroupSelectionModalList = [];
  List<ModifierGroupCartModal> modifierGroupCartModalList = [];

  bool _canAddCart = true;
  int _priceofModifier = 0;

  bool get canAddCart => _canAddCart;
  int get priceofModifier => _priceofModifier;

  ///
  Future<void> modifierListSelection({
    BuildContext? context,
    dynamic modifierGroupList,
  }) async {
    for (int i = 0; i < modifierGroupList.length; i++) {
      ModifierGroupSelectionModal modifierGroupSelectionModal =
          ModifierGroupSelectionModal(
              modifierselection: false,
              subModifierMinSelection: int.parse(modifierGroupList[i]
                  .limitModifiers
                  .toString()
                  .split(',')
                  .first),
              subModifierMaxSelection: int.parse(modifierGroupList[i]
                  .limitModifiers
                  .toString()
                  .split(',')
                  .last),
              subModifierTotalSelected: 0,
              subModifier: List.generate(
                  modifierGroupList[i].subModifiers!.length, (index) => false));
      modifierGroupSelectionModalList.add(modifierGroupSelectionModal);
    }
  }

  ////// Main Modifier Selection ///
  void selectModifier({
    int? index,
    bool? passval,
  }) {
    modifierGroupSelectionModalList[index!].modifierselection = passval;
    notifyListeners();
  }

  ////// Main Modifier Selection ///
  void selectSubModifier({
    int? mainImdex,
    int? index,
    bool? passval,
    int? passPrice,
  }) {
    var mainListIndex = modifierGroupSelectionModalList[mainImdex!];
    if (passval == true) {
      mainListIndex.subModifier![index!] = passval;
      mainListIndex.subModifierTotalSelected =
          mainListIndex.subModifierTotalSelected! + 1;
      _priceofModifier = _priceofModifier + passPrice!;
      
    } else {
      mainListIndex.subModifier![index!] = passval;
      mainListIndex.subModifierTotalSelected =
          mainListIndex.subModifierTotalSelected! - 1;
      _priceofModifier = _priceofModifier - passPrice!;
    }
    notifyListeners();
  }

  setCanAddCart(bool value) {
    _canAddCart = value;
  }

  setInitialPrice() {
    _priceofModifier = 0;
  }
}
