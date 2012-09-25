module DownUnder
    
    ##
    # The ResourceBundle holds the paths to various files which are used during
    # the rendering process.
    class ResourceBundle
        attr_accessor :coverpage
        attr_accessor :stylesheet
        attr_accessor :header
        attr_accessor :footer
        
        def initialize
            @stylesheet = File.join RES_PATH,"style.css"
            @coverpage = File.join RES_PATH,"cover.html"
            @header = File.join RES_PATH,"header.html"
            @footer = File.join RES_PATH,"footer.html"
        end
        
        ##
        # Searches in the passed directory for a .downunder directory.
        # If available, present resource files inside that folder override the
        # default resources defined from ResourceBundle.initialize
        def lookup(directory)
            resource_directory = File.join directory, ".downunder"
            stylesheet = File.join resource_directory, "style.css"
            coverpage = File.join resource_directory, "cover.html"
            header = File.join resource_directory,"header.html"
            footer = File.join resource_directory,"footer.html"
            
            @stylesheet = stylesheet if File.exists?(stylesheet)
            @coverpage = coverpage if File.exists?(coverpage)
            @header = header if File.exists?(header)
            @footer = footer if File.exists?(footer)
        end
        
    end
end