import 'package:flutter/material.dart';

import 'widgets/volume_shooter.dart';

class VolumeShooterView extends StatefulWidget {
  const VolumeShooterView({super.key});

  @override
  State<VolumeShooterView> createState() => _VolumeShooterViewState();
}

class _VolumeShooterViewState extends State<VolumeShooterView> {
  var _volume = 0;

  void _onVolumeChanged(double volume) => setState(
        () => _volume = volume.toInt(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VolumeShooter(
                iconColor: Colors.grey[300]!,
                iconHoverColor: Colors.grey[350]!,
                sliderColor: Colors.grey[300]!,
                sliderThumbColor: Colors.deepPurple[300]!,
                onVolumeChanged: _onVolumeChanged,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Volume: $_volume%',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
