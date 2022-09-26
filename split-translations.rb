#!/usr/bin/ruby

require "json"
timezone="Europe/Amsterdam"
languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh_cn", "ru", "ja", "ka", "nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs", "avk", "lfn", "nds"]

languages.each do |language|
  puts language
  translationinput = File.read("translations/#{language}.json")
  # puts translationinput
  translations = JSON.parse(translationinput)
  
  if defined?(translations['home_page_title'])
  
    translations.each do |key, value|
      # puts "result[#{key}] = #{value}"
      if (language == "en")
        filename = "pages/translations/#{key}.rst"
      else
        if !Dir.exist?("pages/translations/#{language}/")
          Dir.mkdir("pages/translations/#{language}/")
        end
        if (language == "zh_cn")
          filename = "pages/translations/#{language}/#{key}.rst"
        else
          filename = "pages/translations/#{language}/#{key}.rst"
        end
      end
      File.open(filename, "w") { |f| f.write "#{value}\n" }
    end
  end
end