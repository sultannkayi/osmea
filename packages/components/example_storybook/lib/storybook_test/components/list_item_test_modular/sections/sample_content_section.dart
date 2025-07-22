import 'package:flutter/material.dart';

/// 📋 **Sample Content Section**
/// 
/// Provides sample content and utility widgets for list item demonstrations

class SampleContentSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool scrollable;
  final EdgeInsets? padding;

  const SampleContentSection({
    super.key,
    required this.title,
    required this.children,
    this.scrollable = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        ...children,
      ],
    );

    if (scrollable) {
      content = SingleChildScrollView(
        child: content,
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: content,
    );
  }
}

/// 📋 **Sample File Widget**
/// 
/// Creates a sample file representation for list items

class SampleFileWidget extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String lastModified;
  final IconData? customIcon;
  final Color? iconColor;
  final VoidCallback? onTap;

  const SampleFileWidget({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.lastModified,
    this.customIcon,
    this.iconColor,
    this.onTap,
  });

  IconData _getFileIcon() {
    if (customIcon != null) return customIcon!;
    
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.video_file;
      case 'mp3':
      case 'wav':
      case 'flac':
        return Icons.audio_file;
      case 'zip':
      case 'rar':
      case '7z':
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color _getFileIconColor() {
    if (iconColor != null) return iconColor!;
    
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Colors.red.shade600;
      case 'doc':
      case 'docx':
        return Colors.blue.shade600;
      case 'xls':
      case 'xlsx':
        return Colors.green.shade600;
      case 'ppt':
      case 'pptx':
        return Colors.orange.shade600;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Colors.purple.shade600;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Colors.indigo.shade600;
      case 'mp3':
      case 'wav':
      case 'flac':
        return Colors.teal.shade600;
      case 'zip':
      case 'rar':
      case '7z':
        return Colors.brown.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(
                _getFileIcon(),
                size: 24,
                color: _getFileIconColor(),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          fileSize,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          ' • ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          lastModified,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
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
    );
  }
}

/// 📋 **Sample User Widget**
/// 
/// Creates a sample user representation for list items

class SampleUserWidget extends StatelessWidget {
  final String name;
  final String email;
  final String? role;
  final String? avatarText;
  final Color? avatarColor;
  final VoidCallback? onTap;

  const SampleUserWidget({
    super.key,
    required this.name,
    required this.email,
    this.role,
    this.avatarText,
    this.avatarColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayAvatarText = avatarText ?? name.split(' ').map((part) => part[0]).take(2).join().toUpperCase();
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: avatarColor ?? Colors.blue.shade100,
                child: Text(
                  displayAvatarText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: avatarColor != null ? Colors.white : Colors.blue.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (role != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              role!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
