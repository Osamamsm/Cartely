import 'package:flutter/material.dart';

class VariationOption {
  final String variationEn;
  final String variationAr;
  final String optionEn;
  final String optionAr;
  final String? hexCode;

  const VariationOption({
    required this.variationEn,
    required this.variationAr,
    required this.optionEn,
    required this.optionAr,
    this.hexCode,
  });

  factory VariationOption.fromJson(Map<String, dynamic> j) => VariationOption(
    variationEn: j['variation_en'],
    variationAr: j['variation_ar'],
    optionEn: j['option_en'],
    optionAr: j['option_ar'],
    hexCode: j['hex_code'],
  );

  bool _isArabic(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'ar';

  String localizedVariation(BuildContext context) =>
      _isArabic(context) ? variationAr : variationEn;

  String localizedOption(BuildContext context) =>
      _isArabic(context) ? optionAr : optionEn;
}
