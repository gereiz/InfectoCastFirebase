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
  double total = (idade * ast) / (plaquetas * math.sqrt(alt));

  return total;
}

double? equationsforGlomerularFiltration(
  int idade,
  String sexo,
  double src,
  String? tipo,
  double scys,
  String etnia,
) {
  if (tipo == "Creatinina CKD-EPI 2021") {
    double a;
    double b;
    if (sexo == 'Feminino') {
      a = 0.7;
      b = (src <= 0.7) ? -0.241 : -1.2;
    } else {
      a = 0.9;
      b = (src <= 0.9) ? -0.302 : -1.2;
    }

    double fatorSexo = (sexo == 'Feminino') ? 1.012 : 1.0;

    double divisao = src / a;
    double potencia = math.pow(divisao, b) as double;

    double eGFR = 142 * potencia * math.pow(0.9938, idade) * fatorSexo;

    return eGFR;
  } else if (tipo == "2021 CKD-EPI Creatinina-Cistatina C") {
    double a, b, c, d;
    double fatorSexo = (sexo == 'Feminino') ? 0.963 : 1.0;

    if (sexo == 'Feminino') {
      a = 0.7;
      c = 0.8;
      if (src <= 0.7) {
        b = -0.219;
      } else {
        b = -0.544;
      }
      if (scys <= 0.8) {
        d = -0.323;
      } else {
        d = -0.778;
      }
    } else {
      a = 0.9;
      c = 0.8;
      if (src <= 0.9) {
        b = -0.144;
      } else {
        b = -0.544;
      }
      if (scys <= 0.8) {
        d = -0.323;
      } else {
        d = -0.778;
      }
    }

    double eGFR = 135 *
        math.pow(src / a, b) *
        math.pow(scys / c, d) *
        math.pow(0.9961, idade) *
        fatorSexo;

    return eGFR;
  } else if (tipo == "Creatinina CKD-EPI 2009") {
    double a, b, c;
    double fatorEtnia = (etnia == "Negro") ? 1.159 : 1.0;

    if (sexo == 'Feminino') {
      a = 144;
      b = 0.7;
      c = (src <= 0.7) ? -0.329 : -1.209;
    } else {
      a = 141;
      b = 0.9;
      c = (src <= 0.9) ? -0.411 : -1.209;
    }

    double eGFR =
        a * math.pow(src / b, c) * math.pow(0.993, idade) * fatorEtnia;
    return eGFR;
  } else if (tipo == "2012 CKD-EPI Cistatina C") {
    double a, b;
    b = (sexo == 'Feminino') ? 0.932 : 1.0;
    a = (scys <= 0.8) ? -0.499 : -1.328;

    double eGFR = 133 * math.pow(scys / 0.8, a) * math.pow(0.996, idade) * b;
    return eGFR;
  } else if (tipo == "2012 CKD-EPI Creatinina–Cistatina C") {
    double a, b, c, d;
    double fatorEtnia = (etnia == "Negro") ? 1.08 : 1.0;

    if (sexo == 'Feminino') {
      a = 130;
      b = 0.7;
      c = (src <= 0.7) ? -0.248 : -0.601;
      d = (scys <= 0.8) ? -0.375 : -0.711;
    } else {
      a = 135;
      b = 0.9;
      c = (src <= 0.9) ? -0.207 : -0.601;
      d = (scys <= 0.8) ? -0.375 : -0.711;
    }

    double eGFR = a *
        math.pow(src / b, c) *
        math.pow(scys / 0.8, d) *
        math.pow(0.995, idade) *
        fatorEtnia;
    return eGFR;
  } else {
    return 0.00;
  }
}

