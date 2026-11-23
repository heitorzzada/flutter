import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'diagramas_page_model.dart';
export 'diagramas_page_model.dart';

class DiagramasPageWidget extends StatefulWidget {
  const DiagramasPageWidget({super.key});

  static String routeName = 'diagramasPage';
  static String routePath = '/diagramasPage';

  @override
  State<DiagramasPageWidget> createState() => _DiagramasPageWidgetState();
}

class _DiagramasPageWidgetState extends State<DiagramasPageWidget> {
  late DiagramasPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiagramasPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF6D4BBC),
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24,
                ),
              ),
            ],
          ),
          title: Text(
            'Diagramas',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.openSansCondensed(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.bar_chart,
                color: Color(0xFF6F5ADB),
                size: 30,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Diagramas:',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.oswald(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 24,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1,
                        ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/ChatGPT_Image_4_de_mai._de_2026,_22_40_08.png',
                  width: 341.9,
                  height: 234.92,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Representa como o usuário interage com o aplicativo, podendo acessar as telas: inicial, equipe, objetivos e diagramas.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.oswald(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
              ),
              Divider(
                thickness: 2,
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/ChatGPT_Image_4_de_mai._de_2026,_22_42_51.png',
                  width: 363.5,
                  height: 242,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Mostra a estrutura do sistema, com as classes das telas e como elas se relacionam no funcionamento do aplicativo.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.oswald(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
              ),
              Divider(
                thickness: 2,
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              Container(
                width: 397.3,
                height: 66.2,
                decoration: BoxDecoration(
                  color: Color(0xFF6D4BBC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
