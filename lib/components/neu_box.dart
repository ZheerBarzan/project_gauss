import 'package:flutter/material.dart';
import 'package:project_gauss/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black : Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            BoxShadow(
              color: isDark ? Colors.grey.shade700 : Colors.white,
              blurRadius: 15,
              offset: const Offset(-5, -5),
            ),
          ]),
      child: child,
    );
  }
}
