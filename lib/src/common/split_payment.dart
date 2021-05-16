import 'package:flutter_paystack/src/api/di/injectors.dart';
import 'package:flutter_paystack/src/api/model/split_payment.dart';
import 'package:flutter_paystack/src/api/model/sub_account.dart';

class MySplitPayment {
  Future<SubAccountResponse>? createSubAccount(
      {required String businessName,
      required String bankCode,
      required String accountNumber,
      double? percentageCharge}) {
    CreateSubAccountRequest subAccountRequest = new CreateSubAccountRequest(
        businessName: businessName,
        bankCode: bankCode,
        accountNumber: accountNumber,
        percentageCharge: percentageCharge);
    return Injector.instance.provideSplitPaymentManager
        .createSubAccount(subAccountRequest);
  }

  Future<SubAccountData>? getSubAccountById({required String idOrSlug}) {
    return Injector.instance.provideSplitPaymentManager
        .getSubAccountById(idOrSlug: idOrSlug);
  }

  Future<List<SubAccountData>>? getSubAccounts() {
    return Injector.instance.provideSplitPaymentManager.getSubAccounts();
  }

  Future<UpdateSubAccountData>? updateSubAccount(
      {required String idOrSlug,
      String? primaryContactEmail,
      required double percentageCharge}) {
    final updateSubAccountRequest = new UpdateSubAccountRequest(
        primaryContactEmail: primaryContactEmail,
        percentageCharge: percentageCharge);
    return Injector.instance.provideSplitPaymentManager
        .updateSubAccount(idOrSlug, updateSubAccountRequest);
  }

  Future<SplitPaymentResponse> createSplitTransaction(
      {required String name,
      required String type,
      required String currency,
      required List<Subaccounts>? subaccounts,
      required String bearerType,
      required String bearerSubaccount}) {
    final splitPaymentRequest = SplitPaymentRequest(
        name: name,
        type: type,
        currency: currency,
        subaccounts: subaccounts,
        bearerType: bearerType);
    return Injector.instance.provideSplitPaymentManager
        .createSplitTransaction(splitPaymentRequest);
  }

  Future<SplitPaymentAuthorizationResponse>? chargeAuthorizationSplitPayment(
      {required String email,
      required String amount,
      required String splitCode,
      required String authorizationCode}) {
    final splitPaymentRequest = SplitTransactionPaymentRequest(
        email: email,
        amount: amount,
        splitCode: splitCode,
        authorizationCode: authorizationCode);
    return Injector.instance.provideSplitPaymentManager
        .chargeAuthorizationSplitPayment(
            splitPaymentRequest: splitPaymentRequest);
  }

  Future<InitTransactionResponse>? splitTransactionPayment(
      {required SplitTransactionPaymentRequest splitPaymentRequest}) {
    final splitPaymentRequest = new SplitTransactionPaymentRequest();
    return Injector.instance.provideSplitPaymentManager
        .splitTransactionPayment(splitPaymentRequest: splitPaymentRequest);
  }
}
