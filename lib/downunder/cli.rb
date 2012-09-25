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
            source = File.expand_path source
            source_directory = source
            
            # If source is an explicit file, get the parent of the file as
            # source_directory
            if !File.directory?(source)
                source_directory = File.expand_path(File.dirname(source))
            end
            
            # Generate output path if not specifiec explicitly
            if options.output.nil? then
                target = File.join source_directory, File.basename(source).concat(".pdf")
            else
                target = options.output
            end
            
            # Create ResourceBundle and look for specific .downunder stuff:
            bundle = ResourceBundle.new
            bundle.lookup source_directory
            
            # Render
            core = DownUnder::Core.new(bundle)
            core.render! source
        end        
        
        map "-v" => :version
        desc "version", "Display version information"
        def version
            puts "DownUnder #{DownUnder::Version.current}"
        end
    end
    
end