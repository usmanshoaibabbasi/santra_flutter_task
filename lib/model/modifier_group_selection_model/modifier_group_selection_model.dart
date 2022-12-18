class ModifierGroupSelectionModal {
  bool? modifierselection;
  int? subModifierMinSelection;
  int? subModifierMaxSelection;
  int? subModifierTotalSelected;
  List? subModifier;
  ModifierGroupSelectionModal({
    this.modifierselection,
    this.subModifierMinSelection,
    this.subModifierMaxSelection,
    this.subModifierTotalSelected,
    this.subModifier,
  });
}


class ModifierGroupCartModal {
  int? modifierIndex;
  String? subModifierIndex;
  ModifierGroupCartModal({
    this.modifierIndex,
    this.subModifierIndex,
  });
}
