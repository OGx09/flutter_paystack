import 'package:flutter_paystack/src/api/service/bank_service.dart';
import 'package:flutter_paystack/src/api/service/contracts/banks_service_contract.dart';
import 'package:flutter_paystack/src/transaction/split_payment_manager.dart';

class Injector {
  static final Injector _injector = Injector._internal();

  static Injector get instance => _injector;

  factory Injector() {
    return _injector;
  }

  BankServiceContract get bankService => new BankService();

  SplitPaymentManager get provideSplitPaymentManager =>
      SplitPaymentManager(bankService);

  Injector._internal();
}
