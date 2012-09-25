require 'thor'
require 'redcarpet'
require 'coderay'
require 'open3'

module DownUnder

    ##
    # Internal paths
    RES_PATH     = File.expand_path(File.join(File.dirname(__FILE__), "..", "res"))
    LIBRARY_PATH = File.join(File.dirname(__FILE__), "downunder")
    UTIL_PATH    = File.join(LIBRARY_PATH, "util")
    
    ##
    # Core files:
    autoload :Version,              File.join(LIBRARY_PATH, "version")
    autoload :Logger,               File.join(LIBRARY_PATH, "logger")
    autoload :Core,                 File.join(LIBRARY_PATH, "core")
    autoload :ResourceBundle,       File.join(LIBRARY_PATH, "resourcebundle")

    ##
    # Util files:
    module Util
        autoload :HTMLWithCodeRay,  File.join(UTIL_PATH, "htmlwithcoderay")
    end
    
end