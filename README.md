# mess

a simple ruby messenger statistician

## Dependencies
  - ruby

## Facebook archive
provide the program with **JSON** (!) Facebook archive

## Manual
Call `main` either directly or via link.
`main --help` for help. Quite self-explanatory.

## Examples
```bash

# to list indexed chats and plots
mess/main --facebook ~/MyData/facebook --list --chat --plot

# to process chat "4", enabling plots "a" and "d"
mess/main -f ~/MyData/facebook -c 4, -p ad

# help
mess/main --help

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
