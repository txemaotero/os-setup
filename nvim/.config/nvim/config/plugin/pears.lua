-- Auto pair plugin. Exception for vim
require "pears".setup(function(conf)
  conf.pair('"', {filetypes = {exclude = {"vim"}}})
end)
