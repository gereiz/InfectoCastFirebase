import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/firebase_auth/auth_util.dart';

String? virgulaPorPonto(String entradaValor) {
  // Create a function that receives a srtnig from an input and replaces a comma with a period
  String input = entradaValor;
  String output = input.replaceAll(',', '.');
  return output;
}

String? setHtmlWithFiraSans(String? htmlContent) {
  // Adiciona a fonte Fira Sans Extra Condensed ao estilo inline do HTML
  String styledHtml = '''
    <html>
      <head>
        <link href="https://fonts.googleapis.com/css2?family=Fira+Sans+Extra+Condensed:wght@400;500&display=swap" rel="stylesheet">
        <style>
          body {
            font-family: 'Fira Sans Extra Condensed', sans-serif;
            overflow: auto;
          }
          .scrollable {
            // word-wrap: break-word; 
            // white-space: normal;

          }
          body::-webkit-scrollbar { 
            display: none;
          }
        </style>
      </head>
      <body style="">
        <div class="scrollable">
          $htmlContent
        </div>
      </body>
    </html>
  ''';

  return styledHtml;
}

double? fibrosis4(
  int idade,
  double ast,
  double alt,
  double plaquetas,
) {
  return (idade * ast) / (plaquetas * math.sqrt(alt));
}

double? equationsforGlomerularFiltration(
  int idade,
  String sexo,
  double src,
  double a,
  double b,
) {
  if (sexo == 'Feminino') {
    if (src <= 0.7) {
      a = 0.7;
      b = -0.241;
    } else {
      a = 0.7;
      b = -1.2;
    }
  } else if (sexo == 'Masculino') {
    if (src <= 0.9) {
      a = 0.9;
      b = -0.302;
    } else {
      a = 0.9;
      b = -1.2;
    }
  }

  double divisao = src / a;

  double raiz = math.pow(divisao, b) as double;

  if (sexo == 'Masculino') {
    return 142 * raiz * (0.9938 * idade);
  } else {
    return 142 * raiz * (1.012 * idade);
  }
}
