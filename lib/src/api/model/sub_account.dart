import 'package:flutter_paystack/src/api/request/base_request_body.dart';

class CreateSubAccountRequest {
  String? businessName;
  String? bankCode;
  String? accountNumber;
  double? percentageCharge;

  CreateSubAccountRequest(
      {this.businessName,
      this.bankCode,
      this.accountNumber,
      this.percentageCharge});

  CreateSubAccountRequest.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    bankCode = json['bank_code'];
    accountNumber = json['account_number'];
    percentageCharge = json['percentage_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['bank_code'] = this.bankCode;
    data['account_number'] = this.accountNumber;
    data['percentage_charge'] = this.percentageCharge;
    return data;
  }
}

class SubAccountResponse {
  bool? status;
  String? message;
  SubAccountData? data;

  SubAccountResponse({this.status, this.message, this.data});

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
  String? businessName;
  String? accountNumber;
  double? percentageCharge;
  String? settlementBank;
  int? integration;
  String? domain;
  String? subaccountCode;
  bool? isVerified;
  String? settlementSchedule;
  bool? active;
  bool? migrate;
  int? id;
  String? createdAt;
  String? updatedAt;

  SubAccountData(
      {this.businessName,
      this.accountNumber,
      this.percentageCharge,
      this.settlementBank,
      this.integration,
      this.domain,
      this.subaccountCode,
      this.isVerified,
      this.settlementSchedule,
      this.active,
      this.migrate,
      this.id,
      this.createdAt,
      this.updatedAt});

  SubAccountData.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    accountNumber = json['account_number'];
    percentageCharge = json['percentage_charge'];
    settlementBank = json['settlement_bank'];
    integration = json['integration'];
    domain = json['domain'];
    subaccountCode = json['subaccount_code'];
    isVerified = json['is_verified'];
    settlementSchedule = json['settlement_schedule'];
    active = json['active'];
    migrate = json['migrate'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_name'] = this.businessName;
    data['account_number'] = this.accountNumber;
    data['percentage_charge'] = this.percentageCharge;
    data['settlement_bank'] = this.settlementBank;
    data['integration'] = this.integration;
    data['domain'] = this.domain;
    data['subaccount_code'] = this.subaccountCode;
    data['is_verified'] = this.isVerified;
    data['settlement_schedule'] = this.settlementSchedule;
    data['active'] = this.active;
    data['migrate'] = this.migrate;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class UpdateSubAccountRequest {
  String? primaryContactEmail;
  double? percentageCharge;

  UpdateSubAccountRequest({this.primaryContactEmail, this.percentageCharge});

  UpdateSubAccountRequest.fromJson(Map<String, dynamic> json) {
    primaryContactEmail = json['primary_contact_email'];
    percentageCharge = json['percentage_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary_contact_email'] = this.primaryContactEmail;
    data['percentage_charge'] = this.percentageCharge;
    return data;
  }
}

class BaseApiResponse {
  bool? status;
  String? message;

  BaseApiResponse({this.status, this.message});

  BaseApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class SubAccountListResponse {
  List<SubAccountData>? subAccountData;
  bool? status;
  String? message;

  SubAccountListResponse(this.subAccountData, this.status, this.message);

  SubAccountListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //new SubAccountData.fromJson(json['data'])
    subAccountData = <SubAccountData>[];
    if (json['data'] != null) {
      json['data'].forEach((e) {
        subAccountData?.add(SubAccountData.fromJson(json));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.subAccountData != null) {
      data['data'] = this.subAccountData?.map((e) => e.toJson());
    }
    return data;
  }
}

class SingleSubAccount extends BaseApiResponse {
  SubAccountData? subAccountData;

  SingleSubAccount({this.subAccountData});

  SingleSubAccount.fromJson(Map<String, dynamic> json) {
    subAccountData =
        json['data'] != null ? new SubAccountData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subAccountData != null) {
      data['data'] = this.subAccountData;
    }
    return data;
  }
}
