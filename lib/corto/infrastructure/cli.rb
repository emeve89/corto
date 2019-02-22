require 'optparse'
require_relative '../../corto.rb'

@options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: cli.rb [options]'

  opts.on('-uURL', '--url=URL', 'Enter the URL') do |url|
    @options[:url] = url
  end
end.parse!

exit if @options[:url].strip.empty?
Corto::Adapters::UrlShortenerController.new.call(@options[:url])
