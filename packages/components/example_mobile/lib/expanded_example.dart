import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

class ExpandedExampleScreen extends StatelessWidget {
  const ExpandedExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text(
          'OSMEA Expanded Examples',
          variant: OsmeaTextVariant.headlineMedium,
          color: OsmeaColors.white,
        ),
        backgroundColor: OsmeaColors.nordicBlue,
        foregroundColor: OsmeaColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Basic Usage Section
              _buildSectionTitle('Basic Usage'),
              OsmeaComponents.sizedBox(height: 16),
              _buildBasicExample(),
              OsmeaComponents.sizedBox(height: 24),

              // Flex Factor Section
              _buildSectionTitle('Flex Factor Examples'),
              OsmeaComponents.sizedBox(height: 16),
              _buildFlexFactorExample(),
              OsmeaComponents.sizedBox(height: 24),

              // Multiple Expanded Section
              _buildSectionTitle('Multiple Expanded Widgets'),
              OsmeaComponents.sizedBox(height: 16),
              _buildMultipleExpandedExample(),
              OsmeaComponents.sizedBox(height: 24),

              // Using Static Methods Section
              _buildSectionTitle('Using Static Methods'),
              OsmeaComponents.sizedBox(height: 16),
              _buildStaticMethodsExample(),
              OsmeaComponents.sizedBox(height: 24),

              // Real-world Layout Section
              _buildSectionTitle('Real-world Layout Example'),
              OsmeaComponents.sizedBox(height: 16),
              _buildRealWorldExample(context),
              OsmeaComponents.sizedBox(height: 24),

            // Enhanced Features Section (now using composition)
            _buildSectionTitle('Enhanced Features Using Composition'),
            OsmeaComponents.sizedBox(height: 16),
            _buildEnhancedFeaturesExample(context),
            OsmeaComponents.sizedBox(height: 24),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildSectionTitle(String title) {
    return OsmeaComponents.text(
      title,
      variant: OsmeaTextVariant.headlineSmall,
      color: OsmeaColors.nordicBlue,
    );
  }

