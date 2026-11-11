
import 'dart:convert';

DataModel dataModelFromJson(String str) =>
    DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) =>
    json.encode(data.toJson());

class DataModel {
  final List<Map<String, String?>> teams;

  DataModel({
    required this.teams,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        teams: (json["teams"] as List? ?? []).map((team) {
          final Map<String, dynamic> data =
              Map<String, dynamic>.from(team);

          return data.map(
            (key, value) => MapEntry(
              key,
              value?.toString(),
            ),
          );
        }).toList(),
      );

  Map<String, dynamic> toJson() => {
        "teams": teams,
      };
}
