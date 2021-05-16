import 'package:flutter_paystack/src/api/model/split_payment.dart';
import 'package:flutter_paystack/src/api/model/sub_account.dart';
import 'package:flutter_paystack/src/api/service/contracts/banks_service_contract.dart';

class SplitPaymentManager {
  late BankServiceContract _service;

  SplitPaymentManager(this._service);

  Future<SubAccountResponse> createSubAccount(
      CreateSubAccountRequest subAccountRequest) async {
    final createSubAccountResponse =
        await _service.createSubAccountRequest(subAccountRequest);
    if (createSubAccountResponse.status == true) {
      return Future.value(createSubAccountResponse);
    }
    return Future.error("${createSubAccountResponse.message}");
  }

  Future<SubAccountData> getSubAccountById({required String idOrSlug}) async {
    final subAccount =
        await _service.fetchSingleSubAccounts(idOrSlug: idOrSlug);
    if (subAccount.status == true) {
      return Future.value(subAccount.subAccountData);
    }
    return Future.error("${subAccount.message}");
  }

  Future<List<SubAccountData>> getSubAccounts() async {
    final subAccounts = await _service.fetchSubAccounts();
    print("MAINCLASSSSS ${subAccounts.message}");
    if (subAccounts.status == true) {
      return Future.value(subAccounts.subAccountData);
    }
    return Future.error("${subAccounts.toJson()}");
  }

  Future<UpdateSubAccountData> updateSubAccount(
      String idOrSlug, UpdateSubAccountRequest updateSubAccountRequest) async {
    final subAccounts = await _service.updateSubAccount(
        idOrSlug: idOrSlug, updateSubAccountRequest: updateSubAccountRequest);
    if (subAccounts.status == true) {
      return Future.value(subAccounts.data);
    }
    return Future.error("${subAccounts.message}");
  }

  Future<SplitPaymentResponse> createSplitTransaction(
      SplitPaymentRequest splitPaymentRequest) async {
    final splitPayment =
        await _service.createSplitTransaction(splitPaymentRequest);
    if (splitPayment.status == true) {
      return Future.value(splitPayment);
    }
    return Future.error("${splitPayment.message}");
  }

  Future<SplitPaymentAuthorizationResponse> chargeAuthorizationSplitPayment(
      {required SplitTransactionPaymentRequest splitPaymentRequest}) async {
    final authSplitPayment =
        await _service.doChargeAuthorizationSplitPayment(splitPaymentRequest);
    if (authSplitPayment.status == true) {
      return Future.value(authSplitPayment);
    }
    return Future.error("${authSplitPayment.message}");
  }

  Future<InitTransactionResponse> splitTransactionPayment(
      {required SplitTransactionPaymentRequest splitPaymentRequest}) async {
    final transaction =
        await _service.doSplitTransactionPayment(splitPaymentRequest);
    if (transaction.status == true) {
      return Future.value(transaction);
    }
    return Future.error("${transaction.message}");
  }
}
