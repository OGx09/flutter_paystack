import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter_paystack/src/api/model/split_payment.dart';
import 'package:flutter_paystack/src/api/model/sub_account.dart';
import 'package:flutter_paystack/src/api/model/transaction_api_response.dart';
import 'package:flutter_paystack/src/api/request/bank_charge_request_body.dart';
import 'package:flutter_paystack/src/api/service/base_service.dart';
import 'package:flutter_paystack/src/api/service/contracts/banks_service_contract.dart';
import 'package:flutter_paystack/src/common/exceptions.dart';
import 'package:flutter_paystack/src/common/my_strings.dart';
import 'package:flutter_paystack/src/models/bank.dart';
import 'package:flutter_paystack/src/common/extensions.dart';
import 'package:http/http.dart' as http;

import 'constants/endpoints.dart';

extension on http.Response {
  Map<String, dynamic> get responseBody => json.decode(body);
}

class BankService with BaseApiService implements BankServiceContract {
  @override
  Future<String?> getTransactionId(String? accessCode) async {
    var url =
        'https://api.paystack.co/transaction/verify_access_code/$accessCode';
    try {
      http.Response response = await http.get(url.toUri());
      Map responseBody = jsonDecode(response.body);
      bool? status = responseBody['status'];
      if (response.statusCode == HttpStatus.ok && status!) {
        return responseBody['data']['id'].toString();
      }
    } catch (e) {}
    return null;
  }

  @override
  Future<TransactionApiResponse> chargeBank(
      BankChargeRequestBody? requestBody) async {
    var url =
        '$baseUrl/bank/charge_account/${requestBody!.account.bank!.id}/${requestBody.transactionId}';
    return _getChargeFuture(url, fields: requestBody.paramsMap());
  }

  @override
  Future<TransactionApiResponse> validateToken(
      BankChargeRequestBody? requestBody, Map<String, String?> fields) async {
    var url =
        '$baseUrl/bank/validate_token/${requestBody!.account.bank!.id}/${requestBody.transactionId}';
    return _getChargeFuture(url, fields: fields);
  }

  Future<TransactionApiResponse> _getChargeFuture(String url,
      {var fields}) async {
    http.Response response =
        await http.post(url.toUri(), body: fields, headers: headers);
    return _getResponseFuture(response);
  }

  TransactionApiResponse _getResponseFuture(http.Response response) {
    var body = response.body;

    Map<String, dynamic>? responseBody = json.decode(body);

    var statusCode = response.statusCode;

    if (statusCode == HttpStatus.ok) {
      return TransactionApiResponse.fromMap(responseBody!);
    } else {
      throw new ChargeException(Strings.unKnownResponse);
    }
  }

  @override
  Future<List<Bank>?> fetchSupportedBanks() async {
    return banksMemo!.runOnce(() async {
      return await _fetchSupportedBanks();
    });
  }

  Future<List<Bank>?> _fetchSupportedBanks() async {
    const url =
        'https://api.paystack.co/bank?gateway=emandate&pay_with_bank=true';
    try {
      http.Response response = await http.get(url.toUri());
      Map<String, dynamic> body = json.decode(response.body);
      var data = body['data'];
      List<Bank> banks = [];
      for (var bank in data) {
        banks.add(new Bank(bank['name'], bank['id']));
      }
      return banks;
    } catch (e) {}
    return null;
  }

  @override
  Future<SubAccountResponse> createSubAccountRequest(
      CreateSubAccountRequest subAccountRequest) async {
    http.Response response = await http.post(Endpoints.SUB_ACCOUNTS.toUri(),
        body: subAccountRequest.toJson(), headers: headers);

    return SubAccountResponse.fromJson(response.responseBody);
  }

  @override
  Future<SingleSubAccount> fetchSingleSubAccounts(
      {required String idOrSlug}) async {
    http.Response response = await http
        .get(("${Endpoints.SUB_ACCOUNTS}/$idOrSlug").toUri(), headers: headers);

    return SingleSubAccount.fromJson(response.responseBody);
  }

  @override
  Future<SubAccountListResponse> fetchSubAccounts() async {
    //SubAccountListResponse
    http.Response response =
        await http.get(Endpoints.SUB_ACCOUNTS.toUri(), headers: headers);
    return SubAccountListResponse.fromJson(response.responseBody);
  }

  @override
  Future<UpdateSubAccountResponse> updateSubAccount(
      {required String idOrSlug,
      required UpdateSubAccountRequest updateSubAccountRequest}) async {
    http.Response response = await http.put(
        ("${Endpoints.SUB_ACCOUNTS}/$idOrSlug").toUri(),
        headers: headers,
        body: updateSubAccountRequest);
    return UpdateSubAccountResponse.fromJson(response.responseBody);
  }

  @override
  Future<SplitPaymentResponse> createSplitTransaction(
      SplitPaymentRequest splitPaymentRequest) async {
    http.Response response = await http.put((Endpoints.SPLIT_PAYMENT).toUri(),
        headers: headers, body: splitPaymentRequest);
    return SplitPaymentResponse.fromJson(response.responseBody);
  }

  @override
  Future<SplitPaymentAuthorizationResponse> doChargeAuthorizationSplitPayment(
      SplitTransactionPaymentRequest splitPaymentRequest) async {
    http.Response response = await http.put(Endpoints.SUB_ACCOUNTS.toUri(),
        headers: headers, body: splitPaymentRequest);
    return SplitPaymentAuthorizationResponse.fromJson(response.responseBody);
  }

  @override
  Future<InitTransactionResponse> doSplitTransactionPayment(
      SplitTransactionPaymentRequest splitPaymentRequest) async {
    http.Response response = await http.put(Endpoints.SUB_ACCOUNTS.toUri(),
        headers: headers, body: splitPaymentRequest);
    return InitTransactionResponse.fromJson(response.responseBody);
  }
}

AsyncMemoizer<List<Bank>?>? banksMemo = new AsyncMemoizer<List<Bank>?>();
