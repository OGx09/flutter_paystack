class Endpoints {
  static const String BASE_URL = "https://api.paystack.co";
  static const String SUB_ACCOUNTS = "$BASE_URL/subaccount";
  static const String TRANSACTION = "$BASE_URL/transaction";
  static const String SPLIT_PAYMENT = "$BASE_URL/split";
  static const String PAYMENT_INIT = "$TRANSACTION/initialize";
  static const String CHARGE_AUTHORIZATION =
      "$TRANSACTION/charge_authorization";
}
