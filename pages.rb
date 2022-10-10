#!/usr/bin/ruby

require "json"
timezone="Europe/Amsterdam"
languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh-CN", "ru", "ja", "ka", "nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs", "avk", "lfn", "nds"]
#languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh-CN", "ru", "ja", "ka","nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs","nds"]
pages = ["index"]


languages.each do |language|
  pages.each do |page|
    languagefile = ""
    languageex = ""
    template = File.read("page_templates/#{page}.rst")

    
    if (language == "en")
      filename = "pages/#{page}.rst"
    else
      if (language == "zh-CN")
            filename = "pages/#{page}.zh_cn.rst"
            language = "zh_cn"           
                else
           filename = "pages/#{page}.#{language}.rst"
         end
           languagefile = language + "/"
           languageex = "." + language
    end
    template.gsub!(/\#{language-file}/, "#{languagefile}")
    template.gsub!(/\#{language-ex}/, "#{languageex}")
    File.open(filename, "w") { |f| f.write "#{template}" }
    #puts language
  #puts template
 # translationinput = File.read("translations/#{language}.json")
 # # puts translationinput
 # translations = JSON.parse(translationinput)
 # 
 # if defined?(translations['page_about-us.title'])
 #     translations.flatten_with_path.inspect    
 #   end
end
end