/*
 * WelcomeAppBarWidget
 * -------------------
 * AppBar widget for welcome view using coreAppBar pattern
 */

import 'package:admin_dashboard/core/resources/resources.g.dart';
import 'package:admin_dashboard/app/views/view_welcome/models/welcome_view_model.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:admin_dashboard/gen/assets.gen.dart';

/// Returns a coreAppBar for the welcome view
AppBar welcomeCoreAppBar(
  BuildContext context, [
  WelcomeViewModel? viewModel,
  Map<String, dynamic>? arguments,
]) {
  // Check dev mode from arguments
  final isDev = arguments?["isDev"] as bool? ?? false;

  return AppBar(
    title: OsmeaComponents.row(
      mainAxisAlignment: context.spaceBetween,
      children: [
        OsmeaComponents.image(
          assetPath: Assets.images.osmeaLogoBlack.path,
          size: ImageSize.small,
          fit: BoxFit.contain,
        ),
        OsmeaComponents.text(
          resource.views.welcome.manage_your_store,
          textStyle: OsmeaTextStyle.titleSmall(context),
        ),
      ],
    ),
    actions:
        isDev
            ? [
              OsmeaComponents.iconButton(
                icon: const Icon(Icons.refresh, color: OsmeaColors.orange),
                tooltip: resource.common.refresh,
                onPressed: () async {
                  await viewModel?.resetOnboardingForDev(context);
                },
              ),
            ]
            : null,
  );
}
