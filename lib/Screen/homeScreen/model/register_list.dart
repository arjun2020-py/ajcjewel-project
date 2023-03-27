// To parse this JSON data, do
//
//     final regsiterListModel = regsiterListModelFromJson(jsonString);

class RegsiterListModel {
  RegsiterListModel({
    required this.sortType,
    required this.sortOrder,
    required this.statusArray,
    required this.screenType,
    required this.responseFormat,
    required this.branchIds,
    required this.limit,
    required this.skip,
    required this.searchingText,
  });

  int sortType;
  int sortOrder;
  List<int> statusArray;
  List<dynamic> screenType;
  List<dynamic> responseFormat;
  List<dynamic> branchIds;
  int limit;
  int skip;
  String searchingText;

  factory RegsiterListModel.fromJson(Map<String, dynamic> json) =>
      RegsiterListModel(
        sortType: json["sortType"],
        sortOrder: json["sortOrder"],
        statusArray: List<int>.from(json["statusArray"].map((x) => x)),
        screenType: List<dynamic>.from(json["screenType"].map((x) => x)),
        responseFormat:
            List<dynamic>.from(json["responseFormat"].map((x) => x)),
        branchIds: List<dynamic>.from(json["branchIds"].map((x) => x)),
        limit: json["limit"],
        skip: json["skip"],
        searchingText: json["searchingText"],
      );

  Map<String, dynamic> toJson() => {
        "sortType": sortType,
        "sortOrder": sortOrder,
        "statusArray": List<dynamic>.from(statusArray.map((x) => x)),
        "screenType": List<dynamic>.from(screenType.map((x) => x)),
        "responseFormat": List<dynamic>.from(responseFormat.map((x) => x)),
        "branchIds": List<dynamic>.from(branchIds.map((x) => x)),
        "limit": limit,
        "skip": skip,
        "searchingText": searchingText,
      };
}
