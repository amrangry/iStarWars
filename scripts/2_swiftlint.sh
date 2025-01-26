# if using cocapods
# ${PODS_ROOT}/SwiftLint/swiftlint
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
# ${BUILD_ROOT}/../../../../SourcePackages/checkouts/SwiftLint/swiftlint

if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint is not installed via SPM. Make sure SwiftLint is added as a dependency."
fi
