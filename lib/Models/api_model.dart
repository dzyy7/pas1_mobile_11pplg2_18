import 'package:get/get.dart';

class ApiModel {
  final String strTeam;
  final String strBadge;
  final String strDescriptionEN;
  final String intFormedYear;
  final String strLeague;
  final String strStadium;
  final String strLocation;
  final RxBool isFavorite;

  ApiModel({
    required this.strTeam,
    required this.strBadge,
    required this.strDescriptionEN,
    required this.intFormedYear,
    required this.strLeague,
    required this.strStadium,
    required this.strLocation,
    bool? isFavorite,
  }) : isFavorite = (isFavorite ?? false).obs;

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      strTeam: json['strTeam'] ?? '',
      strBadge: json['strBadge'] ?? '',
      strDescriptionEN: json['strDescriptionEN'] ?? '',
      intFormedYear: json['intFormedYear'] ?? '',
      strLeague: json['strLeague'] ?? '',
      strStadium: json['strStadium'] ?? '',
      strLocation: json['strLocation'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strTeam': strTeam,
      'strBadge': strBadge,
      'strDescriptionEN': strDescriptionEN,
      'intFormedYear': intFormedYear,
      'strLeague': strLeague,
      'strStadium': strStadium,
      'strLocation': strLocation,
    };
  }
}
