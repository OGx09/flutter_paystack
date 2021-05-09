import 'package:flutter_paystack/src/api/model/subaccount.dart';
import 'package:flutter_paystack/src/api/request/validate_request_body.dart';
import 'package:flutter_paystack/src/api/service/contracts/banks_service_contract.dart';
import 'package:flutter_paystack/src/common/my_strings.dart';

class SubAccountManager {
  late BankServiceContract _service;
  late ValidateRequestBody _validateRequestBody;

  SubAccountManager(this._service, this._validateRequestBody);

  Future<SubAccountData>? createSubAccount(
      SubAccountRequest subAccountRequest) async {
    final createSubAccountResponse =
        await _service.createSubAccountRequest(subAccountRequest);
    if (createSubAccountResponse?.status == true) {
      return Future.value(createSubAccountResponse?.data);
    }
    return Future.error("${createSubAccountResponse?.message}");
  }
}
