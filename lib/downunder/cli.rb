module DownUnder

    class CLI < Thor
        default_task :convert
        
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
            
            
            
            #Logger.message "render! #{source} #{target}"
            tmp = DownUnder::Core.new
            
            tmp.render! source
            
        end        
        
        map "-v" => :version
        desc "version", "Display version information"
        def version
            puts "DownUnder #{DownUnder::Version.current}"
        end
    end
    
end