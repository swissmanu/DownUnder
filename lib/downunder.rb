require 'thor'
require 'redcarpet'
require 'coderay'

module DownUnder

    ##
    # Internal paths
    LIBRARY_PATH = File.join(File.dirname(__FILE__), "downunder")
    UTIL_PATH    = File.join(LIBRARY_PATH, "util")   
    
    ##
    # Core files:
    autoload :Version,              File.join(LIBRARY_PATH, "version")
    autoload :Logger,               File.join(LIBRARY_PATH, "logger")
    autoload :Core,                 File.join(LIBRARY_PATH, "core")

    ##
    # Util files:
    module Util
        autoload :HTMLWithCodeRay,  File.join(UTIL_PATH, "htmlwithcoderay")
    end
    
end