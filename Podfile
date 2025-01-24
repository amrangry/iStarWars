# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

# Suppress the warning about the unused master specs repo
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'iStarWars' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  target 'iStarWarsTests' do
    inherit! :search_paths
  end
  
  target 'iStarWarsUITests' do
    inherit! :search_paths
  end
  
  pod 'SwiftLint', :inhibit_warnings => true
end
