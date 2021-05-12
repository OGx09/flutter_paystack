import 'dart:async';

class Validators {
  final validateSubAccountNumber =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (accountNumber, sink) {
    String source = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp numRegex = new RegExp(source);
    if (accountNumber.isEmpty || !numRegex.hasMatch(accountNumber)) {
      sink.addError('Account number is invalid');
    } else {
      sink.add(accountNumber);
    }
  });

  final validateSubAccountName = StreamTransformer<String, String>.fromHandlers(
      handleData: (subAccountName, sink) {
    if (subAccountName.isEmpty) {
      sink.add(subAccountName);
    } else {
      sink.addError('Subaccount Name cannot not be empty');
    }
  });
}
