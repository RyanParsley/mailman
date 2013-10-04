#!/usr/bin/env rvm ruby-1.9.3-p385 do ruby
Kernel.exec("cd #{File.dirname(__FILE__)} && middleman build")
