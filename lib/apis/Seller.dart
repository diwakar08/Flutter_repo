class Seller {
  String? ownerName;
  String? password;
  String? phone;
  String? businessType;
  String? shopName;
  GSTIN? gstin;
  String? photo;
  Address? address;
  String? shopTimings;
  PanCard? panCard;
  BankDetails? bankDetails;
  double? marginCharged;
  String? shopCategory;
  DateTime? createdAt;
  DateTime? updatedAt;

  Seller({
    this.ownerName,
    this.password,
    this.phone,
    this.businessType,
    this.shopName,
    this.gstin,
    this.photo,
    this.address,
    this.shopTimings,
    this.panCard,
    this.bankDetails,
    this.marginCharged,
    this.shopCategory,
    this.createdAt,
    this.updatedAt,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      ownerName: json['ownerName'],
      password: json['password'],
      phone: json['phone'],
      businessType: json['businessType'],
      shopName: json['shopName'],
      gstin: GSTIN.fromJson(json['gstin']),
      photo: json['photo'],
      address: Address.fromJson(json['address']),
      shopTimings: json['shopTimings'],
      panCard: PanCard.fromJson(json['panCard']),
      bankDetails: BankDetails.fromJson(json['bankDetails']),
      marginCharged: json['marginCharged'].toDouble(),
      shopCategory: json['shopCategory'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class GSTIN {
  String? gstinNo;
  String? gstinImage;

  GSTIN({
    this.gstinNo,
    this.gstinImage,
  });

  factory GSTIN.fromJson(Map<String, dynamic> json) {
    return GSTIN(
      gstinNo: json['gstinNo'],
      gstinImage: json['gstinImage'],
    );
  }
}

class Address {
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? pincode;
  String? location;

  Address({
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.pincode,
    this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      location: json['location'],
    );
  }
}

class PanCard {
  String? panNo;
  String? panImage;

  PanCard({
    this.panNo,
    this.panImage,
  });

  factory PanCard.fromJson(Map<String, dynamic> json) {
    return PanCard(
      panNo: json['panNo'],
      panImage: json['panImage'],
    );
  }
}

class BankDetails {
  String? accountNo;
  String? ifscCode;
  String? bankName;
  String? branchName;
  String? passbookImage;

  BankDetails({
    this.accountNo,
    this.ifscCode,
    this.bankName,
    this.branchName,
    this.passbookImage,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
      accountNo: json['accountNo'],
      ifscCode: json['ifscCode'],
      bankName: json['bankName'],
      branchName: json['branchName'],
      passbookImage: json['passbookImage'],
    );
  }
}
