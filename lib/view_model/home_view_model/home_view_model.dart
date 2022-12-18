import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:santra_flutter_task/model/modifiers_models/modifier_model.dart';

class HomeViewModel with ChangeNotifier {
  bool _modifierListloading = true;

  bool get modifierListloading => _modifierListloading;

  ModifiersModel? _modifiersModelList;

  ModifiersModel? get modifiersModelList => _modifiersModelList;

  setLoading(bool value) {
    _modifierListloading = value;
    notifyListeners();
  }

  Future<void> getModifierList({BuildContext? context}) async {
    final String response = await rootBundle.loadString('assets/JsonData.txt');
    final data = await json.decode(response);

    // Future.delayed(const Duration(milliseconds: 1000), () {
      _modifiersModelList = ModifiersModel.fromJson(data);
      setLoading(false);
      // debugPrint('${modifiersModelList!.data![0].businessName}');
      // debugPrint('${modifiersModelList!.data!.length}');
      // debugPrint('${modifiersModelList!.data![0].modifierGroup!.length}');
    // });
  }
}
