import 'dart:convert';

class Meta {
  Meta({
    this.currentRows,
    this.totalRows,
    this.rowsRemaining,
    this.totalPages,
    this.pagesRemaining,
    this.nextPage,
    this.nextPageOffset,
  });

  int? currentRows;
  int? totalRows;
  int? rowsRemaining;
  int? totalPages;
  int? pagesRemaining;
  String? nextPage;
  int? nextPageOffset;

  factory Meta.fromJson(String str) {
    return Meta.fromMap(jsonDecode(str));
  }

  String toJson() => jsonEncode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) {
    return Meta(
      currentRows: json["current_rows"],
      totalRows: json["total_rows"],
      rowsRemaining: json["rows_remaining"],
      totalPages: json["total_pages"],
      pagesRemaining: json["pages_remaining"],
      nextPage: json["next_page"],
      nextPageOffset: json["next_page_offset"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "current_rows": currentRows,
      "total_rows": totalRows,
      "rows_remaining": rowsRemaining,
      "total_pages": totalPages,
      "pages_remaining": pagesRemaining,
      "next_page": nextPage,
      "next_page_offset": nextPageOffset,
    };
  }
}
