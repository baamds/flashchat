platform :ios, '13.0'

target 'Flash Chat iOS13' do
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Flash Chat iOS13
	pod 'CLTypingLabel', '~> 0.4.0'
  pod 'Firebase/Auth'
	pod 'Firebase/Firestore'

end

# Older BoringSSL-GRPC podspecs add the GCC-only
# -GCC_WARN_INHIBIT_ALL_WARNINGS flag to every source file. Apple Clang parses
# its -G prefix as an unsupported iOS Simulator option, so strip it after Pods
# generates the project.
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end

    next unless target.respond_to?(:source_build_phase)

    target.source_build_phase.files.each do |build_file|
      flags = build_file.settings && build_file.settings['COMPILER_FLAGS']
      next unless flags

      build_file.settings['COMPILER_FLAGS'] = flags
        .split
        .reject { |flag| flag == '-GCC_WARN_INHIBIT_ALL_WARNINGS' }
        .join(' ')
    end
  end
end
