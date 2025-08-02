import 'package:storybook_flutter/storybook_flutter.dart';

// Import the unified ticket showcase
import 'showcase/unified_ticket_showcase.dart';

/// 🎫 **Ticket Widget Stories - Modular Structure**
///
/// Entry point aggregating all Ticket Widget stories for the Storybook.
List<Story> getAllTicketStories() {
  return [
    ...getUnifiedTicketShowcase(),
  ];
} 