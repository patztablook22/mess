# mess

Ruby tool for analysis of native Facebook Messenger Archives in JSON format. Output is universal (also JSON) and can thus be used by table processors (like MS Excell / LibreOffice Calc) and more!

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

# guided analysis of given archive
main --facebook my/facebook/archive

# analysis specifying chat and plots
main --facebook my/facebook/archive --chat 3 --plot asdf

# list all available chats and plots for given archive
main --facebook my/facebook/archive --list --chat --plot

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
