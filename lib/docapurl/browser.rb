require 'ferrum'
require 'logger'

module Docapurl
  class Browser
    attr_accessor :browser, :save_path, :logger

    def initialize(**options)
      @save_path = options[:save_path]
      options[:timeout] ||= 30

      options[:slowmo] = 0.5
      @logger = options[:logger] || Logger.new(STDOUT)
      @browser = Ferrum::Browser.new options
    end

    def cap(url, **options)

      options[:quality] ||= 90
      options[:full] = true if options[:full].nil?
      options[:path] ||= @save_path
      host = fetch_domain(url)
      options[:path] ||= "screenshot-#{host.to_s == '' ? '' : "#{host}-"}#{Time.now.strftime('%F-%T')}.jpg"
      logger.info "browser begin to visit url #{url}"

      browser.go_to(url)
      logger.info 'visited'
      # sleep 1
      max_pagedown = options[:max_pagedown] || 5
      visit_whole_page(browser, max_pagedown: max_pagedown)
      browser.screenshot(**options)
      logger.info "screenshot ended, path = #{options[:path]}"
    end

    def close
      return if browser.nil?

      logger.info 'close browser'
      browser.quit
    end

    def visit_whole_page(browser, page: nil, max_pagedown: nil)
      page ||= browser.page
      viewport_height = page.viewport_size.last.to_i
      document_height = page.document_size.last.to_i
      return if document_height<= viewport_height

      page_down_count = document_height / viewport_height

      page_down_count = max_pagedown if page_down_count > max_pagedown

      page_down_count.times do
        logger.info "press PageDown .."
        browser.keyboard.type(:PageDown)
      end
      logger.info "press HOME .."
      browser.keyboard.type(:Home)
    end

    class << self
      def cap(url, path = nil, browser_options = {}, cap_options = {})
        browser = new(**browser_options)
        cap_options[:path] = path
        browser.cap(url, cap_options)
      rescue StandardError => e
        logger.error e
      ensure
        browser&.close
      end
    end

    private

    def fetch_domain(url)
      return url unless url.start_with? 'http'

      URI(url).host
    rescue StandardError
      nil
    end
  end
end