String? calculoSofaTotal(
  int resultPao2Fio2,
  int sofa1,
  int sofa2,
  int sofa3,
  int sofa4,
  int sofa5,
) {
  int total = resultPao2Fio2 + sofa1 + sofa2 + sofa3 + sofa4 + sofa5;

  if (total >= 0 && total <= 1) {
    return 'SOFA Score inicial ≤ 1 previsão de mortalidade ≤ 0,0%';
  } else if (total >= 2 && total <= 3) {
    return 'SOFA Score inicial ≤ 3 previsão de mortalidade ≤ 6,4%';
  } else if (total >= 4 && total <= 5) {
    return 'SOFA Score inicial ≤ 5 previsão de mortalidade ≤ 20,2%';
  } else if (total >= 6 && total <= 7) {
    return 'SOFA Score inicial ≤ 7 previsão de mortalidade ≤ 21,5%';
  } else if (total >= 8 && total <= 9) {
    return 'SOFA Score inicial ≤ 9 previsão de mortalidade ≤ 33,3%';
  } else if (total >= 10 && total <= 11) {
    return 'SOFA Score inicial ≤ 11 previsão de mortalidade ≤ 50%';
  } else if (total >= 12 && total <= 14) {
    return 'SOFA Score inicial ≤ 14 previsão de mortalidade ≤ 95,2%';
  } else if (total > 14) {
    return 'SOFA Score inicial > 14 previsão de mortalidade ≤ 95,2%';
  }
}

String? totalFibrosis(
  int idade,
  double ast,
  double alt,
  double plaquetas,
) {
  double total = (idade * ast) / (plaquetas * math.sqrt(alt));

  if (total < 1.45) {
    return 'Fibrose avançada excluída. Estágio aproximado de fibrose: Ishak 0-1';
  } else if (total >= 1.45 && total <= 3.25) {
    return 'Investigação adicional necessária. Estágio aproximado de fibrose: Ishak 2-3.';
  } else if (total > 3.25) {
    return 'Fibrose avançada (estágio METAVIR F3-F4) provável (McPherson 2017). Estágio aproximado de fibrose: Ishak 4-6 ';
  }
}

double? calculateMELDNa(
  double creatinine,
  double bilirubin,
  double inr,
  double sodium,
  bool dialysis,
) {
  // Aplicar as regras para os valores de entrada
  creatinine = (creatinine < 1.0) ? 1.0 : creatinine;
  bilirubin = (bilirubin < 1.0) ? 1.0 : bilirubin;
  inr = (inr < 1.0) ? 1.0 : inr;

  if (creatinine > 4.0 || dialysis) {
    creatinine = 4.0;
  }

  if (sodium < 125) {
    sodium = 125;
  } else if (sodium > 137) {
    sodium = 137;
  }

  // Cálculo inicial do MELD(i)
  double meldI = 0.957 * math.log(creatinine) +
      0.378 * math.log(bilirubin) +
      1.120 * math.log(inr) +
      0.643;
  meldI = (meldI * 10).roundToDouble() /
      10.0 *
      10; // Arredondar e multiplicar por 10

  double meld = meldI;

  // Aplicar a correção de sódio se MELD(i) > 11
  if (meldI > 11) {
    meld = meldI + 1.32 * (137 - sodium) - (0.033 * meldI * (137 - sodium));
  }

  // Garantir que o MELD não ultrapasse 40
  return meld.clamp(6.0, 40.0).roundToDouble();
}

String calcularSepsis(
  List<bool> respostas,
  bool infeccaoSuspeita,
  bool acidoseLactica,
  bool hipotensao,
  bool falenciaOrgans,
) {
  int sirsCount = respostas.where((r) => r).length;

  if (sirsCount < 2) {
    return "Este paciente não atende aos critérios de SIRS. Para outras causas de choque, veja a seção Próximas etapas.";
  } else if (sirsCount >= 2 && infeccaoSuspeita == true) {
    return "Este paciente atende aos critérios de sepse. Siga suas diretrizes para sepse, que normalmente incluem ressuscitação agressiva de fluidos, antibióticos precoces de amplo espectro, consulta na UTI, avaliação de PVC e, ocasionalmente, pressores e transfusão.";
  } else if (sirsCount >= 2 && acidoseLactica == true) {
    return "Este paciente atende aos critérios de sepse grave.";
  } else if (sirsCount >= 2 && hipotensao == true) {
    return "Este paciente atende aos critérios de choque séptico.";
  } else if (sirsCount >= 2 && falenciaOrgans == true) {
    return "Este paciente apresenta síndrome de disfunção de múltiplos órgãos.";
  } else {
    return "Este paciente atende aos critérios de SIRS.";
  }
}
