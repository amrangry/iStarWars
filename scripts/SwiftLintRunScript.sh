# Check if ENABLE_USER_SCRIPT_SANDBOXING is YES
current_value=$(plutil -extract 'buildSettings' xml1 -o - "${PROJECT_DIR}/iStarWars.xcodeproj/project.pbxproj" | grep "ENABLE_USER_SCRIPT_SANDBOXING" | cut -d "=" -f 2 | tr -d '[:space:]')

if [ "$current_value" == "YES" ]; then
    # Change it to NO
    plutil -replace 'buildSettings.ENABLE_USER_SCRIPT_SANDBOXING' -string "NO" "${PROJECT_DIR}/iStarWars.xcodeproj/project.pbxproj"
    echo "Disabling user script sandboxing"
fi

# if using cocapods
 ${PODS_ROOT}/SwiftLint/swiftlint
#"${PODS_ROOT}/SwiftLint/swiftlint"
#"${PODS_ROOT}/SwiftLint/swiftlint" lint --config "${SRCROOT}/.swiftlint.yml"
#"${PODS_ROOT}/SwiftLint/swiftlint" lint --strict
#if which "${PODS_ROOT}/SwiftLint/swiftlint" > /dev/null; then
 #   "${PODS_ROOT}/SwiftLint/swiftlint" lint
#else
 #   echo "warning: SwiftLint not installed. Please install it via CocoaPods or Homebrew."
#fi

# The easiest way to install swiftlint globally is via Homebrew. Run the following command:
# ~ brew install swiftlint
# verify
# ~ swiftlint --version

#  point to the globally installed
# swiftlint lint --strict


# if using SPM
#"${BUILD_ROOT}/../../../../SourcePackages/checkouts/SwiftLint/swiftlint" lint --strict
