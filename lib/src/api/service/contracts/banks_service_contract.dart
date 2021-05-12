import 'dart:convert';

import 'package:flutter_paystack/src/api/model/split_payment.dart';
import 'package:flutter_paystack/src/api/model/sub_account.dart';
import 'package:flutter_paystack/src/api/model/transaction_api_response.dart';
import 'package:flutter_paystack/src/api/request/bank_charge_request_body.dart';
import 'package:flutter_paystack/src/models/bank.dart';

abstract class BankServiceContract {
  Future<String?> getTransactionId(String? accessCode);

  Future<TransactionApiResponse> chargeBank(BankChargeRequestBody? requestBody);

  Future<TransactionApiResponse> validateToken(
      BankChargeRequestBody? requestBody, Map<String, String?> fields);

  Future<List<Bank>?>? fetchSupportedBanks();

  Future<SubAccountResponse> createSubAccountRequest(
      CreateSubAccountRequest subAccountRequest);

  Future<SubAccountListResponse> fetchSubAccounts();

  Future<SingleSubAccount> fetchSingleSubAccounts({required String idOrSlug});

  Future<UpdateSubAccountResponse> updateSubAccount(
      {required String idOrSlug,
      required UpdateSubAccountRequest updateSubAccountRequest});

  Future<SplitPaymentResponse> createSplitTransaction(
      SplitPaymentRequest splitPaymentRequest);

  Future<InitTransactionResponse> doSplitTransactionPayment(
      SplitTransactionPaymentRequest splitPaymentRequest);

  Future<SplitPaymentAuthorizationResponse> doChargeAuthorizationSplitPayment(
      SplitTransactionPaymentRequest splitPaymentRequest);
}
