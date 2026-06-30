import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'diagnosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  DiagnosisCubit() : super(DiagnosisInitial());

  final List<String> steps = [
    'Membaca DTC Code',
    'Membaca Sensor Data',
    'Menganalisis Pola Data',
    'Membuat Laporan',
  ];

  Timer? _timer;

  void startScanning() {
    int currentProgress = 0;
    int totalDurationSeconds = 15;

    emit(DiagnosisScanning(
      currentStep: 0,
      stepName: steps[0],
      progress: 0,
      remainingSeconds: totalDurationSeconds,
    ));

    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      currentProgress++;
      int remainingSeconds = totalDurationSeconds - (currentProgress * 150) ~/ 1000;
      
      if (currentProgress >= 100) {
        timer.cancel();
        _finishScanning();
        return;
      }

      int newStep = currentProgress ~/ 25;
      if (newStep > 3) newStep = 3;
      
      emit(DiagnosisScanning(
        currentStep: newStep,
        stepName: steps[newStep],
        progress: currentProgress,
        remainingSeconds: remainingSeconds > 0 ? remainingSeconds : 0,
      ));
    });
  }

  void _finishScanning() {
    emit(DiagnosisCompleted(
      score: 78,
      findings: [
        DiagnosisFinding(
          severity: 'KRITIS',
          title: 'Suhu Mesin Tinggi',
          description: 'Suhu coolant mencapai 108°C. Kemungkinan termostat macet atau level coolant rendah.',
          confidence: 92,
          color: const Color(0xFFE91E63), // Pink/Red
        ),
        DiagnosisFinding(
          severity: 'PERINGATAN',
          title: 'Kampas Rem Depan Aus',
          description: 'Sisa ketebalan kampas rem depan tersisa 35%. Perlu penggantian dalam 2 minggu.',
          confidence: 87,
          color: const Color(0xFFFFC107), // Amber
        ),
        DiagnosisFinding(
          severity: 'INFO',
          title: 'Filter Udara Perlu Diganti',
          description: 'Berdasarkan jarak tempuh, filter udara sudah mendekati interval penggantian.',
          confidence: 0,
          color: const Color(0xFF2196F3), // Blue
        ),
      ],
    ));
  }

  void cancelScanning() {
    _timer?.cancel();
    emit(DiagnosisInitial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
