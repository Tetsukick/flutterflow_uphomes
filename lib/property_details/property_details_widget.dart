import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../book_now/book_now_widget.dart';
import '../components/amenitity_indicator_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../property_review/property_review_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyDetailsWidget extends StatefulWidget {
  const PropertyDetailsWidget({
    Key? key,
    this.propertyRef,
  }) : super(key: key);

  final PropertiesRecord? propertyRef;

  @override
  _PropertyDetailsWidgetState createState() => _PropertyDetailsWidgetState();
}

class _PropertyDetailsWidgetState extends State<PropertyDetailsWidget>
    with TickerProviderStateMixin {
  PageController? pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 50),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 60),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 80),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 90),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ReviewsRecord>>(
      stream: queryReviewsRecord(
        queryBuilder: (reviewsRecord) => reviewsRecord.where('propertyRef',
            isEqualTo: widget.propertyRef!.reference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<ReviewsRecord> propertyDetailsReviewsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 320,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: CachedNetworkImage(
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  widget.propertyRef!.mainImage,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/oowrriphtb4n/hero_home@3x.jpg',
                                                ),
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: valueOrDefault<String>(
                                                widget.propertyRef!.mainImage,
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/oowrriphtb4n/hero_home@3x.jpg',
                                              ),
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: valueOrDefault<String>(
                                          widget.propertyRef!.mainImage,
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/oowrriphtb4n/hero_home@3x.jpg',
                                        ),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: CachedNetworkImage(
                                            imageUrl: valueOrDefault<String>(
                                              widget.propertyRef!.mainImage,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/oowrriphtb4n/hero_home@3x.jpg',
                                            ),
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: Color(0x3A000000),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  buttonSize: 46,
                                                  icon: Icon(
                                                    Icons.arrow_back_rounded,
                                                    color: Colors.white,
                                                    size: 24,
                                                  ),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.propertyRef!.propertyName!,
                                style: FlutterFlowTheme.of(context).title1,
                              ).animated(
                                  [animationsMap['textOnPageLoadAnimation1']!]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.propertyRef!.propertyNeighborhood!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ).animated(
                                  [animationsMap['textOnPageLoadAnimation2']!]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PropertyReviewWidget(
                                  propertyRef: widget.propertyRef,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFA130),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  functions.ratingSummaryList(
                                      propertyDetailsReviewsRecordList
                                          .toList()),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Text(
                                  'Reviews',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ).animated([animationsMap['rowOnPageLoadAnimation1']!]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'DESCRIPTION',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animated([animationsMap['rowOnPageLoadAnimation2']!]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                child: Text(
                                  widget.propertyRef!.propertyDescription!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ).animated([
                                  animationsMap['textOnPageLoadAnimation3']!
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Amenities',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ).animated([animationsMap['rowOnPageLoadAnimation3']!]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
                        child: StreamBuilder<List<AmenititiesRecord>>(
                          stream: queryAmenititiesRecord(
                            queryBuilder: (amenititiesRecord) =>
                                amenititiesRecord.where('propertyRef',
                                    isEqualTo: widget.propertyRef!.reference),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<AmenititiesRecord>
                                amenitiesRowAmenititiesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final amenitiesRowAmenititiesRecord =
                                amenitiesRowAmenititiesRecordList.isNotEmpty
                                    ? amenitiesRowAmenititiesRecordList.first
                                    : null;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (amenitiesRowAmenititiesRecord!
                                          .evCharger ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.ev_station,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.pool ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.pool_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!
                                          .extraOutlets ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.power_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.ac ?? true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.ac_unit_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!
                                          .dogFriendly ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.pets_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.washer ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.local_laundry_service_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.dryer ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.local_laundry_service_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.workout ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.fitness_center_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!
                                          .nightLife ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.nightlife,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.hip ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.theater_comedy,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                  if (amenitiesRowAmenititiesRecord!.heater ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: AmenitityIndicatorWidget(
                                        icon: Icon(
                                          Icons.wb_sunny_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .grayIcon,
                                        ),
                                        background: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .lineGray,
                                      ),
                                    ),
                                ],
                              ),
                            ).animated(
                                [animationsMap['rowOnPageLoadAnimation4']!]);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 260,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'What people are saying',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: StreamBuilder<List<ReviewsRecord>>(
                                      stream: queryReviewsRecord(
                                        queryBuilder: (reviewsRecord) =>
                                            reviewsRecord
                                                .where('propertyRef',
                                                    isEqualTo: widget
                                                        .propertyRef!.reference)
                                                .orderBy('ratingCreated',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ReviewsRecord>
                                            pageViewReviewsRecordList =
                                            snapshot.data!;
                                        if (pageViewReviewsRecordList.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/noRatingsEmpty@2x.png',
                                              width: 300,
                                            ),
                                          );
                                        }
                                        return Container(
                                          width: double.infinity,
                                          height: 200,
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 30),
                                                child: PageView.builder(
                                                  controller: pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              0,
                                                              pageViewReviewsRecordList
                                                                      .length -
                                                                  1)),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      pageViewReviewsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, pageViewIndex) {
                                                    final pageViewReviewsRecord =
                                                        pageViewReviewsRecordList[
                                                            pageViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 12),
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 5,
                                                              color: Color(
                                                                  0x24090F13),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      12),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              StreamBuilder<
                                                                  UsersRecord>(
                                                                stream: UsersRecord
                                                                    .getDocument(
                                                                        pageViewReviewsRecord
                                                                            .userRef!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final rowUsersRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            rowUsersRecord.displayName!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).title3,
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                4,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                RatingBarIndicator(
                                                                              itemBuilder: (context, index) => Icon(
                                                                                Icons.star_rounded,
                                                                                color: Color(0xFFFFA130),
                                                                              ),
                                                                              direction: Axis.horizontal,
                                                                              rating: pageViewReviewsRecord.rating!,
                                                                              unratedColor: Color(0xFF95A1AC),
                                                                              itemCount: 5,
                                                                              itemSize: 24,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowUsersRecord.photoUrl,
                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-property-finder-834ebu/assets/9s7dlqs0q8jj/user_1.5@2x.jpg',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            24),
                                                                        child:
                                                                            AutoSizeText(
                                                                          pageViewReviewsRecord
                                                                              .ratingDescription!
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                130,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Lexend Deca',
                                                                                color: Color(0xFF8B97A2),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
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
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: SmoothPageIndicator(
                                                    controller: pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                pageViewReviewsRecordList
                                                                        .length -
                                                                    1)),
                                                    count:
                                                        pageViewReviewsRecordList
                                                            .length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) {
                                                      pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    effect: ExpandingDotsEffect(
                                                      expansionFactor: 2,
                                                      spacing: 8,
                                                      radius: 16,
                                                      dotWidth: 8,
                                                      dotHeight: 8,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .gunmetal,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x55000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '\$156',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  '+ taxes/fees',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF8B97A2),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'per night',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8B97A2),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      if (widget.propertyRef!.userRef != currentUserReference)
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookNowWidget(
                                  propertyDetails: widget.propertyRef,
                                ),
                              ),
                            );
                          },
                          text: 'Book Now',
                          options: FFButtonOptions(
                            width: 130,
                            height: 50,
                            color: Color(0xFF4B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
