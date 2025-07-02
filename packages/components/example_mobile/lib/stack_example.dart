import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('OSMEA Stack Examples'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Basic Stack'),
            _buildBasicStackExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Styled Stack'),
            _buildStyledStackExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Interactive Stack'),
            _buildInteractiveStackExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Positioned Children'),
            _buildPositionedChildrenExamples(),
            OsmeaComponents.sizedBox(height: 32),
            _buildSectionTitle('Practical Examples'),
            _buildPracticalExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OsmeaComponents.text(
        title,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBasicStackExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Simple Stack with Default Alignment',
          _buildContainer(
            OsmeaComponents.stack(
              children: [
                _buildColoredBox(color: Colors.red, size: 150),
                _buildColoredBox(
                    color: Colors.green.withOpacity(0.7), size: 120),
                _buildColoredBox(color: Colors.blue.withOpacity(0.7), size: 90),
              ],
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Stack with Center Alignment',
          _buildContainer(
            OsmeaComponents.stack(
              alignment: Alignment.center,
              children: [
                _buildColoredBox(color: Colors.purple, size: 150),
                _buildColoredBox(
                    color: Colors.amber.withOpacity(0.7), size: 100),
                OsmeaComponents.text(
                  'Centered Text',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Stack with Bottom-Right Alignment',
          _buildContainer(
            OsmeaComponents.stack(
              alignment: Alignment.bottomRight,
              children: [
                _buildColoredBox(color: Colors.teal, size: 150),
                _buildColoredBox(color: Colors.pink.withOpacity(0.7), size: 80),
                OsmeaComponents.padding(
                  padding: const EdgeInsets.all(8),
                  child: OsmeaComponents.text(
                    'Bottom-Right',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStyledStackExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Stack with ClipBehavior.none',
          _buildContainer(
            OsmeaComponents.container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              child: OsmeaComponents.stack(
                clipBehavior: Clip.none,
                children: [
                  OsmeaComponents.container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -20,
                    child: _buildColoredBox(color: Colors.red, size: 50),
                  ),
                  Positioned(
                    bottom: -20,
                    left: -20,
                    child: _buildColoredBox(color: Colors.blue, size: 50),
                  ),
                ],
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Stack with StackFit.expand',
          _buildContainer(
            SizedBox(
              width: double.infinity,
              height: 200,
              child: OsmeaComponents.stack(
                fit: StackFit.expand,
                children: [
                  OsmeaComponents.container(color: Colors.green.withOpacity(0.3)),
                  Align(
                    alignment: Alignment.center,
                    child: OsmeaComponents.container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: Center(
                        child: OsmeaComponents.text(
                          'Expanded',
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveStackExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Stack with Gesture Detection',
          _buildContainer(
            GestureDetector(
              onTap: () {
                debugPrint('Stack tapped!');
              },
              child: OsmeaComponents.stack(
                alignment: Alignment.center,
                children: [
                  _buildColoredBox(color: Colors.indigo, size: 150),
                  OsmeaComponents.text(
                    'Tap Me!',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPositionedChildrenExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Stack with Positioned Children',
          _buildContainer(
            SizedBox(
              width: double.infinity,
              height: 200,
              child: OsmeaComponents.stack(
                children: [
                  OsmeaComponents.container(color: Colors.grey.shade200),
                  OsmeaComponents.positioned(
                    top: 10,
                    left: 10,
                    child: _buildColoredBox(color: Colors.red, size: 50),
                  ),
                  OsmeaComponents.positioned(
                    top: 10,
                    right: 10,
                    child: _buildColoredBox(color: Colors.green, size: 50),
                  ),
                  OsmeaComponents.positioned(
                    bottom: 10,
                    left: 10,
                    child: _buildColoredBox(color: Colors.blue, size: 50),
                  ),
                  OsmeaComponents.positioned(
                    bottom: 10,
                    right: 10,
                    child: _buildColoredBox(color: Colors.amber, size: 50),
                  ),
                  OsmeaComponents.positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: OsmeaComponents.container(
                      height: 40,
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: OsmeaComponents.text(
                        'Overlay Caption',
                        textStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Stack with positionedFill and positionedFractional',
          _buildContainer(
            SizedBox(
              width: double.infinity,
              height: 200,
              child: OsmeaComponents.stack(
                children: [
                  OsmeaComponents.container(color: Colors.grey.shade200),
                  OsmeaComponents.positionedFill(
                    child: OsmeaComponents.container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.withOpacity(0.2),
                            Colors.purple.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                  ),
                  OsmeaComponents.positionedFractional(
                    left: 0.1,
                    top: 0.1,
                    widthFactor: 0.8,
                    heightFactor: 0.3,
                    child: OsmeaComponents.container(
                      color: Colors.amber.withOpacity(0.3),
                      child: Center(
                        child: OsmeaComponents.text(
                            'Fractional Position (80% × 30%)'),
                      ),
                    ),
                  ),
                  OsmeaComponents.positioned(
                    right: 20,
                    bottom: 20,
                    child: Icon(
                      Icons.info,
                      color: Colors.blue.shade700,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPracticalExamples() {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExampleWithCaption(
          'Image Card with Overlay',
          _buildContainer(
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: OsmeaComponents.stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://picsum.photos/500/300',
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: OsmeaComponents.container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                            stops: const [0.6, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: OsmeaComponents.column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OsmeaComponents.text(
                            'Beautiful Landscape',
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          OsmeaComponents.sizedBox(height: 4),
                          OsmeaComponents.text(
                            'Nature Photography',
                            textStyle: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: OsmeaComponents.container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: OsmeaComponents.text(
                          'Featured',
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        OsmeaComponents.sizedBox(height: 16),
        _buildExampleWithCaption(
          'Profile Card with Badge',
          _buildContainer(
            OsmeaComponents.container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: OsmeaComponents.stack(
                clipBehavior: Clip.none,
                children: [
                  OsmeaComponents.row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade200,
                        child: const Icon(
                          Icons.person,
                          size: 36,
                          color: Colors.grey,
                        ),
                      ),
                      OsmeaComponents.sizedBox(width: 16),
                      Expanded(
                        child: OsmeaComponents.column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OsmeaComponents.text(
                              'John Doe',
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            OsmeaComponents.sizedBox(height: 4),
                            OsmeaComponents.text(
                              'Senior Developer',
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: OsmeaComponents.container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: OsmeaComponents.text(
                        'Online',
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleWithCaption(String caption, Widget child) {
    return OsmeaComponents.column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: OsmeaComponents.text(
            caption,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildColoredBox({
    required Color color,
    required double size,
    String? text,
  }) {
    return OsmeaComponents.container(
      width: size,
      height: size,
      color: color,
      alignment: Alignment.center,
      child: text != null
          ? OsmeaComponents.text(
              text,
              textStyle: TextStyle(
                color: color.computeLuminance() > 0.5
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }

  Widget _buildContainer(Widget child) {
    return OsmeaComponents.container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
