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
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'OSMEA Stepper Example',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: OsmeaComponents.singleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OsmeaComponents.text(
              'Horizontal Stepper - Click any step to navigate',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'Notice: Completed steps show check icons and green color',
              fontSize: 14,
              color: OsmeaColors.silver,
            ),
            OsmeaComponents.sizedBox(height: 16),
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
                  SnackBar(content: OsmeaComponents.text('Step changed to: $step')),
                );
              },
            ),
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'Restricted Stepper - No Step Clicking',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),
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
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'Vertical Stepper',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.sizedBox(
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
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'Dots with Lines Style',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),
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
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'Numbered Only Style',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),
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
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'Dots with Lines Only (No Labels)',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 16),
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
            OsmeaComponents.sizedBox(height: 40),
            OsmeaComponents.text(
              'OSMEA Colors Demo',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            OsmeaComponents.sizedBox(height: 8),
            OsmeaComponents.text(
              'Shows OSMEA Colors used in stepper states',
              fontSize: 14,
              color: OsmeaColors.silver,
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.row(
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
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: OsmeaColors.snow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: OsmeaColors.silver),
      ),
      child: OsmeaComponents.column(
        children: [
          Icon(icon, size: 48, color: OsmeaColors.nordicBlue),
          OsmeaComponents.sizedBox(height: 12),
          OsmeaComponents.text(
            description,
            textAlign: TextAlign.center,
            fontSize: 16,
          ),
          OsmeaComponents.sizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: OsmeaComponents.text('Continue'),
          ),
        ],
      ),
    );
  }

  Widget _buildColorDemo(String label, Color color, IconData icon) {
    return OsmeaComponents.column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 24,
          child: Icon(icon, color: OsmeaColors.white, size: 20),
        ),
        OsmeaComponents.sizedBox(height: 8),
        OsmeaComponents.text(
          label,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
