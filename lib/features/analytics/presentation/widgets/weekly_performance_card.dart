import 'package:flutter/material.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import 'insight_card.dart';

class WeeklyPerformanceCard extends StatelessWidget {
  final List<double> weeklyPerformance;

  const WeeklyPerformanceCard({super.key, required this.weeklyPerformance});

  @override
  Widget build(BuildContext context) {
    return InsightCard(
      title: 'Weekly Performance',
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: _buildBars(),
        ),
      ),
    );
  }

  List<Widget> _buildBars() {
    final days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    List<Widget> bars = [];

    for (int i = 0; i < 7; i++) {
      double heightFactor =
          weeklyPerformance.isNotEmpty && weeklyPerformance.length > i
          ? weeklyPerformance[i]
          : 0.0;

      // Minimal height for aesthetics
      heightFactor = heightFactor.clamp(0.1, 1.0);

      bars.add(
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: constraints.maxHeight * heightFactor,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryFixedDim,
                        border: Border.all(color: AppColors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryFixedDim.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                days[i],
                style: AppTypography.labelMono.copyWith(fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }
    return bars;
  }
}
