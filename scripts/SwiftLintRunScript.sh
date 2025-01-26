# if using cocapods
#${PODS_ROOT}/SwiftLint/swiftlint
#"${PODS_ROOT}/SwiftLint/swiftlint"
#"${PODS_ROOT}/SwiftLint/swiftlint" lint --config "${SRCROOT}/.swiftlint.yml"
#"${PODS_ROOT}/SwiftLint/swiftlint" lint --strict
#if which "${PODS_ROOT}/SwiftLint/swiftlint" > /dev/null; then
 #   "${PODS_ROOT}/SwiftLint/swiftlint" lint
#else
 #   echo "warning: SwiftLint not installed. Please install it via CocoaPods or Homebrew."
#fi


# if using SPM
#"${BUILD_ROOT}/../../../../SourcePackages/checkouts/SwiftLint/swiftlint" lint --strict