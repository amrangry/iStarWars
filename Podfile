# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

# Suppress the warning about the unused master specs repo
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'iStarWars' do
    
    # Use dynamic frameworks for all pods
    use_frameworks!
    
    # #CodeSmell
    # Add SwiftLint pod
    pod 'SwiftLint', :inhibit_warnings => true
    
    target 'iStarWarsTests' do
        inherit! :search_paths
    end
    
    target 'iStarWarsUITests' do
        inherit! :search_paths
    end
    
end
