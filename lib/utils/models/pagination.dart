class Pagination {
  final int currentPage;
  final int from;
  final int lastPage;
  final double perPage;
  final int total;

  Pagination({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      from: json['from'],
      lastPage: json['lastPage'],
      perPage: json['perPage'].toDouble(),
      total: json['total'],
    );
  }
}
