import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/amenitity_indicator_widget.dart';
import '../create_property_3/create_property3_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProperty2Widget extends StatefulWidget {
  const CreateProperty2Widget({
    Key? key,
    this.propertyRef,
    this.propertyAmenities,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;
  final AmenititiesRecord? propertyAmenities;

  @override
  _CreateProperty2WidgetState createState() => _CreateProperty2WidgetState();
}

class _CreateProperty2WidgetState extends State<CreateProperty2Widget> {
  bool? amenityACValue;
  bool? amenityEVChargingValue;
  bool? amenityPoolValue1;
  bool? amenityExtraOutletsValue;
  bool? amenityHeatingValue;
  bool? amenityWasherValue;
  bool? amenityDryerValue;
  bool? amenityPetsValue;
  bool? amenityWorkoutValue;
  bool? amenityPoolValue2;
  bool? amenityPoolValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Create Property',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'CHOOSE YOUR AMENITIES',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                if (!amenityPoolValue1!)
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.pool_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityPoolValue1 ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityPoolValue1 = newValue),
                                title: Text(
                                  'Pool',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.ev_station_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityEVChargingValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityEVChargingValue = newValue),
                                title: Text(
                                  'EV Car Charging',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.power_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityExtraOutletsValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityExtraOutletsValue = newValue),
                                title: Text(
                                  'Extra Outlets',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.ac_unit_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityACValue ??= false,
                                onChanged: (newValue) =>
                                    setState(() => amenityACValue = newValue),
                                title: Text(
                                  'Air Conditioning (AC)',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.wb_sunny_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityHeatingValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityHeatingValue = newValue),
                                title: Text(
                                  'Heating',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.local_laundry_service_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityWasherValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityWasherValue = newValue),
                                title: Text(
                                  'Washer',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.local_laundry_service_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityDryerValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityDryerValue = newValue),
                                title: Text(
                                  'Dryer',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.pets_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityPetsValue ??= false,
                                onChanged: (newValue) =>
                                    setState(() => amenityPetsValue = newValue),
                                title: Text(
                                  'Pet Friendly',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.fitness_center_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityWorkoutValue ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityWorkoutValue = newValue),
                                title: Text(
                                  'Workout Facility',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: AmenitityIndicatorWidget(
                                    icon: Icon(
                                      Icons.theater_comedy,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                    ),
                                    background: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderColor:
                                        FlutterFlowTheme.of(context).lineGray,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SwitchListTile.adaptive(
                                value: amenityPoolValue2 ??= false,
                                onChanged: (newValue) => setState(
                                    () => amenityPoolValue2 = newValue),
                                title: Text(
                                  'Hip',
                                  style: FlutterFlowTheme.of(context).subtitle1,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                activeTrackColor: Color(0xFF392BBA),
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding:
                                    EdgeInsetsDirectional.fromSTEB(16, 8, 0, 8),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: AmenitityIndicatorWidget(
                                      icon: Icon(
                                        Icons.nightlife,
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                      background: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderColor:
                                          FlutterFlowTheme.of(context).lineGray,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SwitchListTile.adaptive(
                                  value: amenityPoolValue3 ??= false,
                                  onChanged: (newValue) => setState(
                                      () => amenityPoolValue3 = newValue),
                                  title: Text(
                                    'Night Life',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  activeTrackColor: Color(0xFF392BBA),
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16, 8, 0, 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STEP',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          '2/3',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ],
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final amenititiesUpdateData =
                            createAmenititiesRecordData(
                          ac: amenityACValue,
                          heater: amenityHeatingValue,
                          pool: amenityPoolValue1,
                          dogFriendly: amenityPetsValue,
                          washer: amenityWasherValue,
                          dryer: amenityDryerValue,
                          workout: amenityWorkoutValue,
                          hip: amenityPoolValue2,
                          nightLife: amenityPoolValue3,
                          extraOutlets: amenityExtraOutletsValue,
                          evCharger: amenityEVChargingValue,
                        );
                        await widget.propertyAmenities!.reference
                            .update(amenititiesUpdateData);
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateProperty3Widget(
                              propertyRef: widget.propertyRef,
                            ),
                          ),
                        );
                      },
                      text: 'NEXT',
                      options: FFButtonOptions(
                        width: 120,
                        height: 50,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Urbanist',
                                  color: Colors.white,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
