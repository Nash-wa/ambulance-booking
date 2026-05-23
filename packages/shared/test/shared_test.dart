import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared/shared.dart';

void main() {
  test('AppColors verification', () {
    expect(AppColors.emergencyRed, const Color(0xFFE53935));
  });
}
