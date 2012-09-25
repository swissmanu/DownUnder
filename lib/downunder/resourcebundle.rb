module DownUnder
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