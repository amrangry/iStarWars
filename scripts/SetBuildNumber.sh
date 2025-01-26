#!/bin/bash

# Script Description:
# This script automatically sets the app version and build number in the Info.plist files.
# - The app version (CFBundleShortVersionString) is derived from the latest Git tag (e.g., `v1.0.0`).
# - The build number (CFBundleVersion) is derived from the total number of commits in the Git repository (e.g., `50`).
#
# taken from blog post: http://www.mokacoding.com/blog/automatic-xcode-versioning-with-git/
# Automatically sets version of target based on most recent tag in git
# Automatically sets build number to number of commits

# How to Use:
# 1. Save this script in the root of your Xcode project under a `scripts` directory (e.g., `scripts/set_build_number.sh`).
# 2. Open your Xcode project and navigate to your target's Build Phases.
# 3. Add a new "Run Script Phase" at the top of the build phase list.
# 4. In the script input field, add: `$SRCROOT/scripts/set_build_number.sh`.
# 5. Ensure your project is initialized with Git and has at least one tag (e.g., `git tag v1.0.0`).
# 6. Build your project. The version and build number will automatically update based on the Git repository state.

# Example:
# - If the latest Git tag is `v1.0.0` and your repository has 50 commits:
#   - CFBundleShortVersionString will be set to `1.0.0`.
#   - CFBundleVersion will be set to `50`.
# - After building the app, your Info.plist will contain:
#     <key>CFBundleShortVersionString</key>
#     <string>1.0.0</string>
#     <key>CFBundleVersion</key>
#     <string>50</string>

git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)
git_release_version=$("$git" describe --tags --always --abbrev=0)

target_plist="$TARGET_BUILD_DIR/$INFOPLIST_PATH"
dsym_plist="$DWARF_DSYM_FOLDER_PATH/$DWARF_DSYM_FILE_NAME/Contents/Info.plist"

for plist in "$target_plist" "$dsym_plist"; do
  if [ -f "$plist" ]; then
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${git_release_version#*v}" "$plist"
  fi
done
