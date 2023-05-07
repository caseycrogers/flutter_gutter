import 'package:flutter/material.dart';

import 'package:gutter/gutter.dart';

/// A gap twice the standard gutter size according to Material Design's
/// breakpoints system.
class GutterLarge extends StatelessWidget {
  const GutterLarge({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterLarge);
}

/// A gap of the standard gutter size according to Material Design's breakpoints
/// system.
class Gutter extends StatelessWidget {
  const Gutter({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutter);
}

/// A gap half the standard gutter size according to Material Design's
/// breakpoints system
class GutterSmall extends StatelessWidget {
  const GutterSmall({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterSmall);
}

/// A gap a quarter the standard gutter size according to Material Design's
/// breakpoints system
class GutterTiny extends StatelessWidget {
  const GutterTiny({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.gutterTiny);
}

/// A gap of the standard margin size according to Material Design's breakpoints
/// system
class Margin extends StatelessWidget {
  const Margin({super.key});

  @override
  Widget build(BuildContext context) => Gap(size: context.margin);
}
