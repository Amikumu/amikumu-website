#!/usr/bin/ruby

require "json"
timezone="Europe/Amsterdam"
languages = ["en","id", "ca", "de", "es", "eo", "fr", "zh-CN", "ru", "ja", "ka", "nl", "oc", "pl", "pt", "sk", "tr", "lt", "cs", "avk", "lfn", "nds"]

module Enumerable
  def flatten_with_path(parent_prefix = nil)
    res = {}
    language = $language
    self.each_with_index do |elem, i|
      if elem.is_a?(Array)
        k, v = elem
      else
        k, v = i, elem
      end

      key = parent_prefix ? "#{parent_prefix}.#{k}" : k # assign key name for result hash

      if v.is_a? Enumerable
        res.merge!(v.flatten_with_path(key)) # recursive call to flatten child elements
      else
        res[key] = v
         if (language == "en")
                filename = "translations_parts/#{key}.rst"
              else
                if (language == "zh-CN")
                  if !Dir.exist?("translations_parts/zh_cn/")
                    Dir.mkdir("translations_parts/zh_cn/")
                  end
                  filename = "translations_parts/zh_cn/#{key}.rst"
                else
                  if !Dir.exist?("translations_parts/#{language}/")
                    Dir.mkdir("translations_parts/#{language}/")
                  end
                  filename = "translations_parts/#{language}/#{key}.rst"
                end
                
              end
        File.open(filename, "w") { |f| f.write "#{v}\n" }
      end
    end

    res
  end
end

languages.each do |language|
  $language = language
  puts language
  translationinput = File.read("translations/#{language}.json")
  # puts translationinput
  translations = JSON.parse(translationinput)
  
  if defined?(translations['page_about-us.title'])
      translations.flatten_with_path.inspect    
    end
end