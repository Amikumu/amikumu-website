Amikumu.com
==========================================

Translations for the pages can be done through: https://traduk.amikumu.com/projects/amikumu/website-pages/ or by editing the file in `\<root\>/translations/\<language\>.json` (not recommended)


Running `./split-translations.rb` will split the .json-files in `translations` into usable .rst-files and places them into `translations_parts`.

The folder `translations` syncs with https://traduk.amikumu.com/projects/amikumu/website-pages/

After splitting up the translation-files, run `./pages.rb` to (re)build the pages from the templates (in page_templates).

If website-navigation-strings have been changed / translated, run `./messages.rb`


TODO
=====

- [x] Make a folder with templates for the pages, that include a replaceable string to indicate language
- [x] create a script that copies the templates to the right location in 'pages' (files need to be names like page.de.rst) and replace the string with the target language

This script only needs to be run when there are changes to the page-template, not to the translations.