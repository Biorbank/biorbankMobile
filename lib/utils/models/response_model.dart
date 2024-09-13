class FunctionResponse {
  final int statusCode;
  final dynamic message;
  FunctionResponse({this.statusCode = 0, this.message});
  @override
  String toString() {
    return "$statusCode   $message";
  }
}
