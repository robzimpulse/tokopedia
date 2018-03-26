# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'tokopedia' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for tokopedia
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'AlamofireObjectMapper'
  pod 'EZSwiftExtensions'
  pod 'Eureka'
  pod 'ObjectMapper'
  pod 'RangeSeekSlider'
  pod 'Realm'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxRealm'
  pod 'RxSwiftExt'
  pod 'TSCurrencyTextField'
  pod 'UIScrollView-InfiniteScroll'
  

  target 'tokopediaTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'tokopediaUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  myExcludedTargets = ['RxSwift', 'RxCocoa', 'Eureka']
  installer.pods_project.targets.each do |target|
    
    if target.name == 'RxSwift'
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
        end
      end
    end
    
    target.build_configurations.each do |config|
      if myExcludedTargets.include? target.name
        config.build_settings['SWIFT_VERSION'] = '4.0'
        else
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end
