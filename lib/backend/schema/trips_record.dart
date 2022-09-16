import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'trips_record.g.dart';

abstract class TripsRecord implements Built<TripsRecord, TripsRecordBuilder> {
  static Serializer<TripsRecord> get serializer => _$tripsRecordSerializer;

  DocumentReference? get propertyRef;

  DocumentReference? get userRef;

  DateTime? get tripBeginDate;

  DateTime? get tripEndDate;

  double? get tripCost;

  int? get guests;

  String? get paymentMethod;

  DateTime? get tripCreated;

  DocumentReference? get host;

  bool? get cancelTrip;

  String? get cancelReason;

  int? get tripTotal;

  bool? get upcoming;

  bool? get complete;

  bool? get rated;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TripsRecordBuilder builder) => builder
    ..tripCost = 0.0
    ..guests = 0
    ..paymentMethod = ''
    ..cancelTrip = false
    ..cancelReason = ''
    ..tripTotal = 0
    ..upcoming = false
    ..complete = false
    ..rated = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trips');

  static Stream<TripsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TripsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TripsRecord._();
  factory TripsRecord([void Function(TripsRecordBuilder) updates]) =
      _$TripsRecord;

  static TripsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTripsRecordData({
  DocumentReference? propertyRef,
  DocumentReference? userRef,
  DateTime? tripBeginDate,
  DateTime? tripEndDate,
  double? tripCost,
  int? guests,
  String? paymentMethod,
  DateTime? tripCreated,
  DocumentReference? host,
  bool? cancelTrip,
  String? cancelReason,
  int? tripTotal,
  bool? upcoming,
  bool? complete,
  bool? rated,
}) {
  final firestoreData = serializers.toFirestore(
    TripsRecord.serializer,
    TripsRecord(
      (t) => t
        ..propertyRef = propertyRef
        ..userRef = userRef
        ..tripBeginDate = tripBeginDate
        ..tripEndDate = tripEndDate
        ..tripCost = tripCost
        ..guests = guests
        ..paymentMethod = paymentMethod
        ..tripCreated = tripCreated
        ..host = host
        ..cancelTrip = cancelTrip
        ..cancelReason = cancelReason
        ..tripTotal = tripTotal
        ..upcoming = upcoming
        ..complete = complete
        ..rated = rated,
    ),
  );

  return firestoreData;
}
