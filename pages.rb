#!/usr/bin/ruby

#require "json"
timezone="Europe/Amsterdam"
languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh-CN", "ru", "ja", "ka", "nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs", "avk", "lfn", "nds"]
#languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh-CN", "ru", "ja", "ka","nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs","nds"]
pages = ["index","press","ambassador","faq","support","privacy","about-us","for-organizations","statistics"]
query = ".. description: "
query2 = ".. title: "

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
    template.each_line do |line|
        if line =~ /#{query}/
          file = line
          file.slice!(query)
          file.slice!("\n")
          #puts file
          description = File.read("#{file}").chomp
          #puts description
          template.gsub!(/#{query}#{file}/, "#{query}#{description}")
          #template.gsub!(/^#{file}/, "")
        end
        if line =~ /#{query2}/
          file = line
          file.slice!(query2)
          file.chomp!
          #puts file
          description = File.read("#{file}").chomp
          #puts description
          template.gsub!(/#{query2}#{file}/, "#{query2}#{description}")
          #template.gsub!(/^#{file}/, "")
        end
      end
    File.open(filename, "w") { |f| f.write "#{template}" }
    puts language
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

template = File.read("page_templates/privacy.eo.rst")
File.open("pages/privacy.eo.rst", "w") { |f| f.write "#{template}" }
