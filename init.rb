Redmine::Plugin.register :redmine_multilanguage_issue_description do
  name 'Redmine Multilanguage Issue Description plugin'
  author 'Bilel kedidi'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/bilel-kedidi/redmine_multilanguage_issue_description'
  author_url 'https://github.com/bilel-kedidi'
end
require 'redmine_multiple_issues_languages/issue_patch'
require 'redmine_multiple_issues_languages/issues_controller_patch'
