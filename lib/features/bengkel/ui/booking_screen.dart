import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

import '../../../data/models/bengkel_model.dart';

@RoutePage()
class BookingScreen extends StatefulWidget {
  final BengkelModel bengkel;

  const BookingScreen({
    super.key,
    required this.bengkel,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<String> _services = [
    'Ganti Oli',
    'Tune-up',
    'Servis AC',
    'Ganti Rem',
  ];

  final List<String> _times = [
    '09:00',
    '10:00',
    '13:00',
    '14:00',
    '15:00',
  ];

  final List<String> _selectedServices = [];
  DateTime? _selectedDate;
  String? _selectedTime;
  int _currentStep = 0;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.primary,
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  bool _isStepValid() {
    switch (_currentStep) {
      case 0:
        return _selectedServices.isNotEmpty;
      case 1:
        return _selectedDate != null && _selectedTime != null;
      default:
        return true;
    }
  }

  void _onContinue() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      _confirmBooking();
    }
  }

  void _confirmBooking() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Booking Berhasil'),
          content: Text(
            'Layanan telah dipesan di ${widget.bengkel.name}. Kami akan mengirim konfirmasi melalui aplikasi.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.router.pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => context.router.back(),
        ),
        title: Text(
          'Booking',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textDark,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSizes.pagePadding,
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _currentStep,
            onStepContinue: _isStepValid() ? _onContinue : null,
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: details.onStepContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBackgroundColor:
                              AppColors.primary.withAlpha(102),
                        ),
                        child: Text(
                          _currentStep == 2 ? 'Konfirmasi' : 'Selanjutnya',
                          style: AppTypography.buttonText.copyWith(
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                    if (_currentStep > 0) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: details.onStepCancel,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(color: AppColors.primary),
                          ),
                          child: const Text('Kembali'),
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
            steps: [
              Step(
                title: const Text('Layanan'),
                isActive: _currentStep >= 0,
                state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                content: _buildServiceStep(),
              ),
              Step(
                title: const Text('Jadwal'),
                isActive: _currentStep >= 1,
                state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                content: _buildScheduleStep(),
              ),
              Step(
                title: const Text('Konfirmasi'),
                isActive: _currentStep >= 2,
                state: StepState.indexed,
                content: _buildConfirmationStep(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih layanan yang dibutuhkan:',
          style: AppTypography.bodyRegular.copyWith(
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        ..._services.map((service) {
          final isSelected = _selectedServices.contains(service);
          return CheckboxListTile(
            value: isSelected,
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _selectedServices.add(service);
                } else {
                  _selectedServices.remove(service);
                }
              });
            },
            title: Text(
              service,
              style: AppTypography.bodyRegular.copyWith(
                color: AppColors.textDark,
              ),
            ),
            activeColor: AppColors.primary,
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          );
        }),
      ],
    );
  }

  Widget _buildScheduleStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih tanggal:',
          style: AppTypography.bodyRegular.copyWith(
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickDate,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryAccent),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  _selectedDate == null
                      ? 'Pilih tanggal'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: AppTypography.bodyRegular.copyWith(
                    color: _selectedDate == null
                        ? AppColors.textMuted
                        : AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Pilih jam:',
          style: AppTypography.bodyRegular.copyWith(
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _times.map((time) {
            final isSelected = _selectedTime == time;
            return ChoiceChip(
              label: Text(time),
              selected: isSelected,
              onSelected: (value) {
                setState(() {
                  _selectedTime = time;
                });
              },
              selectedColor: AppColors.primary,
              backgroundColor: AppColors.scaffoldBackground,
              labelStyle: AppTypography.bodyRegular.copyWith(
                color: isSelected ? AppColors.textLight : AppColors.textDark,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : AppColors.primaryAccent,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConfirmationStep() {
    final dateText = _selectedDate == null
        ? '-'
        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan Booking',
          style: AppTypography.headingSmall.copyWith(
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 16),
        _SummaryTile(label: 'Bengkel', value: widget.bengkel.name),
        const SizedBox(height: 12),
        _SummaryTile(
          label: 'Layanan',
          value: _selectedServices.join(', '),
        ),
        const SizedBox(height: 12),
        _SummaryTile(label: 'Tanggal', value: dateText),
        const SizedBox(height: 12),
        _SummaryTile(label: 'Jam', value: _selectedTime ?? '-'),
      ],
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTypography.bodyRegular.copyWith(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
