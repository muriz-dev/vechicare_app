import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/features/diagnosing/cubit/diagnosis_cubit.dart';
import 'package:vechicare_app/features/diagnosing/cubit/diagnosis_state.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/cancel_scanning_button.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/scanning_gauge.dart';
import 'package:vechicare_app/features/diagnosing/ui/widgets/scanning_steps_list.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

@RoutePage()
class ScanningPage extends StatelessWidget {
  const ScanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiagnosisCubit()..startScanning(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<DiagnosisCubit, DiagnosisState>(
            listener: (context, state) {
              if (state is DiagnosisCompleted) {
                // Pass the findings and score to the result page via route (we will use a singleton or pass arguments if needed, but here we can just use the state if we put the cubit higher, or we can just pass the state to the route).
                // For simplicity, passing arguments to the route:
                context.router.replace(
                  DiagnosisResultRoute(
                    score: state.score,
                    findings: state.findings,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is DiagnosisScanning) {
                return _buildScanningUI(context, state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScanningUI(BuildContext context, DiagnosisScanning state) {
    final steps = context.read<DiagnosisCubit>().steps;

    return Padding(
      padding: AppSizes.pagePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          ScanningGauge(progress: state.progress, stepName: state.stepName),
          const SizedBox(height: 48),
          ScanningStepsList(steps: steps, currentStep: state.currentStep),
          const Spacer(),
          Text(
            'Estimasi: ${state.remainingSeconds} detik lagi',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          CancelScanningButton(
            onPressed: () {
              context.read<DiagnosisCubit>().cancelScanning();
              context.router.back();
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
