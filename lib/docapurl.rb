require_relative './docapurl/version'
require_relative './docapurl/browser'
require 'byebug'
require 'thor'

module Docapurl
  class Error < StandardError; end

  # Your code goes here...
  class Cli < Thor
    desc 'cap [url]', 'cap url'
    method_options browser_path: :string
    method_options max_pagedown: :numeric, default: 5
    method_options sleep_before_screen: :numeric, default: 0
    method_options xvfb: false
    method_options headless: true
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
