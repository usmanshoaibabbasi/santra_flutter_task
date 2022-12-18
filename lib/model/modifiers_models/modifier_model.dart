class ModifiersModel {
  bool? status;
  List<Data>? data;

  ModifiersModel({this.status, this.data});

  ModifiersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? sellerCity;
  String? preparationTime;
  String? sellerCode;
  int? pf;
  String? businessName;
  String? businessLogo;
  String? productCode;
  String? productName;
  String? productDescription;
  String? productPrice;
  String? productAQuantity;
  String? productType;
  String? productPaymentMode;
  String? categoryCode;
  String? categoryName;
  String? productStatus;
  String? skinTypes;
  String? genderTypes;
  String? allergyDetails;
  String? dynamicLink;
  ProductImages? productImages;
  List<ModifierGroup>? modifierGroup;

  Data(
      {this.sellerCity,
      this.preparationTime,
      this.sellerCode,
      this.pf,
      this.businessName,
      this.businessLogo,
      this.productCode,
      this.productName,
      this.productDescription,
      this.productPrice,
      this.productAQuantity,
      this.productType,
      this.productPaymentMode,
      this.categoryCode,
      this.categoryName,
      this.productStatus,
      this.skinTypes,
      this.genderTypes,
      this.allergyDetails,
      this.dynamicLink,
      this.productImages,
      this.modifierGroup});

  Data.fromJson(Map<String, dynamic> json) {
    sellerCity = json['seller_city'];
    preparationTime = json['preparation_time'];
    sellerCode = json['seller_code'];
    pf = json['pf'];
    businessName = json['business_name'];
    businessLogo = json['business_logo'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productAQuantity = json['product_a_quantity'];
    productType = json['product_type'];
    productPaymentMode = json['product_payment_mode'];
    categoryCode = json['category_code'];
    categoryName = json['category_name'];
    productStatus = json['product_status'];
    skinTypes = json['skin_types'];
    genderTypes = json['gender_types'];
    allergyDetails = json['allergy_details'];
    dynamicLink = json['dynamic_link'];
    productImages = json['product_images'] != null
        ? ProductImages.fromJson(json['product_images'])
        : null;
    if (json['modifier_group'] != null) {
      modifierGroup = <ModifierGroup>[];
      json['modifier_group'].forEach((v) {
        modifierGroup!.add( ModifierGroup.fromJson(v));
      });
    }
  }
}

class ProductImages {
  List<String>? images;
  List<String>? videos;

  ProductImages({this.images, this.videos});

  ProductImages.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    videos = json['videos'].cast<String>();
  }
}

class ModifierGroup {
  String? groupCode;
  String? name;
  String? limitModifiers;
  String? numberModifiers;
  String? selectionType;
  String? modifierMessage;
  List<SubModifiers>? subModifiers;

  ModifierGroup(
      {this.groupCode,
      this.name,
      this.limitModifiers,
      this.numberModifiers,
      this.selectionType,
      this.modifierMessage,
      this.subModifiers});

  ModifierGroup.fromJson(Map<String, dynamic> json) {
    groupCode = json['group_code'];
    name = json['name'];
    limitModifiers = json['limit_modifiers'];
    numberModifiers = json['number_modifiers'];
    selectionType = json['selection_type'];
    modifierMessage = json['modifier_message'];
    if (json['sub_modifiers'] != null) {
      subModifiers = <SubModifiers>[];
      json['sub_modifiers'].forEach((v) {
        subModifiers!.add( SubModifiers.fromJson(v));
      });
    }
  }

}

class SubModifiers {
  String? modifierCode;
  String? nameModifier;
  String? priceModifier;
  String? byDefault;

  SubModifiers(
      {this.modifierCode,
      this.nameModifier,
      this.priceModifier,
      this.byDefault});

  SubModifiers.fromJson(Map<String, dynamic> json) {
    modifierCode = json['modifier_code'];
    nameModifier = json['name_modifier'];
    priceModifier = json['price_modifier'];
    byDefault = json['by_default'];
  }
}