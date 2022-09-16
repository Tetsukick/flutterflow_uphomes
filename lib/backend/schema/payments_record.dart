import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payments_record.g.dart';

abstract class PaymentsRecord
    implements Built<PaymentsRecord, PaymentsRecordBuilder> {
  static Serializer<PaymentsRecord> get serializer =>
      _$paymentsRecordSerializer;

  DocumentReference? get hostRef;

  DocumentReference? get tripRef;

  DocumentReference? get guestRef;

  double? get amount;

  double? get fees;

  double? get taxes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PaymentsRecordBuilder builder) => builder
    ..amount = 0.0
    ..fees = 0.0
    ..taxes = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PaymentsRecord._();
  factory PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =
      _$PaymentsRecord;

  static PaymentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPaymentsRecordData({
  DocumentReference? hostRef,
  DocumentReference? tripRef,
  DocumentReference? guestRef,
  double? amount,
  double? fees,
  double? taxes,
}) {
  final firestoreData = serializers.toFirestore(
    PaymentsRecord.serializer,
    PaymentsRecord(
      (p) => p
        ..hostRef = hostRef
        ..tripRef = tripRef
        ..guestRef = guestRef
        ..amount = amount
        ..fees = fees
        ..taxes = taxes,
    ),
  );

  return firestoreData;
}
