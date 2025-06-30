#!/bin/bash

# OSMEA Storybook - Component Structure Generator
# 
# Usage: ./create_component_structure.sh <component_name>
# Example: ./create_component_structure.sh button

if [ $# -eq 0 ]; then
    echo "❌ Error: Component name is required"
    echo ""
    echo "Usage: ./create_component_structure.sh <component_name>"
    echo "Example: ./create_component_structure.sh button"
    exit 1
fi

COMPONENT_NAME="$1"
BASE_PATH="../${COMPONENT_NAME}_test_modular"
TEMPLATE_PATH="./component_template"

echo "🏗️ Creating modular structure for component: $COMPONENT_NAME"
echo "📁 Base path: $BASE_PATH"

# Check if template directory exists
if [ ! -d "$TEMPLATE_PATH" ]; then
    echo "❌ Error: Template directory not found: $TEMPLATE_PATH"
    exit 1
fi

# Create main directory
mkdir -p "$BASE_PATH"

# Read template structure dynamically and create folders
echo "📋 Reading template structure..."
FOLDERS=()
for dir in "$TEMPLATE_PATH"/*; do
    if [ -d "$dir" ]; then
        folder_name=$(basename "$dir")
        if [[ ! "$folder_name" =~ ^\. ]]; then  # Skip hidden folders
            FOLDERS+=("$folder_name")
            mkdir -p "$BASE_PATH/$folder_name"
            echo "   ✅ Created folder: $folder_name/"
        fi
    fi
done

# Sort folders for consistent output
IFS=$'\n' FOLDERS=($(sort <<<"${FOLDERS[*]}"))
IFS=' '

# Create standard required files
echo ""
echo "📄 Creating required files..."
echo "// TODO: Implement ${COMPONENT_NAME} main aggregator" > "$BASE_PATH/${COMPONENT_NAME}s.dart"
echo "   ✅ Created: ${COMPONENT_NAME}s.dart"

if [[ " ${FOLDERS[@]} " =~ " showcase " ]]; then
    echo "// TODO: Implement ${COMPONENT_NAME} showcase widget" > "$BASE_PATH/showcase/${COMPONENT_NAME}_showcase_widget.dart"
    echo "// TODO: Implement unified ${COMPONENT_NAME} showcase" > "$BASE_PATH/showcase/unified_${COMPONENT_NAME}_showcase.dart"
    echo "   ✅ Created: showcase/${COMPONENT_NAME}_showcase_widget.dart"
    echo "   ✅ Created: showcase/unified_${COMPONENT_NAME}_showcase.dart"
fi

# Create standard files for each folder type
CREATED_FILES=0
for folder in "${FOLDERS[@]}"; do
    case "$folder" in
        "sections")
            echo "// TODO: Implement header section" > "$BASE_PATH/sections/header_section.dart"
            echo "// TODO: Implement variant info section" > "$BASE_PATH/sections/variant_info_section.dart"
            echo "// TODO: Implement size info section" > "$BASE_PATH/sections/size_info_section.dart"
            echo "// TODO: Implement usage guidelines section" > "$BASE_PATH/sections/usage_guidelines_section.dart"
            echo "// TODO: Implement sample content section" > "$BASE_PATH/sections/sample_content_section.dart"
            CREATED_FILES=$((CREATED_FILES + 5))
            echo "   ✅ Created: 5 section files"
            ;;
        "widgets")
            echo "// TODO: Implement info chip widget" > "$BASE_PATH/widgets/info_chip_widget.dart"
            echo "// TODO: Implement section container widget" > "$BASE_PATH/widgets/section_container_widget.dart"
            CREATED_FILES=$((CREATED_FILES + 2))
            echo "   ✅ Created: 2 widget files"
            ;;
        "data")
            echo "// TODO: Add ${COMPONENT_NAME} descriptions" > "$BASE_PATH/data/${COMPONENT_NAME}_descriptions.dart"
            echo "// TODO: Add ${COMPONENT_NAME} guidelines" > "$BASE_PATH/data/${COMPONENT_NAME}_guidelines.dart"
            CREATED_FILES=$((CREATED_FILES + 2))
            echo "   ✅ Created: 2 data files"
            ;;
        "utils")
            echo "// TODO: Implement ${COMPONENT_NAME} builder" > "$BASE_PATH/utils/${COMPONENT_NAME}_builder.dart"
            echo "// TODO: Implement knobs configuration" > "$BASE_PATH/utils/knobs_config.dart"
            CREATED_FILES=$((CREATED_FILES + 2))
            echo "   ✅ Created: 2 utility files"
            ;;
        *)
            # For any other folders, create a basic placeholder
            echo "// TODO: Implement ${COMPONENT_NAME} ${folder} functionality" > "$BASE_PATH/${folder}/${COMPONENT_NAME}_${folder}.dart"
            CREATED_FILES=$((CREATED_FILES + 1))
            echo "   ✅ Created: 1 ${folder} file"
            ;;
    esac
done

echo ""
echo "✅ Component structure created successfully!"
echo ""
echo "📁 Created folders (${#FOLDERS[@]}):"
for folder in "${FOLDERS[@]}"; do
    echo "  ├── $folder/"
done
echo ""
echo "📄 Created files ($((CREATED_FILES + 3))):"
echo "  ├── ${COMPONENT_NAME}s.dart"
if [[ " ${FOLDERS[@]} " =~ " showcase " ]]; then
    echo "  ├── showcase/${COMPONENT_NAME}_showcase_widget.dart"
    echo "  ├── showcase/unified_${COMPONENT_NAME}_showcase.dart"
fi
for folder in "${FOLDERS[@]}"; do
    case "$folder" in
        "sections") echo "  ├── sections/ (5 files)" ;;
        "widgets") echo "  ├── widgets/ (2 files)" ;;
        "data") echo "  ├── data/ (2 files)" ;;
        "utils") echo "  ├── utils/ (2 files)" ;;
        "showcase") ;; # Already handled above
        *) echo "  ├── $folder/ (1 file)" ;;
    esac
done
echo ""
echo "🔧 Next steps:"
echo "  1. Implement the files with your component logic"
echo "  2. Run validation: dart storybook_validator.dart"
echo "  3. Add to main testing.dart when ready"
