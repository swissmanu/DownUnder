module DownUnder
    
    ##
    # The ResourceBundle holds the paths to various files which are used during
    # the rendering process.
    class ResourceBundle
        attr_accessor :coverpage
        attr_accessor :stylesheet
        attr_accessor :header
        attr_accessor :footer
        
        def initialize(&block)
            instance_eval(&block) if block_given?
        end
        
    end
end