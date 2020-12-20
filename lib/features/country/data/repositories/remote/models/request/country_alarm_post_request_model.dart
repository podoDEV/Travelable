import '../../../../../../../core/networking/mappable.dart';

class CountryAlarmPostRequestModel extends RequestMappable {
  final int countryId;
  final bool enabled;

  CountryAlarmPostRequestModel(this.countryId, this.enabled);

  @override
  Map<String, dynamic> toJson() => {"alarmEnabled": enabled};
}
