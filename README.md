# mess

Ruby program to analyze Facebook Messenger JSON archive and extract statistics therefrom.

## Dependencies
  - ruby

## Facebook archive
provide the program with **JSON** (!) Facebook archive _(as opposed to HTML format)_

## Examples
Call `main` either directly or via link.
```

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
Mess provides class "Plot" to be inherited for custom plots \
quick example (then see e.g. `plots` dir):
```ruby
# the following code (when require-d) will index a new plot "my custom plot"
# automatically assigning it a letter to be called with

class MyPlot < Plot

  Name = "my custom plot" # this will make your plot listed
  
  def initialize chat     # constructor
    super                 # default actions (optional)
    # blah blah           # whatever is needed
  end
  
  def push msg            # being called for every single message, chronologically
    if msg["sender_name"].include? "my"
      # do stuff
    else
      # don't etc.
    end
  end
  
end 
```