  Widget _buildBasicExample() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Basic Expanded Example',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'The blue container expands to fill available space while the yellow container keeps its original size.',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.sizedBox(
            height: 100,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  child: OsmeaComponents.container(
                    color: OsmeaColors.nordicBlue
                        .withValues(red: 44, green: 95, blue: 93, alpha: 0.7),
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'Expanded',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelLarge,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: OsmeaComponents.text(
                      'Fixed',
                      variant: OsmeaTextVariant.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlexFactorExample() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Flex Factor Example',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Different flex factors determine how much space each child gets (1:2:3).',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.sizedBox(
            height: 80,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  flex: 1,
                  child: OsmeaComponents.container(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'flex: 1',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  flex: 2,
                  child: OsmeaComponents.container(
                    color: Colors.green.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'flex: 2',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  flex: 3,
                  child: OsmeaComponents.container(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'flex: 3',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMultipleExpandedExample() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Multiple Expanded Example',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Using OsmeaComponents.expanded in a Column layout to create a responsive design.',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.sizedBox(
            height: 200,
            child: OsmeaComponents.column(
              children: [
                OsmeaComponents.container(
                  height: 50,
                  color: OsmeaColors.nordicBlue
                      .withValues(red: 44, green: 95, blue: 93, alpha: 0.8),
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: OsmeaComponents.text(
                      'Fixed Height Header',
                      color: OsmeaColors.white,
                      variant: OsmeaTextVariant.labelLarge,
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(height: 8),
                OsmeaComponents.expanded(
                  child: OsmeaComponents.container(
                    color: Colors.teal.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'Expanded Content Area',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelLarge,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(height: 8),
                OsmeaComponents.container(
                  height: 40,
                  color: OsmeaColors.nordicBlue
                      .withValues(red: 44, green: 95, blue: 93, alpha: 0.6),
                  borderRadius: BorderRadius.circular(8),
                  child: Center(
                    child: OsmeaComponents.text(
                      'Fixed Height Footer',
                      color: OsmeaColors.white,
                      variant: OsmeaTextVariant.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticMethodsExample() {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Static Methods Example',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Using OsmeaComponents.expanded() with standard and flex parameters',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.sizedBox(
            height: 80,
            child: OsmeaComponents.row(
              children: [
                // Using expanded method
                OsmeaComponents.expanded(
                  child: OsmeaComponents.container(
                    color: Colors.purple.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'expanded()',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                // Using expanded with flex parameter
                OsmeaComponents.expanded(
                  flex: 2,
                  child: OsmeaComponents.container(
                    color: Colors.indigo.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'expanded(flex: 2)',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.text(
            'Using OsmeaComponents.expanded() static method:',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.sizedBox(
            height: 60,
            child: OsmeaComponents.row(
              children: [
                // Using OsmeaComponents.expanded
                OsmeaComponents.expanded(
                  flex: 1,
                  child: OsmeaComponents.container(
                    color: Colors.orange.shade300,
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: OsmeaComponents.text(
                        'OsmeaComponents.expanded()',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRealWorldExample(BuildContext context) {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Real-world Layout Example',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'A common app layout pattern with a header, content area, and toolbar.',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          OsmeaComponents.sizedBox(height: 16),
          OsmeaComponents.sizedBox(
            height: 350,
            child: OsmeaComponents.container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: OsmeaComponents.column(
                children: [
                  // App Bar
                  OsmeaComponents.container(
                    padding: const EdgeInsets.all(12),
                    color: OsmeaColors.nordicBlue,
                    child: OsmeaComponents.row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OsmeaComponents.text(
                          'OSMEA Dashboard',
                          color: OsmeaColors.white,
                          variant: OsmeaTextVariant.headlineSmall,
                        ),
                        OsmeaComponents.row(
                          children: [
                            const Icon(Icons.search, color: OsmeaColors.white),
                            OsmeaComponents.sizedBox(width: 8),
                            const Icon(Icons.notifications,
                                color: OsmeaColors.white),
                            OsmeaComponents.sizedBox(width: 8),
                            const Icon(Icons.account_circle,
                                color: OsmeaColors.white),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Content area (expanded)
                  OsmeaComponents.expanded(
                    child: OsmeaComponents.row(
                      children: [
                        // Sidebar
                        OsmeaComponents.container(
                          width: 80,
                          color: Colors.grey.shade100,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: OsmeaComponents.column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.home, color: OsmeaColors.nordicBlue),
                              const Icon(Icons.explore, color: Colors.grey),
                              const Icon(Icons.favorite, color: Colors.grey),
                              const Icon(Icons.settings, color: Colors.grey),
                              const Icon(Icons.help, color: Colors.grey),
                            ],
                          ),
                        ),

                        // Main content (expanded)
                        OsmeaComponents.expanded(
                          child: OsmeaComponents.container(
                            padding: const EdgeInsets.all(16),
                            child: OsmeaComponents.column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OsmeaComponents.text(
                                  'Dashboard',
                                  variant: OsmeaTextVariant.headlineSmall,
                                ),
                                OsmeaComponents.sizedBox(height: 8),
                                OsmeaComponents.row(
                                  children: [
                                    OsmeaComponents.expanded(
                                      child: OsmeaComponents.container(
                                        padding: const EdgeInsets.all(12),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.blue.shade100,
                                        child: OsmeaComponents.column(
                                          children: [
                                            Icon(Icons.trending_up,
                                                size: 28,
                                                color: OsmeaColors.nordicBlue),
                                            OsmeaComponents.sizedBox(height: 8),
                                            OsmeaComponents.text('Sales',
                                                variant: OsmeaTextVariant
                                                    .labelMedium),
                                            OsmeaComponents.text('23,456',
                                                variant: OsmeaTextVariant
                                                    .titleMedium),
                                          ],
                                        ),
                                      ),
                                    ),
                                    OsmeaComponents.sizedBox(width: 8),
                                    OsmeaComponents.expanded(
                                      child: OsmeaComponents.container(
                                        padding: const EdgeInsets.all(12),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.green.shade100,
                                        child: OsmeaComponents.column(
                                          children: [
                                            const Icon(Icons.people,
                                                size: 28, color: Colors.green),
                                            OsmeaComponents.sizedBox(height: 8),
                                            OsmeaComponents.text('Visitors',
                                                variant: OsmeaTextVariant
                                                    .labelMedium),
                                            OsmeaComponents.text('5,678',
                                                variant: OsmeaTextVariant
                                                    .titleMedium),
                                          ],
                                        ),
                                      ),
                                    ),
                                    OsmeaComponents.sizedBox(width: 8),
                                    OsmeaComponents.expanded(
                                      child: OsmeaComponents.container(
                                        padding: const EdgeInsets.all(12),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.orange.shade100,
                                        child: OsmeaComponents.column(
                                          children: [
                                            const Icon(Icons.shopping_cart,
                                                size: 28, color: Colors.orange),
                                            OsmeaComponents.sizedBox(height: 8),
                                            OsmeaComponents.text('Orders',
                                                variant: OsmeaTextVariant
                                                    .labelMedium),
                                            OsmeaComponents.text('1,234',
                                                variant: OsmeaTextVariant
                                                    .titleMedium),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                OsmeaComponents.sizedBox(height: 16),
                                // Fix: Wrap Recent Activity in Expanded + SingleChildScrollView
                                OsmeaComponents.expanded(
                                  child: OsmeaComponents.container(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    padding: const EdgeInsets.all(12),
                                    child: SingleChildScrollView(
                                      child: OsmeaComponents.column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          OsmeaComponents.text('Recent Activity',
                                              variant:
                                                  OsmeaTextVariant.titleMedium),
                                          OsmeaComponents.sizedBox(height: 8),
                                          OsmeaComponents.text(
                                              '• User "John Smith" placed a new order'),
                                          OsmeaComponents.sizedBox(height: 4),
                                          OsmeaComponents.text(
                                              '• 3 new comments on blog post "OSMEA Components"'),
                                          OsmeaComponents.sizedBox(height: 4),
                                          OsmeaComponents.text(
                                              '• New feature released: OsmeaComponents.expanded component'),
                                          OsmeaComponents.sizedBox(height: 4),
                                          OsmeaComponents.text(
                                              '• Server maintenance scheduled for next week'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom toolbar
                  OsmeaComponents.container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: Colors.grey.shade200,
                    child: OsmeaComponents.row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OsmeaComponents.text('© 2025 OSMEA Team',
                            variant: OsmeaTextVariant.bodySmall),
                        OsmeaComponents.row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.help_outline,
                                  size: 18, color: Colors.grey.shade700),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline,
                                  size: 18, color: Colors.grey.shade700),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedFeaturesExample(BuildContext context) {
    return OsmeaComponents.container(
      padding: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(red: 0, green: 0, blue: 0, alpha: 0.1),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
      child: OsmeaComponents.column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OsmeaComponents.text(
            'Enhanced Features Using Composition',
            variant: OsmeaTextVariant.titleMedium,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.text(
            'Using composition to create styled and interactive expanded widgets.',
            variant: OsmeaTextVariant.bodyMedium,
          ),
          // Direct styling using composition
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.sizedBox(
            height: 100,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  flex: 1,
                  child: OsmeaComponents.container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          OsmeaColors.nordicBlue,
                          OsmeaColors.crystalBay
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: OsmeaColors.nordicBlue.withValues(
                              red: 44, green: 95, blue: 93, alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 24),

          // Interactive expanded widgets using GestureDetector
          OsmeaComponents.text(
            '2. Interactive Widgets with GestureDetector',
            variant: OsmeaTextVariant.labelLarge,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.sizedBox(
            height: 100,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: OsmeaComponents.text(
                                'Tapped on green expanded area!')),
                      );
                    },
                    child: OsmeaComponents.container(
                      color: OsmeaColors.forestHeart,
                      borderRadius: BorderRadius.circular(8),
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: OsmeaComponents.text(
                          'Tap Me',
                          color: OsmeaColors.white,
                          variant: OsmeaTextVariant.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  flex: 1,
                  child: GestureDetector(
                    onLongPress: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: OsmeaComponents.text(
                                'Long-pressed on orange expanded area!')),
                      );
                    },
                    child: OsmeaComponents.container(
                      color: OsmeaColors.sunsetGlow,
                      borderRadius: BorderRadius.circular(8),
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: OsmeaComponents.text(
                          'Long Press',
                          color: OsmeaColors.white,
                          variant: OsmeaTextVariant.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 24),

          // Border and shape examples using Container
          OsmeaComponents.text(
            '3. Borders and Shapes with Container',
            variant: OsmeaTextVariant.labelLarge,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.sizedBox(
            height: 100,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  flex: 1,
                  child: OsmeaComponents.container(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: OsmeaColors.nordicBlue,
                      width: 2,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: OsmeaComponents.text(
                        'Border',
                        color: OsmeaColors.nordicBlue,
                        variant: OsmeaTextVariant.labelLarge,
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  flex: 1,
                  child: OsmeaComponents.container(
                    decoration: BoxDecoration(
                      color: OsmeaColors.pineGrove,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: OsmeaComponents.text(
                        'Circle',
                        color: OsmeaColors.white,
                        variant: OsmeaTextVariant.labelLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          OsmeaComponents.sizedBox(height: 24),

          // Combined features example using composition
          OsmeaComponents.text(
            '4. Combined Features with Composition',
            variant: OsmeaTextVariant.labelLarge,
          ),
          OsmeaComponents.sizedBox(height: 8),
          OsmeaComponents.sizedBox(
            height: 150,
            child: OsmeaComponents.row(
              children: [
                OsmeaComponents.expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                OsmeaComponents.text('Feature card tapped!')),
                      );
                    },
                    child: OsmeaComponents.container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.shade300,
                            Colors.deepPurple.shade700
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withValues(
                                red: 128, green: 0, blue: 128, alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star,
                              color: Colors.yellow.shade300, size: 30),
                          OsmeaComponents.text(
                            'Premium Feature',
                            color: OsmeaColors.white,
                            variant: OsmeaTextVariant.titleMedium,
                          ),
                          OsmeaComponents.text(
                            'Tap to explore all the enhanced styling options',
                            color: Colors.white70,
                            variant: OsmeaTextVariant.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                OsmeaComponents.sizedBox(width: 16),
                OsmeaComponents.expanded(
                  flex: 2,
                  child: OsmeaComponents.container(
                    decoration: BoxDecoration(
                      color: OsmeaColors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                              red: 0, green: 0, blue: 0, alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: OsmeaColors.silver),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: OsmeaComponents.column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline,
                            color: OsmeaColors.nordicBlue, size: 30),
                        OsmeaComponents.text(
                          'Did you know?',
                          variant: OsmeaTextVariant.labelLarge,
                          color: OsmeaColors.nordicBlue,
                        ),
                        OsmeaComponents.text(
                          'Compose OsmeaExpanded with Container for styling',
                          textAlign: TextAlign.center,
                          variant: OsmeaTextVariant.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
