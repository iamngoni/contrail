// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trace_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TraceDTO _$TraceDTOFromJson(Map<String, dynamic> json) => _TraceDTO(
  timestamp: (json['timestamp'] as num).toDouble(),
  trace:
      (json['trace'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList() ??
      const <List<Object?>>[],
);

Map<String, dynamic> _$TraceDTOToJson(_TraceDTO instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'trace': instance.trace,
};
