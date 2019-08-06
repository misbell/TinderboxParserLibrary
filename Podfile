# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  workspace 'testWorkspace'
  

  xcodeproj 'TinderboxParserMac/TinderboxParserMac.xcodeproj'
  xcodeproj 'TbxParserUtils/TbxParserUtils.xcodeproj'
  xcodeproj 'TbxParserFrwUtils/TbxParserFrwUtils.xcodeproj'

  def parser_pods
  pod 'AEXML'
  end



target 'TinderboxParserMac' do
xcodeproj 'TinderboxParserMac/TinderboxParserMac.xcodeproj'
parser_pods
end


target 'TbxParserUtils' do
xcodeproj 'TbxParserUtils/TbxParserUtils.xcodeproj'
parser_pods
end


target 'TbxParserFrwUtils' do
xcodeproj 'TbxParserFrwUtils/TbxParserFrwUtils.xcodeproj'
parser_pods
end
