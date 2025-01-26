#!/bin/bash

# Project Name:  $XcodeProject
# Project Dir:   $XcodeProjectPath
# Workspace Dir: $XcodeWorkspacePath

open -a Terminal "$(dirname $XcodeProjectPath)" 

## Pass Xcode environment variables to the script
#XcodeProject="${PROJECT_NAME}.xcodeproj"
#XcodeProjectPath="${PROJECT_DIR}/${PROJECT_NAME}.xcodeproj"
#XcodeWorkspacePath="${PROJECT_DIR}/${PROJECT_NAME}.xcworkspace"
#
## Call the script
#./open_terminal.sh
