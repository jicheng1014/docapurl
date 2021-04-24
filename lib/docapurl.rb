require_relative './docapurl/version'
require_relative './docapurl/browser'
require 'byebug'
require 'thor'

module Docapurl
  class Error < StandardError; end

  # Your code goes here...
  class Cli < Thor
    desc 'cap [url]', 'cap url'
    method_option :browser_path, type: :string, desc: 'specify chrome browser path', required: false
    method_option :max_pagedown, type: :numeric, default: 5, desc: 'max page down press when page height overs the viewport height'
    method_option :pagedown_to_bottom, type: :boolean, default: false, desc: 'page down press until down to bottom'
    method_option :sleep_before_screen, type: :numeric, default: 0, desc: 'sleep second before_screen'
    method_option :xvfb, type: :boolean, default: false, desc: 'xvfb needed'
    method_option :headless, type: :boolean, default: true, desc: 'run in headless'
    def cap(url, path = nil)
      browser_options = {
        xvfb: options.xvfb,
        headless: options.headless,
        browser_path: options.browser_path
      }.reject { |_, v| v.nil? }

      Docapurl::Browser.cap(url, path, browser_options,
        {max_pagedown: options.max_pagedown,
          sleep_before_screen: options.sleep_before_screen,
          pagedown_to_bottom: options.pagedown_to_bottom

          })
    end
  end
end
