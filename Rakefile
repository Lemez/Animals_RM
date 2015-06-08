# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'

require 'bundler'
Bundler.require

require 'bubble-wrap/reactor'
require 'bubble-wrap/media'
require 'sugarcube-image'
# BubbleWrap.require 'motion/core/**/*.rb'


Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings

  app.name = 'animals_and_sounds'
  app.identifier = 'com.your_domain_here.animals_and_sounds'

  app.short_version = '0.1.0'
  # Get version from git
  #app.version = (`git rev-list HEAD --count`.strip.to_i).to_s
  app.version = app.short_version

  # RubyMotion by default selects the latest SDK you have installed,
  # if you would like to specify the SDK to assure consistency across multiple machines,
  # you can do so like the following examples
  # app.sdk_version = '8.3'
  # app.sdk_version = '7.1'

  # sorts out BW issue
  # app.detect_dependencies = false

  # Target OS
  app.deployment_target = '7.0'
  # app.deployment_target = '8.0'

  app.icons = Dir.glob("resources/icon*.png").map{|icon| icon.split("/").last}

  app.device_family = [:iphone, :ipad]
  # app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]
  app.interface_orientations = [:landscape_left]

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))

  # app.fonts = ['Oswald-Regular.ttf', 'FontAwesome.otf'] # These go in /resources
  # Or use all *.ttf fonts in the /resources/fonts directory:
  # app.fonts = Dir.glob("resources/fonts/*.ttf").map{|font| "fonts/#{font.split('/').last}"}
  
  # app.frameworks += %w(QuartzCore CoreGraphics MediaPlayer MessageUI CoreData)

  # app.vendor_project('vendor/Flurry', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc

  # app.info_plist['UILaunchStoryboardName'] = 'Default'

#   app.info_plist['UILaunchImages'] = [
#   # iphone
#   {
#     'UILaunchImageName' => 'Default',
#     'UILaunchImageOrientation' => 'Portrait',
#     'UILaunchImageMinimumOSVersion' => '7.0',
#     'UILaunchImageSize' => '{320, 480}'
#   },
#   {
#     'UILaunchImageName' => 'Default-568h',
#     'UILaunchImageOrientation' => 'Portrait',
#     'UILaunchImageMinimumOSVersion' => '7.0',
#     'UILaunchImageSize' => '{320, 568}'
#   },
#   {
#     'UILaunchImageName' => 'Default-667h',
#     'UILaunchImageOrientation' => 'Portrait',
#     'UILaunchImageMinimumOSVersion' => '8.0',
#     'UILaunchImageSize' => '{375, 667}'
#   },
#   {
#     'UILaunchImageName' => 'Default-736h',
#     'UILaunchImageOrientation' => 'Portrait',
#     'UILaunchImageMinimumOSVersion' => '8.0',
#     'UILaunchImageSize' => '{414, 736}'
#   },
#   # ipad
#   {
#     'UILaunchImageName' => 'Default-Portrait',
#     'UILaunchImageOrientation' => 'Portrait',
#     'UILaunchImageMinimumOSVersion' => '7.0',
#     'UILaunchImageSize' => '{768, 1024}'
#   },
#   {
#     'UILaunchImageName' => 'Default-Landscape',
#     'UILaunchImageOrientation' => 'Landscape',
#     'UILaunchImageMinimumOSVersion' => '7.0',
#     'UILaunchImageSize' => '{768, 1024}'
#   }
# ]

  app.pods do
    pod 'JMImageCache'
  #   pod 'JGProgressHUD'
  #   pod 'SVProgressHUD'
  #   pod "FontasticIcons"
  end

  app.development do
    app.codesign_certificate = "iPhone Developer: YOURNAME"
    app.provisioning_profile = "signing/animals_and_sounds.mobileprovision"
  end

  app.release do
    app.entitlements['get-task-allow'] = false
    app.codesign_certificate = 'iPhone Distribution: YOURNAME'
    app.provisioning_profile = "signing/animals_and_sounds.mobileprovision"
    app.entitlements['beta-reports-active'] = true # For TestFlight

    app.seed_id = "YOUR_SEED_ID"
    app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
    app.entitlements['keychain-access-groups'] = [ app.seed_id + '.' + app.identifier ]
  end

  puts "Name: #{app.name}"
  puts "Using profile: #{app.provisioning_profile}"
  puts "Using certificate: #{app.codesign_certificate}"
end

# Remove this if you aren't using CDQ
 task :"build:simulator" => :"schema:build"
