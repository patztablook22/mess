# mess

Ruby tool for analysis of Facebook Messenger conversations in JSON format. Output is spreadsheet-friendly (can be further processed in MS Excell / LibreOffice Calc / etc.). Independently of `mess` executable, an API is provided for more nuanced use.

## Installation
Ruby is required. You can download mess as a Ruby Gem:
```bash
gem install mess
```
Alternatively, after cloning this repo, run:
```bash
bundle exec rake install
```

## Facebook archive
provide the program with **JSON** (!) Facebook archive _(as opposed to HTML format)_

## Examples
Call `main` either directly or via link.
```bash

# print help
main --help 

# interactive prompt for given archive
main my/facebook/information

# analysis specifying chat and plots
main my/facebook/information/chat --plot DailyMsgs

```

## Contributing
Mess provides class `Mess::Plot` to be inherited for custom plots; \
quick example (for more, see `mess/plots` dir):
```ruby
module Mess
  class MyPlotter < Plotter

    # this will make MyPlotter "available"
    describe "my plot for magic analysis"
  
    def initialize chat     # constructor
      # blah blah           # whatever is needed
      # more code           # should be only preparation
    end
  
    def push msg            # being called for every single message chronologically
      if msg.body.include? "my"
        # do stuff
     else
        # don't etc.
      end
    end
  
    def finalize            # called after all messages have been push-ed
      # body                # perhaps reformat the data and so on
    end
    
    def generate_plot       # output a unified-format plot for further manipulation
      p = Plot.new
      p.data = @data
      p.head = @myHead
      return p
    end
  
  end
end 
```
