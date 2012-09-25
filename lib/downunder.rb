require 'thor'

module DownUnder

    ##
    # Internal paths
    LIBRARY_PATH  = File.join(File.dirname(__FILE__), "downunder")

    ##
    # Core files:
    #autoload :Base,           File.join(LIBRARY_PATH, "base")
    autoload :Version,        File.join(LIBRARY_PATH, "version")
    autoload :Logger,         File.join(LIBRARY_PATH, "logger")

end