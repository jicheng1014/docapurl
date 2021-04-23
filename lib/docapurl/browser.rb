require 'ferrum'
module Docapurl
  class Browser
    attr_accessor :browser, :save_path
    def initialize(save_path: nil, **options)
      @save_path = save_path
      @browser = Ferrum::Browser.new options
    end

    def cap(url, **options)
      options[:quality] ||= 90
      options[:full] = true if options[:full].nil?
      browser.go_to(url)
      browser.keyboard.type(:End)
      path = save_path || "screenshot-#{Time.now.strftime("%F-%T")}.jpg"
      browser.screenshot(full: full, quality: 80, path: path)
    end

    def close
      browser.nil?
      browser.close
    end
  end
end