Pod::Spec.new do |s|
  s.name         = "LHSCategoryCollection"
  s.version      = "0.0.1"
  s.summary      = "A collection of categories I commonly use in iOS projects."
  s.homepage     = "lionheartsw.com"
  s.license      = 'Apache 2.0'
  s.author       = { "Dan Loewenherz" => "dan@lionheartsw.com" }
  s.source       = { :git => "https://github.com/lionheart/LHSCategoryCollection.git", :commit => "45d4042d2454b420cc854ce482240d1160d0b49e" }

  s.source_files = '*.{h,m}'
  s.public_header_files = '*.h'
  s.requires_arc = true
  s.pre_install do |pod, target_definition|
    results = `find . | grep FMDatabase.h`
    if results == ''
      Dir.chdir(pod.root) do
        system "rm FMDatabase+*"
      end
    end
  end
end

