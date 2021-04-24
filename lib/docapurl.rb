require_relative './docapurl/version'
require_relative './docapurl/browser'
require 'byebug'
require 'thor'

module Docapurl
  class Error < StandardError; end

  # Your code goes here...
  class Cli < Thor
    desc 'cap [url]', 'cap url'
    method_options browser_path: :string, desc: 'specify chrome browser path'
    method_options max_pagedown: :numeric, default: 5, desc: 'max page down press when page height overs the viewport height'
    method_options sleep_before_screen: :numeric, default: 0, desc: 'sleep second before_screen'
    method_options xvfb: false, desc: 'xvfb needed'
    method_options headless: true, desc: 'run in headless'
    def cap(url, path = nil)
      browser_options = {
        xvfb: options.xvfb,
        headless: options.headless,
        browser_path: options.browser_path
      }.reject! { |_, v| v.nil? }

      Docapurl::Browser.cap(url, path, browser_options, {max_pagedown: options.max_pagedown, sleep_before_screen: options.sleep_before_screen})
    end
  end
end
