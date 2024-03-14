// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      id: json['id'] as int,
      code: json['Code'] as String,
      ccy: json['Ccy'] as String,
      ccyNmRU: json['CcyNm_RU'] as String,
      ccyNmUZ: json['CcyNm_UZ'] as String,
      ccyNmUZC: json['CcyNm_UZC'] as String,
      ccyNmEN: json['CcyNm_EN'] as String,
      nominal: json['Nominal'] as String,
      rate: json['Rate'] as String,
      diff: json['Diff'] as String,
      date: json['Date'] as String,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'ccy': instance.ccy,
      'ccyNmRU': instance.ccyNmRU,
      'ccyNmUZ': instance.ccyNmUZ,
      'ccyNmUZC': instance.ccyNmUZC,
      'ccyNmEN': instance.ccyNmEN,
      'nominal': instance.nominal,
      'rate': instance.rate,
      'diff': instance.diff,
      'date': instance.date,
    };
