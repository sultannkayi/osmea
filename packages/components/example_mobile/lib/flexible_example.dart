import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 🔄 **OSMEA Flexible Examples**
///
/// This file demonstrates various ways to use the OSMEA Flexible component,
/// which enables flexible space allocation within Row and Column layouts.
///
class FlexibleExampleScreen extends StatelessWidget {
  const FlexibleExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: OsmeaComponents.appBar(
        title: OsmeaComponents.text('OSMEA Flexible Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: OsmeaComponents.column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '🔄 Basic Flexible in Row',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic row with flexible example
            OsmeaComponents.text('Flexible with different flex factors:'),
            OsmeaComponents.sizedBox(height: 8),
            basicRowFlexibleExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Flexible with fit example
            OsmeaComponents.text('Flexible with different fit types:'),
            OsmeaComponents.sizedBox(height: 8),
            flexibleFitExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for column flexibles
            OsmeaComponents.text(
              '🔄 Flexible in Column',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Column with flexibles example
            OsmeaComponents.text('Flexibles in a column:'),
            OsmeaComponents.sizedBox(height: 8),
            columnFlexiblesExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for comparison with expanded
            OsmeaComponents.text(
              '🔄 Flexible vs Expanded',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Flexible vs expanded example
            OsmeaComponents.text('Comparing Flexible with Expanded:'),
            OsmeaComponents.sizedBox(height: 8),
            flexibleVsExpandedExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for practical examples
            OsmeaComponents.text(
              '💡 Practical Examples',
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Form layout example
            OsmeaComponents.text('Form layout with flexible elements:'),
            OsmeaComponents.sizedBox(height: 8),
            formLayoutExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Dashboard layout example
            OsmeaComponents.text('Dashboard layout with flexible panels:'),
            OsmeaComponents.sizedBox(height: 8),
            dashboardLayoutExample(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic row with flexible example
  Widget basicRowFlexibleExample() {
    return OsmeaComponents.container(
      height: 60,
      width: double.infinity, // Set width to prevent overflow
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.max, // Ensure row takes full width
        children: [
          OsmeaComponents.flexible(
            flex: 1, // 1 part of space
            child: _buildColorBox(Colors.red, 'flex: 1'),
          ),
          OsmeaComponents.flexible(
            flex: 2, // 2 parts of space (twice as much)
            child: _buildColorBox(Colors.green, 'flex: 2'),
          ),
          OsmeaComponents.flexible(
            flex: 1, // 1 part of space
            child: _buildColorBox(Colors.blue, 'flex: 1'),
          ),
        ],
      ),
    );
  }

  // Flexible fit example
  Widget flexibleFitExample() {
    return OsmeaComponents.container(
      height: 60,
      width: double.infinity, // Set width to prevent overflow
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.max, // Ensure row takes full width
        children: [
          OsmeaComponents.flexible(
            flex: 1,
            fit: FlexFit.loose, // Default - takes needed space
            child: OsmeaComponents.container(
              color: Colors.red,
              padding: const EdgeInsets.all(8),
              child: OsmeaComponents.text(
                'FlexFit.loose',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          OsmeaComponents.flexible(
            flex: 1,
            fit: FlexFit.tight, // Forces to fill available space
            child: OsmeaComponents.container(
              color: Colors.blue,
              padding: const EdgeInsets.all(8),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'FlexFit.tight',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Column with flexibles example
  Widget columnFlexiblesExample() {
    return OsmeaComponents.container(
      height: 300,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: OsmeaComponents.column(
        children: [
          OsmeaComponents.flexible(
            flex: 1, // 1 part of space
            child: OsmeaComponents.container(
              color: Colors.red,
              width: double.infinity,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'flex: 1',
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          OsmeaComponents.flexible(
            flex: 2, // 2 parts of space (twice as much)
            child: OsmeaComponents.container(
              color: Colors.green,
              width: double.infinity,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'flex: 2',
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          OsmeaComponents.flexible(
            flex: 1, // 1 part of space
            child: OsmeaComponents.container(
              color: Colors.blue,
              width: double.infinity,
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'flex: 1',
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Flexible vs expanded example
  Widget flexibleVsExpandedExample() {
    return OsmeaComponents.container(
      height: 60,
      width: double.infinity, // Set width to prevent overflow
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.max, // Ensure row takes full width
        children: [
          OsmeaComponents.flexible(
            flex: 1,
            child: OsmeaComponents.container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              // Center text to prevent overflow
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Flexible',
                  textStyle: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          OsmeaComponents.expanded(
            flex: 1,
            child: OsmeaComponents.container(
              color: Colors.deepPurple.withOpacity(0.7),
              child: OsmeaComponents.center(
                child: OsmeaComponents.text(
                  'Expanded',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Form layout example using flexibles
  Widget formLayoutExample() {
    return Card(
      child: OsmeaComponents.padding(
        padding: const EdgeInsets.all(16),
        child: OsmeaComponents.column(
          children: [
            OsmeaComponents.row(
              mainAxisSize: MainAxisSize.max, // Ensure row takes full width
              children: [
                // Fixed width container for label to prevent overflow
                OsmeaComponents.container(
                  width: 60,
                  child: OsmeaComponents.text('Name:'),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  // Use expanded instead of flexible
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            OsmeaComponents.sizedBox(height: 16),
            OsmeaComponents.row(
              mainAxisSize: MainAxisSize.max, // Ensure row takes full width
              children: [
                // Fixed width container for label to prevent overflow
                OsmeaComponents.container(
                  width: 60,
                  child: OsmeaComponents.text('Email:'),
                ),
                OsmeaComponents.sizedBox(width: 8),
                OsmeaComponents.expanded(
                  // Use expanded instead of flexible
                  flex: 2, // Takes more space
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Dashboard layout example using flexibles
  Widget dashboardLayoutExample() {
    return OsmeaComponents.container(
      height: 200,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.max, // Ensure row takes full width
        children: [
          // Sidebar
          OsmeaComponents.flexible(
            flex: 1,
            child: OsmeaComponents.container(
              color: Colors.blueGrey.shade700,
              child: OsmeaComponents.padding(
                padding: const EdgeInsets.all(12),
                child: OsmeaComponents.column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OsmeaComponents.text(
                      'Dashboard',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OsmeaComponents.sizedBox(height: 16),
                    _buildSidebarItem('Home', Icons.home),
                    _buildSidebarItem('Analytics', Icons.insert_chart),
                    _buildSidebarItem('Settings', Icons.settings),
                  ],
                ),
              ),
            ),
          ),

          // Main content
          OsmeaComponents.expanded(
            // Use expanded to fill remaining space
            flex: 3, // Takes 3x the space of the sidebar
            child: OsmeaComponents.column(
              children: [
                // Header
                OsmeaComponents.container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: OsmeaComponents.row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Use a constrained width or Expanded for text
                      Expanded(
                        child: OsmeaComponents.text(
                          'Analytics Dashboard',
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      OsmeaComponents.spacer(),
                      const Icon(Icons.notifications),
                      OsmeaComponents.sizedBox(width: 16),
                      const Icon(Icons.person),
                    ],
                  ),
                ),

                // Content area
                OsmeaComponents.expanded(
                  child: OsmeaComponents.row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      OsmeaComponents.expanded(
                        // Use expanded instead of flexible
                        flex: 1,
                        child: _buildDashboardCard(
                          'Users',
                          '1,254',
                          Icons.people,
                          Colors.blue,
                        ),
                      ),
                      OsmeaComponents.expanded(
                        // Use expanded instead of flexible
                        flex: 1,
                        child: _buildDashboardCard(
                          'Revenue',
                          '\$12,345',
                          Icons.attach_money,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper for sidebar item - fix overflow
  Widget _buildSidebarItem(String label, IconData icon) {
    return OsmeaComponents.padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: OsmeaComponents.row(
        mainAxisSize: MainAxisSize.min, // Use min size to avoid overflow
        children: [
          Icon(icon, color: Colors.white, size: 16),
          OsmeaComponents.sizedBox(width: 8),
          // Use Expanded to contain text
          Expanded(
            child: OsmeaComponents.text(
              label,
              textStyle: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis, // Add ellipsis for long text
            ),
          ),
        ],
      ),
    );
  }

  // Helper for dashboard card
  Widget _buildDashboardCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: OsmeaComponents.padding(
        padding: const EdgeInsets.all(16),
        // Use SizedBox with constrained height to prevent overflow
        child: OsmeaComponents.sizedBox(
          height: 85, // Fixed height to ensure no overflow
          child: OsmeaComponents.column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Wrap text in Expanded to prevent overflow
                  Expanded(
                    child: OsmeaComponents.text(
                      title,
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  OsmeaComponents.spacer(),
                  Icon(icon, color: color),
                ],
              ),
              // Use Expanded to ensure the value gets proper space
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OsmeaComponents.text(
                    value,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for creating color boxes
  Widget _buildColorBox(Color color, String text) {
    return OsmeaComponents.container(
      color: color,
      child: OsmeaComponents.center(
        child: OsmeaComponents.text(
          text,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.center, // Center text to avoid overflow
          overflow: TextOverflow.ellipsis, // Add ellipsis for long text
        ),
      ),
    );
  }
}
