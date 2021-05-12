import 'package:flutter_paystack/src/api/model/sub_account.dart';
import 'package:flutter_paystack/src/api/request/validate_request_body.dart';
import 'package:flutter_paystack/src/api/service/contracts/banks_service_contract.dart';
import 'package:flutter_paystack/src/common/my_strings.dart';

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
    final subAccounts =
        await _service.fetchSingleSubAccounts(idOrSlug: idOrSlug);
    if (subAccounts.status == true) {
      return Future.value(subAccounts.subAccountData);
    }
    return Future.error("${subAccounts.message}");
  }
}
