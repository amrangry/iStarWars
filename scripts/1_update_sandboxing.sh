# Check if ENABLE_USER_SCRIPT_SANDBOXING is YES
# Extract the project name dynamically from the PROJECT_DIR
project_name=$(basename "${PROJECT_DIR}") # aka <iStarWars>

# Check if ENABLE_USER_SCRIPT_SANDBOXING is YES
current_value=$(plutil -extract 'buildSettings' xml1 -o - "${PROJECT_DIR}/${project_name}.xcodeproj/project.pbxproj" | grep "ENABLE_USER_SCRIPT_SANDBOXING" | cut -d "=" -f 2 | tr -d '[:space:]')

if [ "$current_value" == "YES" ]; then
    # Change it to NO
    plutil -replace 'buildSettings.ENABLE_USER_SCRIPT_SANDBOXING' -string "NO" "${PROJECT_DIR}/${project_name}.xcodeproj/project.pbxproj"
    echo "Disabling user script sandboxing"
fi
