import 'package:flutter/material.dart';

abstract class DiagnosisState {}

class DiagnosisInitial extends DiagnosisState {}

class DiagnosisScanning extends DiagnosisState {
  final int currentStep;
  final String stepName;
  final int progress;
  final int remainingSeconds;

  DiagnosisScanning({
    required this.currentStep,
    required this.stepName,
    required this.progress,
    required this.remainingSeconds,
  });
}

class DiagnosisCompleted extends DiagnosisState {
  final int score;
  final List<DiagnosisFinding> findings;

  DiagnosisCompleted({required this.score, required this.findings});
}

class DiagnosisFinding {
  final String severity;
  final String title;
  final String description;
  final int confidence;
  final Color color;

  DiagnosisFinding({
    required this.severity,
    required this.title,
    required this.description,
    required this.confidence,
    required this.color,
  });
}
