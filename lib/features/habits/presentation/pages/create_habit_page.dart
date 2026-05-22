import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/design_system/app_colors.dart';
import '../../../../shared/design_system/app_typography.dart';
import '../../../../shared/widgets/brutal_button.dart';
import '../viewmodels/create_habit_viewmodel.dart';
import '../widgets/create_habit_name_input.dart';
import '../widgets/create_habit_icon_selector.dart';
import '../widgets/create_habit_frequency_selector.dart';
import '../widgets/create_habit_reminder_selector.dart';
import '../widgets/create_habit_notes_input.dart';

class CreateHabitPage extends ConsumerStatefulWidget {
  const CreateHabitPage({super.key});

  @override
  ConsumerState<CreateHabitPage> createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends ConsumerState<CreateHabitPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  int _selectedIconCodePoint = Icons.fitness_center.codePoint;
  bool _isReminderEnabled = false;
  TimeOfDay? _reminderTime;

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a habit name')),
      );
      return;
    }

    ref.read(createHabitViewModelProvider.notifier).submitHabit(
          _nameController.text.trim(),
          _selectedIconCodePoint,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createHabitViewModelProvider);

    // Listen for success
    ref.listen(createHabitViewModelProvider, (previous, next) {
      if (next.isSuccess && !(previous?.isSuccess ?? false)) {
        Navigator.of(context).pop();
      }
      if (next.errorMessage != null && next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'NEW HABIT',
          style: AppTypography.headlineMd.copyWith(
            color: AppColors.white,
            fontSize: 20,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CreateHabitNameInput(controller: _nameController),
              const SizedBox(height: 32),
              CreateHabitIconSelector(
                selectedIconCodePoint: _selectedIconCodePoint,
                onIconSelected: (codePoint) {
                  setState(() {
                    _selectedIconCodePoint = codePoint;
                  });
                },
              ),
              const SizedBox(height: 32),
              CreateHabitFrequencySelector(
                frequency: state.frequency,
                onFrequencyChanged: (freq) {
                  ref.read(createHabitViewModelProvider.notifier).updateFrequency(freq);
                },
                selectedDays: state.selectedWeekDays,
                onDayToggled: (day) {
                  ref.read(createHabitViewModelProvider.notifier).toggleWeekDay(day);
                },
              ),
              const SizedBox(height: 32),
              CreateHabitReminderSelector(
                isReminderEnabled: _isReminderEnabled,
                onReminderToggled: (val) {
                  setState(() {
                    _isReminderEnabled = val;
                  });
                },
                reminderTime: _reminderTime,
                onTimeTapped: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    setState(() {
                      _reminderTime = time;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              CreateHabitNotesInput(controller: _notesController),
              const SizedBox(height: 48),
              if (state.isSubmitting)
                const Center(child: CircularProgressIndicator(color: AppColors.neonYellow))
              else
                BrutalButton(
                  text: 'SAVE HABIT ✓',
                  backgroundColor: AppColors.black,
                  textColor: AppColors.white,
                  borderColor: AppColors.white,
                  onPressed: _submit,
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
