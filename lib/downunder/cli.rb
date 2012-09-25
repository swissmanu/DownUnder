module DownUnder

    class CLI < Thor
        default_task :convert
        
        desc "init [DIR]", "Creates a .downunder directory with cover and styling files for DownUnder"
        def init(directory_to_init="")
            directory_to_init = Dir.getwd unless Dir.exists?(directory_to_init)
            boilerplate_directory = File.join(directory_to_init, ".downunder")
            
            if Dir.exists?(boilerplate_directory)
                Logger.error "#{boilerplate_directory} exists already! Exiting."
            else
                Logger.message "Create #{boilerplate_directory} with boilerplate files..."
                FileUtils.cp_r('res/',boilerplate_directory)                
            end
        end
        
        desc "convert [SOURCE]", "Creates a PDF from a markdown file or a folder with markdown files."
        method_option :output, :type => :string, :aliases => ["-o"], :desc => "Your target PDF file"
        method_option :title, :type => :string, :aliases => ["-t"], :desc => "Document title"
        method_option :coverpage, :type => :string, :aliases => ["-c"], :desc => "HTML file with your cover page"
        method_option :stylesheet, :type => :string, :aliases => ["-s"], :desc => "CSS stylesheet to style your content"
        def convert(source="")
            source = Dir.getwd if source.empty?
            
            if options.output.nil? then
                target = File.join [File.dirname(source),File.basename(source).concat(".pdf")]
            else
                target = options.output
            end
            
            default_bundle = ResourceBundle.new do
                @stylesheet = File.join([RES_PATH,"style.css"])
                @coverpage = File.join([RES_PATH,"cover.html"])
                @header = File.join([RES_PATH,"header.html"])
                @footer = File.join([RES_PATH,"footer.html"])
            end
            
            core = DownUnder::Core.new(default_bundle)
            core.render! source            
        end        
        
        map "-v" => :version
        desc "version", "Display version information"
        def version
            puts "DownUnder #{DownUnder::Version.current}"
        end
    end
    
end