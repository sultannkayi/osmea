import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OSMEA Stepper Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Horizontal Stepper - Click any step to navigate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Notice: Completed steps show check icons and green color',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            OsmeaComponents.stepper(
              steps: [
                OsmeaStep(
                  label: 'Personal',
                  content: _buildStepContent(
                    'Enter your personal information',
                    Icons.person,
                  ),
                ),
                OsmeaStep(
                  label: 'Contact',
                  content: _buildStepContent(
                    'Provide your contact information',
                    Icons.contact_mail,
                  ),
                ),
                OsmeaStep(
                  label: 'Review',
                  content: _buildStepContent(
                    'Review and submit your information',
                    Icons.check_circle,
                  ),
                ),
              ],
              orientation: ComponentOrientation.horizontal,
              allowStepTapping: true,
              stepperStyle: StepperStyle.numberedWithLinesAndLabels,
              size: ComponentSize.medium,
              appearance: ComponentAppearance.filled,
              onStepChanged: (step) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Step changed to: $step')),
                );
              },
            ),
            const SizedBox(height: 40),
            const Text(
              'Restricted Stepper - No Step Clicking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OsmeaComponents.stepper(
              steps: [
                OsmeaStep(
                  label: 'Step 1',
                  content: _buildStepContent(
                    'First step - cannot click other steps',
                    Icons.looks_one,
                  ),
                ),
                OsmeaStep(
                  label: 'Step 2',
                  content: _buildStepContent(
                    'Second step - sequential only',
                    Icons.looks_two,
                  ),
                ),
                OsmeaStep(
                  label: 'Step 3',
                  content: _buildStepContent(
                    'Third step - linear progression',
                    Icons.looks_3,
                  ),
                ),
              ],
              orientation: ComponentOrientation.horizontal,
              allowStepTapping: false, // Disable free step navigation
              size: ComponentSize.medium,
              appearance: ComponentAppearance.ghost,
            ),
            const SizedBox(height: 40),
            const Text(
              'Vertical Stepper',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: OsmeaComponents.stepper(
                steps: [
                  OsmeaStep(
                    label: 'Setup',
                    content: _buildStepContent(
                      'Initialize your account',
                      Icons.settings,
                    ),
                  ),
                  OsmeaStep(
                    label: 'Configure',
                    content: _buildStepContent(
                      'Configure your preferences',
                      Icons.tune,
                    ),
                  ),
                  OsmeaStep(
                    label: 'Complete',
                    content: _buildStepContent(
                      'Finalize setup',
                      Icons.done,
                    ),
                  ),
                ],
                orientation: ComponentOrientation.vertical,
                size: ComponentSize.small,
                appearance: ComponentAppearance.outlined,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Dots with Lines Style',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OsmeaComponents.stepper(
              steps: [
                OsmeaStep(
                  label: 'Start',
                  content: _buildStepContent(
                    'Begin your journey with dots and lines',
                    Icons.start,
                  ),
                ),
                OsmeaStep(
                  label: 'Process',
                  content: _buildStepContent(
                    'Continue with dot-style progression',
                    Icons.trending_up,
                  ),
                ),
                OsmeaStep(
                  label: 'Finish',
                  content: _buildStepContent(
                    'Complete with check mark',
                    Icons.flag,
                  ),
                ),
              ],
              stepperStyle: StepperStyle.dotsWithLinesAndLabels,
              allowStepTapping: true,
            ),
            const SizedBox(height: 40),
            const Text(
              'Numbered Only Style',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OsmeaComponents.stepper(
              steps: [
                OsmeaStep(
                  label: 'First',
                  content: _buildStepContent(
                    'Simple numbered steps without lines',
                    Icons.filter_1,
                  ),
                ),
                OsmeaStep(
                  label: 'Second',
                  content: _buildStepContent(
                    'Clean numbered design',
                    Icons.filter_2,
                  ),
                ),
                OsmeaStep(
                  label: 'Third',
                  content: _buildStepContent(
                    'Minimalist approach',
                    Icons.filter_3,
                  ),
                ),
              ],
              stepperStyle: StepperStyle.numberedOnly,
              allowStepTapping: true,
            ),
            const SizedBox(height: 40),
            const Text(
              'Dots with Lines Only (No Labels)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            OsmeaComponents.stepper(
              steps: [
                OsmeaStep(
                  label: 'Hidden',
                  content: _buildStepContent(
                    'Compact dot design with connecting lines',
                    Icons.circle,
                  ),
                ),
                OsmeaStep(
                  label: 'Hidden',
                  content: _buildStepContent(
                    'Space-efficient progression',
                    Icons.circle_outlined,
                  ),
                ),
                OsmeaStep(
                  label: 'Hidden',
                  content: _buildStepContent(
                    'Clean line completion',
                    Icons.check_circle,
                  ),
                ),
              ],
              stepperStyle: StepperStyle.dotsWithLines,
              allowStepTapping: true,
            ),
            const SizedBox(height: 40),
            const Text(
              'OSMEA Colors Demo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Shows OSMEA Colors used in stepper states',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorDemo(
                    'Success', OsmeaColors.forestHeart, Icons.check),
                _buildColorDemo('Error', OsmeaColors.sunsetGlow, Icons.error),
                _buildColorDemo(
                    'Warning', OsmeaColors.goldenHour, Icons.warning),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Icon(icon, size: 48, color: Colors.blue),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget _buildColorDemo(String label, Color color, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
