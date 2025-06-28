import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:osmea_components/osmea_components.dart';

/// 📝 **OSMEA Rich Text Examples**
///
/// This file demonstrates various ways to use the OSMEA Rich Text component,
/// which allows for multiple text spans with different styles in a single text widget.
///
class RichTextExample extends StatelessWidget {
  const RichTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OsmeaComponents.scaffold(
      appBar: AppBar(
        title: OsmeaComponents.text('OSMEA Rich Text Examples'),
      ),
      body: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title
            OsmeaComponents.text(
              '📝 Basic Rich Text',
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Basic rich text example
            OsmeaComponents.text('Simple rich text with multiple styles:'),
            OsmeaComponents.sizedBox(height: 8),
            basicRichTextExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Rich text with links
            OsmeaComponents.text('Rich text with interactive spans:'),
            OsmeaComponents.sizedBox(height: 8),
            linkRichTextExample(context),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for text variants
            OsmeaComponents.text(
              '🎨 Text Style Variants',
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Rich text with different variants
            OsmeaComponents.text('Different text style variants:'),
            OsmeaComponents.sizedBox(height: 8),
            variantRichTextExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for alignment
            OsmeaComponents.text(
              '↔️ Text Alignment',
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Rich text with different alignments
            OsmeaComponents.text('Different text alignments:'),
            OsmeaComponents.sizedBox(height: 8),
            alignmentRichTextExamples(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for selectable text
            OsmeaComponents.text(
              '👆 Selectable Rich Text',
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Selectable rich text examples
            OsmeaComponents.text('Selectable rich text (try selecting):'),
            OsmeaComponents.sizedBox(height: 8),
            selectableRichTextExample(),
            OsmeaComponents.sizedBox(height: 24),

            // Section title for advanced examples
            OsmeaComponents.text(
              '🚀 Advanced Examples',
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            OsmeaComponents.sizedBox(height: 16),

            // Complex formatting examples
            OsmeaComponents.text('Complex text formatting:'),
            OsmeaComponents.sizedBox(height: 8),
            advancedRichTextExamples(),
            OsmeaComponents.sizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Basic rich text example
  Widget basicRichTextExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: OsmeaComponents.richText(
        textSpans: [
          OsmeaTextSpan(
            text: 'This is ',
          ),
          OsmeaTextSpan(
            text: 'bold',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          OsmeaTextSpan(
            text: ' and this is ',
          ),
          OsmeaTextSpan(
            text: 'italic',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          OsmeaTextSpan(
            text: ' text in a ',
          ),
          OsmeaTextSpan(
            text: 'single',
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          OsmeaTextSpan(
            text: ' rich text component.',
          ),
        ],
      ),
    );
  }

  // Rich text with links example
  Widget linkRichTextExample(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: OsmeaComponents.richText(
        textSpans: [
          OsmeaTextSpan(text: 'Visit our '),
          OsmeaTextSpan(
            text: 'website',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Website link tapped')),
              );
            },
          ),
          OsmeaTextSpan(text: ' or contact '),
          OsmeaTextSpan(
            text: 'support',
            style: const TextStyle(
              color: Colors.green,
              decoration: TextDecoration.underline,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Support link tapped')),
              );
            },
          ),
          OsmeaTextSpan(text: ' for help.'),
        ],
      ),
    );
  }

  // Rich text with different variants
  Widget variantRichTextExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OsmeaComponents.richText(
                variant: OsmeaTextVariant.headlineMedium,
                textSpans: [
                  OsmeaTextSpan(text: 'Headline '),
                  OsmeaTextSpan(
                    text: 'Medium',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 12),
              OsmeaComponents.richText(
                variant: OsmeaTextVariant.titleLarge,
                textSpans: [
                  OsmeaTextSpan(text: 'Title '),
                  OsmeaTextSpan(
                    text: 'Large',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 12),
              OsmeaComponents.richText(
                variant: OsmeaTextVariant.bodyLarge,
                textSpans: [
                  OsmeaTextSpan(text: 'Body '),
                  OsmeaTextSpan(
                    text: 'Large',
                    style: const TextStyle(color: Colors.purple),
                  ),
                  OsmeaTextSpan(
                    text: ' with more text to demonstrate the larger body style.',
                  ),
                ],
              ),
              OsmeaComponents.sizedBox(height: 12),
              OsmeaComponents.richText(
                variant: OsmeaTextVariant.labelMedium,
                textSpans: [
                  OsmeaTextSpan(text: 'Label '),
                  OsmeaTextSpan(
                    text: 'Medium',
                    style: const TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Rich text with different alignments
  Widget alignmentRichTextExamples() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: OsmeaComponents.richText(
            textAlign: TextAlign.start,
            textSpans: [
              OsmeaTextSpan(
                text: 'Left aligned ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              OsmeaTextSpan(
                text: 'rich text with multiple spans showing proper alignment.',
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          margin: const EdgeInsets.only(bottom: 12),
          child: OsmeaComponents.richText(
            textAlign: TextAlign.center,
            textSpans: [
              OsmeaTextSpan(
                text: 'Center aligned ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              OsmeaTextSpan(
                text: 'rich text with multiple spans showing proper alignment.',
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: OsmeaComponents.richText(
            textAlign: TextAlign.end,
            textSpans: [
              OsmeaTextSpan(
                text: 'Right aligned ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              OsmeaTextSpan(
                text: 'rich text with multiple spans showing proper alignment.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Selectable rich text example
  Widget selectableRichTextExample() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: OsmeaComponents.richText(
        selectable: true,
        textSpans: [
          OsmeaTextSpan(
            text: 'This entire text is selectable. ',
          ),
          OsmeaTextSpan(
            text: 'Try selecting this text with your finger or mouse ',
            style: const TextStyle(color: Colors.purple),
          ),
          OsmeaTextSpan(
            text: 'to copy it to your clipboard.',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Advanced rich text examples
  Widget advancedRichTextExamples() {
    return Column(
      children: [
        // Code snippet example
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: OsmeaComponents.richText(
            textSpans: [
              OsmeaTextSpan(
                text: 'void ',
                style: const TextStyle(color: Colors.blue, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: 'main',
                style: const TextStyle(color: Colors.yellow, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: '() {\n  ',
                style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: 'print',
                style: const TextStyle(color: Colors.lightBlue, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: '(',
                style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: "'Hello, world!'",
                style: const TextStyle(color: Colors.green, fontFamily: 'monospace'),
              ),
              OsmeaTextSpan(
                text: ');\n}',
                style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
              ),
            ],
          ),
        ),
        
        // Notification example
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade300),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: OsmeaComponents.richText(
            textSpans: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.info, color: Colors.blue, size: 20),
                ),
              ),
              OsmeaTextSpan(
                text: 'Info: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
              OsmeaTextSpan(
                text: 'This is an information message with ',
                style: TextStyle(color: Colors.blue.shade700),
              ),
              OsmeaTextSpan(
                text: 'important details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.blue.shade700,
                ),
              ),
              OsmeaTextSpan(
                text: '.',
                style: TextStyle(color: Colors.blue.shade700),
              ),
            ],
          ),
        ),
        
        // Price tag example
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: OsmeaComponents.richText(
            textSpans: [
              OsmeaTextSpan(
                text: 'The product costs ',
              ),
              OsmeaTextSpan(
                text: "\$",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OsmeaTextSpan(
                text: '29',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              OsmeaTextSpan(
                text: '.99',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              OsmeaTextSpan(
                text: ' (save ',
              ),
              OsmeaTextSpan(
                text: '50%',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OsmeaTextSpan(
                text: ')',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
