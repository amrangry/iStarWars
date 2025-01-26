#!/usr/bin/env bash
# Build Phase Script for removing NSAppTransportSecurity exceptions from Info.plist
# https://gist.github.com/Ashton-W/07654259322e43a2b6a50bb289e72627

# Script Integration: 
# Make sure this script is added as a run script in the Build Phases section of your target in Xcode.
#
# Steps to integrate:
# 1. Open your target's Build Phases.
# 2. Add a new Run Script Phase.
# 3. Paste the path to this script (e.g., ./path/to/script.sh).
#
# Environment Variable Management:
# Set REMOVE_ATS_EXCEPTIONS as a user-defined build setting in your target or scheme.
#
# Testing:
# Test the script in a debug build configuration before applying it to production builds.

set -o errexit
set -o nounset

# Ensure REMOVE_ATS_EXCEPTIONS is set
if [[ -z "${REMOVE_ATS_EXCEPTIONS+SET}" ]]; then
  echo "error: User Defined Build Setting REMOVE_ATS_EXCEPTIONS must be set"
  exit 1
fi

# Check for PlistBuddy
if ! command -v /usr/libexec/PlistBuddy &> /dev/null; then
  echo "error: PlistBuddy is not available. Make sure it's installed and try again."
  exit 1
fi

# Validate CODESIGNING_FOLDER_PATH
if [[ -z "${CODESIGNING_FOLDER_PATH}" ]]; then
  echo "error: CODESIGNING_FOLDER_PATH is not set."
  exit 1
fi
if [[ ! -d "${CODESIGNING_FOLDER_PATH}" ]]; then
  echo "error: CODESIGNING_FOLDER_PATH does not point to a valid directory."
  exit 1
fi

# Remove NSAppTransportSecurity exceptions if enabled
remove_ATS_exceptions() {
  if [ "$REMOVE_ATS_EXCEPTIONS" == "YES" ]; then
    local infoplist="$CODESIGNING_FOLDER_PATH/Info.plist"
    echo "Processing Info.plist at $infoplist..."
    if /usr/libexec/PlistBuddy -c "Print :NSAppTransportSecurity" "$infoplist" &>/dev/null; then
      /usr/libexec/PlistBuddy -c "Delete :NSAppTransportSecurity" "$infoplist"
      touch "$infoplist"
      echo "Removed NSAppTransportSecurity from Info.plist"
    else
      echo "No NSAppTransportSecurity found in Info.plist"
    fi
  else
    echo "REMOVE_ATS_EXCEPTIONS not enabled for $CONFIGURATION. Skipping removal."
  fi
}

remove_ATS_exceptions