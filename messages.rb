#!/usr/bin/ruby

require "json"
timezone="Europe/Amsterdam"
languages = ["en","af","ar","az","bg","bs","ca","cs","da","de","el","eo","es","et","eu","fa","fi","fr","fur"      ,"gl","he","hi","hr","hu","ia","id","it","ja","ko","lt","mi","ml","mr","nb","nl","oc","pa","pl","pt","pt_br","ru","sk","sl","sq","sr","sr_latin","sv","te","th","tr","uk","ur","vi","zh_cn","zh_tw"]

languages.each do |language|
  $language = language
  puts language
  messages = File.read("themes/amikumu/messages/#{language}.json")
  filename = ("themes/amikumu/messages/messages_#{language}.py")
  File.open(filename, "w") { |f| f.write "MESSAGES =  #{messages}" }
end