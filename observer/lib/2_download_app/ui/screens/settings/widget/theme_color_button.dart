import 'package:flutter/material.dart';
import '../../../providers/theme_color_provider.dart';
import '../../../theme/theme.dart';

class ThemeService extends ChangeNotifier {
  ThemeColor _current = ThemeColor.blue;

  ThemeColor get current => _current;

  void setTheme(ThemeColor newColor) {
    _current = newColor;
    notifyListeners();
  }
}

final theme = ThemeService();

class ThemeColorButton extends StatelessWidget {
  const ThemeColorButton({
    super.key,
    required this.themeColor,
    required this.isSelected,
  });

  final ThemeColor themeColor;
  final bool isSelected;

  BoxBorder? get border =>
      isSelected ? Border.all(color: AppColors.neutral, width: 6) : null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () => theme.setTheme(themeColor),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: themeColor.color,
            borderRadius: BorderRadius.circular(20),
            border: border,
          ),
        ),
      ),
    );
  }
}
