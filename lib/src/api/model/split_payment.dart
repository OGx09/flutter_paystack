import 'package:flutter_paystack/src/api/model/sub_account.dart';

class SplitPaymentRequest {
  String? name;
  String? type;
  String? currency;
  List<Subaccounts>? subaccounts;
  String? bearerType;
  String? bearerSubaccount;

  SplitPaymentRequest(
      {this.name,
      this.type,
      this.currency,
      this.subaccounts,
      this.bearerType,
      this.bearerSubaccount});

  SplitPaymentRequest.fromJson(Map<String, dynamic> json) {
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

class SplitPaymentResponse {
  bool status = false;
  String? message;
  SplitPaymentData? data;

  SplitPaymentResponse({this.status = false, this.message, this.data});

  SplitPaymentResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new SplitPaymentData.fromJson(json['data'])
        : null;
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

class SplitPaymentData {
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

  SplitPaymentData(
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

  SplitPaymentData.fromJson(Map<String, dynamic> json) {
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

class SplitPayment {
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

  SplitPayment(
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

  SplitPayment.fromJson(Map<String, dynamic> json) {
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

class UpdateSubAccountResponse extends BaseApiResponse {
  UpdateSubAccountData? data;

  UpdateSubAccountResponse({this.data});

  UpdateSubAccountResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new UpdateSubAccountData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class UpdateSubAccountData {
  int? integration;
  String? domain;
  String? subaccountCode;
  String? businessName;
  String? description;
  String? primaryContactName;
  String? primaryContactEmail;
  String? primaryContactPhone;
  dynamic metadata;
  double? percentageCharge;
  bool? isVerified;
  String? settlementBank;
  String? accountNumber;
  String? settlementSchedule;
  bool? active;
  bool? migrate;
  int? id;
  String? createdAt;
  String? updatedAt;

  UpdateSubAccountData(
      {this.integration,
      this.domain,
      this.subaccountCode,
      this.businessName,
      this.description,
      this.primaryContactName,
      this.primaryContactEmail,
      this.primaryContactPhone,
      this.metadata,
      this.percentageCharge,
      this.isVerified,
      this.settlementBank,
      this.accountNumber,
      this.settlementSchedule,
      this.active,
      this.migrate,
      this.id,
      this.createdAt,
      this.updatedAt});

  UpdateSubAccountData.fromJson(Map<String, dynamic> json) {
    integration = json['integration'];
    domain = json['domain'];
    subaccountCode = json['subaccount_code'];
    businessName = json['business_name'];
    description = json['description'];
    primaryContactName = json['primary_contact_name'];
    primaryContactEmail = json['primary_contact_email'];
    primaryContactPhone = json['primary_contact_phone'];
    metadata = json['metadata'];
    percentageCharge = json['percentage_charge'];
    isVerified = json['is_verified'];
    settlementBank = json['settlement_bank'];
    accountNumber = json['account_number'];
    settlementSchedule = json['settlement_schedule'];
    active = json['active'];
    migrate = json['migrate'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integration'] = this.integration;
    data['domain'] = this.domain;
    data['subaccount_code'] = this.subaccountCode;
    data['business_name'] = this.businessName;
    data['description'] = this.description;
    data['primary_contact_name'] = this.primaryContactName;
    data['primary_contact_email'] = this.primaryContactEmail;
    data['primary_contact_phone'] = this.primaryContactPhone;
    data['metadata'] = this.metadata;
    data['percentage_charge'] = this.percentageCharge;
    data['is_verified'] = this.isVerified;
    data['settlement_bank'] = this.settlementBank;
    data['account_number'] = this.accountNumber;
    data['settlement_schedule'] = this.settlementSchedule;
    data['active'] = this.active;
    data['migrate'] = this.migrate;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SplitTransactionPaymentRequest {
  String? email;
  String? amount;
  String? splitCode;
  String? authorizationCode;

  SplitTransactionPaymentRequest(
      {this.email, this.amount, this.splitCode, this.authorizationCode});

  SplitTransactionPaymentRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    amount = json['amount'];
    splitCode = json['split_code'];
    authorizationCode = json['authorization_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['amount'] = this.amount;
    data['split_code'] = this.splitCode;
    data['authorization_code'] = this.authorizationCode;
    return data;
  }
}

class InitTransactionResponse {
  bool? status;
  String? message;
  InitTransactionResponseData? data;

  InitTransactionResponse({this.status, this.message, this.data});

  InitTransactionResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new InitTransactionResponseData.fromJson(json['data'])
        : null;
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

class InitTransactionResponseData {
  String? authorizationUrl;
  String? accessCode;
  String? reference;

  InitTransactionResponseData(
      {this.authorizationUrl, this.accessCode, this.reference});

  InitTransactionResponseData.fromJson(Map<String, dynamic> json) {
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_url'] = this.authorizationUrl;
    data['access_code'] = this.accessCode;
    data['reference'] = this.reference;
    return data;
  }
}

class SplitPaymentAuthorizationResponse {
  bool? status;
  String? message;
  SplitPaymentAuthorizationData? data;

  SplitPaymentAuthorizationResponse({this.status, this.message, this.data});

  SplitPaymentAuthorizationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? new SplitPaymentAuthorizationData.fromJson(json['data'])
        : null;
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

class SplitPaymentAuthorizationData {
  int? amount;
  String? currency;
  String? transactionDate;
  String? status;
  String? reference;
  String? domain;
  String? metadata;
  String? gatewayResponse;
  String? message;
  String? channel;
  String? ipAddress;
  dynamic log;
  int? fees;
  Authorization? authorization;
  Customer? customer;
  dynamic plan;
  int? id;

  SplitPaymentAuthorizationData(
      {this.amount,
      this.currency,
      this.transactionDate,
      this.status,
      this.reference,
      this.domain,
      this.metadata,
      this.gatewayResponse,
      this.message,
      this.channel,
      this.ipAddress,
      this.log,
      this.fees,
      this.authorization,
      this.customer,
      this.plan,
      this.id});

  SplitPaymentAuthorizationData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    transactionDate = json['transaction_date'];
    status = json['status'];
    reference = json['reference'];
    domain = json['domain'];
    metadata = json['metadata'];
    gatewayResponse = json['gateway_response'];
    message = json['message'];
    channel = json['channel'];
    ipAddress = json['ip_address'];
    log = json['log'];
    fees = json['fees'];
    authorization = json['authorization'] != null
        ? new Authorization.fromJson(json['authorization'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    plan = json['plan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['transaction_date'] = this.transactionDate;
    data['status'] = this.status;
    data['reference'] = this.reference;
    data['domain'] = this.domain;
    data['metadata'] = this.metadata;
    data['gateway_response'] = this.gatewayResponse;
    data['message'] = this.message;
    data['channel'] = this.channel;
    data['ip_address'] = this.ipAddress;
    data['log'] = this.log;
    data['fees'] = this.fees;
    if (this.authorization != null) {
      data['authorization'] = this.authorization?.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer?.toJson();
    }
    data['plan'] = this.plan;
    data['id'] = this.id;
    return data;
  }
}

class Authorization {
  String? authorizationCode;
  String? bin;
  String? last4;
  String? expMonth;
  String? expYear;
  String? channel;
  String? cardType;
  String? bank;
  String? countryCode;
  String? brand;
  bool? reusable;
  String? signature;
  String? accountName;

  Authorization(
      {this.authorizationCode,
      this.bin,
      this.last4,
      this.expMonth,
      this.expYear,
      this.channel,
      this.cardType,
      this.bank,
      this.countryCode,
      this.brand,
      this.reusable,
      this.signature,
      this.accountName});

  Authorization.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorization_code'];
    bin = json['bin'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    channel = json['channel'];
    cardType = json['card_type'];
    bank = json['bank'];
    countryCode = json['country_code'];
    brand = json['brand'];
    reusable = json['reusable'];
    signature = json['signature'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_code'] = this.authorizationCode;
    data['bin'] = this.bin;
    data['last4'] = this.last4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['channel'] = this.channel;
    data['card_type'] = this.cardType;
    data['bank'] = this.bank;
    data['country_code'] = this.countryCode;
    data['brand'] = this.brand;
    data['reusable'] = this.reusable;
    data['signature'] = this.signature;
    data['account_name'] = this.accountName;
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? customerCode;
  String? phone;
  dynamic metadata;
  String? riskAction;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.customerCode,
      this.phone,
      this.metadata,
      this.riskAction});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    customerCode = json['customer_code'];
    phone = json['phone'];
    metadata = json['metadata'];
    riskAction = json['risk_action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['customer_code'] = this.customerCode;
    data['phone'] = this.phone;
    data['metadata'] = this.metadata;
    data['risk_action'] = this.riskAction;
    return data;
  }
}
