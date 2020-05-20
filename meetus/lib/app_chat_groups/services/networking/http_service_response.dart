class NetworkServiceResponse<T> {
  T content;
  bool success;
  String message;
  int statusCode;

  NetworkServiceResponse(
      {this.content, this.success, this.message, this.statusCode});
}

class MappedNetworkServiceResponse<T> {
  dynamic mappedResult;
  NetworkServiceResponse<T> networkServiceResponse;
  MappedNetworkServiceResponse(
      {this.mappedResult, this.networkServiceResponse});
}
