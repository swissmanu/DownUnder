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

            if Dir.exist?(resource_directory)
                @stylesheet = lookup_file(resource_directory, "style.css")
                @coverpage = lookup_file(resource_directory, "coverpage.html")
                @header = lookup_file(resource_directory, "header.html")
                @footer = lookup_file(resource_directory, "footer.html")       
            end
        end
        
        private
        ##
        # Checks the availability of a resource file. If its not present, blank
        # gets returned. Otherwise its full path.
        def lookup_file(resource_directory, file)
            file_path = File.join resource_directory, file
            if File.exists?(file_path)
                file_path
            end
        end
        
    end
end