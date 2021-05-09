class SubAccountRequest {
  String? name;
  String? type;
  String? currency;
  List<Subaccounts>? subaccounts;
  String? bearerType;
  String? bearerSubaccount;

  SubAccountRequest(
      {this.name,
      this.type,
      this.currency,
      this.subaccounts,
      this.bearerType,
      this.bearerSubaccount});

  SubAccountRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    currency = json['currency'];
    if (json['subaccounts'] != null) {
      subaccounts = <Subaccounts>[];
      json['subaccounts'].forEach((v) {
        subaccounts?.add(new Subaccounts.fromJson(v));
      });
    }
    bearerType = json['bearer_type'];
    bearerSubaccount = json['bearer_subaccount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['currency'] = this.currency;
    if (this.subaccounts != null) {
      data['subaccounts'] = this.subaccounts?.map((v) => v.toJson()).toList();
    }
    data['bearer_type'] = this.bearerType;
    data['bearer_subaccount'] = this.bearerSubaccount;
    return data;
  }
}

class Subaccounts {
  String? subaccount;
  int? share;

  Subaccounts({this.subaccount, this.share});

  Subaccounts.fromJson(Map<String, dynamic> json) {
    subaccount = json['subaccount'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subaccount'] = this.subaccount;
    data['share'] = this.share;
    return data;
  }
}

class SubAccountResponse {
  bool status = false;
  String? message;
  SubAccountData? data;

  SubAccountResponse({this.status = false, this.message, this.data});

  SubAccountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? new SubAccountData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class SubAccountData {
  int? id;
  String? name;
  String? type;
  String? currency;
  int? integration;
  String? domain;
  String? splitCode;
  bool? active;
  String? bearerType;
  int? bearerSubaccount;
  String? createdAt;
  String? updatedAt;
  List<Subaccounts>? subaccounts;
  int? totalSubaccounts;

  SubAccountData(
      {this.id,
      this.name,
      this.type,
      this.currency,
      this.integration,
      this.domain,
      this.splitCode,
      this.active,
      this.bearerType,
      this.bearerSubaccount,
      this.createdAt,
      this.updatedAt,
      this.subaccounts,
      this.totalSubaccounts});

  SubAccountData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    currency = json['currency'];
    integration = json['integration'];
    domain = json['domain'];
    splitCode = json['split_code'];
    active = json['active'];
    bearerType = json['bearer_type'];
    bearerSubaccount = json['bearer_subaccount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['subaccounts'] != null) {
      subaccounts = <Subaccounts>[];
      json['subaccounts'].forEach((v) {
        subaccounts?.add(new Subaccounts.fromJson(v));
      });
    }
    totalSubaccounts = json['total_subaccounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['currency'] = this.currency;
    data['integration'] = this.integration;
    data['domain'] = this.domain;
    data['split_code'] = this.splitCode;
    data['active'] = this.active;
    data['bearer_type'] = this.bearerType;
    data['bearer_subaccount'] = this.bearerSubaccount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.subaccounts != null) {
      data['subaccounts'] = this.subaccounts?.map((v) => v.toJson()).toList();
    }
    data['total_subaccounts'] = this.totalSubaccounts;
    return data;
  }
}

class Subaccount {
  int? id;
  String? subaccountCode;
  String? businessName;
  String? description;
  String? primaryContactName;
  String? primaryContactEmail;
  String? primaryContactPhone;
  dynamic? metadata;
  int? percentageCharge;
  String? settlementBank;
  String? accountNumber;

  Subaccount(
      {this.id,
      this.subaccountCode,
      this.businessName,
      this.description,
      this.primaryContactName,
      this.primaryContactEmail,
      this.primaryContactPhone,
      this.metadata,
      this.percentageCharge,
      this.settlementBank,
      this.accountNumber});

  Subaccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subaccountCode = json['subaccount_code'];
    businessName = json['business_name'];
    description = json['description'];
    primaryContactName = json['primary_contact_name'];
    primaryContactEmail = json['primary_contact_email'];
    primaryContactPhone = json['primary_contact_phone'];
    metadata = json['metadata'];
    percentageCharge = json['percentage_charge'];
    settlementBank = json['settlement_bank'];
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subaccount_code'] = this.subaccountCode;
    data['business_name'] = this.businessName;
    data['description'] = this.description;
    data['primary_contact_name'] = this.primaryContactName;
    data['primary_contact_email'] = this.primaryContactEmail;
    data['primary_contact_phone'] = this.primaryContactPhone;
    data['metadata'] = this.metadata;
    data['percentage_charge'] = this.percentageCharge;
    data['settlement_bank'] = this.settlementBank;
    data['account_number'] = this.accountNumber;
    return data;
  }
}
