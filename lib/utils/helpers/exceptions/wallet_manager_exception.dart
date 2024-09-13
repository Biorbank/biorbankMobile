class WalletCreateException implements Exception {
  final String message;

  WalletCreateException(this.message);
}

class WalletCreateAlreadyExistException implements WalletCreateException {
  @override
  final String message;

  WalletCreateAlreadyExistException(this.message);
}

class WalletCreateHederaAccountCreationFailedException
    implements WalletCreateException {
  @override
  final String message;

  WalletCreateHederaAccountCreationFailedException(this.message);
}
