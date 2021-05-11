# Docapurl
一个ruby的命令行截图网页的工具

## 抓取网页线上服务

[https://www.urlprint.com](https://www.urlprint.com) 提供在线抓取网页生成图片的服务, 支持 REST API 调用, 欢迎各位大佬试用

## 安装

gem install docapurl


## 前置条件

- ruby 环境
- chrome

需要安装chrome 浏览器, 并推荐把chrome的path 加入到环境变量PATH 或者 BROWSER_PATH 中

## 使用方式

on terminal

`docapurl cap [url] [image_path]`

使用 `docapurl help cap` 获得更多帮助

## Example

```
 docapurl cap https:/www.bilibili.com 1.jpg --pagedown-to-bottom
```

## FAQ

-  为啥docapurl 需要 chrome 以及在哪下载chrome?

因为 docapurl 封装了 ferrum gem 的一些截图功能, 而 ferrum 依赖于 headless Chrome .
linux 的chrome 一般都不太靠谱, 所以在这里下载官方的 https://www.chromium.org/getting-involved/download-chromium

windows 和mac 用户, 则可以在这里下载 https://www.google.com/chrome/.

下载安装完毕 chrome 后, 强烈建议将浏览器path 加入到 path 变量中

- 我能否跳过加入浏览器path 到 env PATH 中呢?

可以, 只不过在使用截图时, 需要指定浏览器path `--browser-path=you-path/to/chrome`


- 能否在 EC2 或者 ECS 上用?

可以, 只不过你要在机器中先装好 Chrome

特别提示, AWS ec2 上没中文字体, 需要安装中文字体如果你截图到是中文网页的话.


- 为啥截图网页的时候 网页底部有些图片没有出来?

因为这个网页可能使用了懒加载图片的技术, 需要图片在浏览器视区内才进行加载, cap 默认 5次 pageDown 如果你想确保都加载, 请使用 --pagedown-to-bottom 参数

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docapurl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Docapurl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/docapurl/blob/master/CODE_OF_CONDUCT.md).
