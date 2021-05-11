# Docapurl

A tool to screenshot the webpage on terminal.

[chinese_readme 中文说明](https://github.com/jicheng1014/docapurl/blob/master/CH_README.md)

## Capture url as a Service

[https://www.urlprint.com](https://www.urlprint.com) provides the capture url service, REST API supported.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docapurl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docapurl
## Prerequisites

Chrome browser is required.
By the default, docapurl will invoke chrome in `PATH` ENV or ENV `BROWSER_PATH`

## Usage

on terminal

`docapurl cap [url] [image_path]`

use `docapurl help cap` to know more details

## Example

```
 docapurl cap https:/www.bilibili.com 1.jpg --pagedown-to-bottom
```

or if u wanna know more details on screenshot

```
 docapurl cap https:/www.bilibili.com 1.jpg --pagedown-to-bottom --no-headless
```

## FAQ

-  Why docapurl needs chrome and where to download Chrome?

Because docapurl just encapsulates functions from ferrum gem, and ferrum depends on headless Chrome.
There's no official Chrome or Chromium package for Linux don't install it this way because it's either outdated or unofficial, both are bad. Download it from official https://www.chromium.org/getting-involved/download-chromium

For mac and windows, u can download Chrome from https://www.google.com/chrome/.



- Could i skip  adding browser path to ENV path?

Yes, use param `--browser-path=you-path/to/chrome`


- Could use it on aws EC2 or aliyun ECS servers?

Yes, but u should installed chrome on serverw first.


- Why some images in the page didn't show in the screenshot?

Because the website may use lazy loading technology to the images, the images loaded when the images in browser viewscreen.
docapurl invokes keyborard PageDown 5 times default. use param `--pagedown-to-bottom` could ensure all images load happen.




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docapurl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Docapurl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/docapurl/blob/master/CODE_OF_CONDUCT.md).
