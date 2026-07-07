import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vechicare_app/core/routes/app_router.dart';
import 'package:vechicare_app/core/theme/app_colors.dart';
import 'package:vechicare_app/core/theme/app_sizes.dart';
import 'package:vechicare_app/core/theme/app_typography.dart';

import '../../../core/di/injection.dart';
import '../cubit/bengkel_cubit.dart';
import '../cubit/bengkel_state.dart';
import 'widgets/bengkel_card.dart';

@RoutePage()
class BengkelListScreen extends StatelessWidget implements AutoRouteWrapper {
  const BengkelListScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BengkelCubit>()..fetchBengkels(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Bengkel Mitra',
          style: AppTypography.headingMedium.copyWith(
            color: AppColors.textDark,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => context.router.back(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSizes.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  context.read<BengkelCubit>().search(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
                  hintText: 'Cari bengkel...',
                  hintStyle: AppTypography.bodyRegular.copyWith(
                    color: AppColors.textMuted,
                  ),
                  filled: true,
                  fillColor: AppColors.scaffoldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<BengkelCubit, BengkelState>(
                  builder: (context, state) {
                    if (state is BengkelLoading || state is BengkelInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    }

                    if (state is BengkelError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: AppTypography.bodyRegular.copyWith(
                            color: AppColors.alert,
                          ),
                        ),
                      );
                    }

                    if (state is BengkelLoaded) {
                      final bengkels = state.filteredBengkels;

                      if (bengkels.isEmpty) {
                        return Center(
                          child: Text(
                            'Bengkel tidak ditemukan',
                            style: AppTypography.bodyRegular.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: bengkels.length,
                        itemBuilder: (context, index) {
                          final bengkel = bengkels[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: BengkelCard(
                              bengkel: bengkel,
                              onTap: () {
                                context.router.push(
                                  BengkelDetailRoute(bengkel: bengkel),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
