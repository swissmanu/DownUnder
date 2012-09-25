module DownUnder

    class CLI < Thor
        default_task :convert
        
        desc "convert [SOURCE] [TARGET]", "Creates a PDF from a markdown file or a folder with markdown files."
        method_option :title, :type => :string, :aliases => ["-t"], :desc => "Document title"
        method_option :coverpage, :type => :string, :aliases => ["-c"], :desc => "HTML file with your cover page"
        method_option :stylesheet, :type => :string, :aliases => ["-s"], :desc => "CSS stylesheet to style your content"
        def convert(source="")
            Logger.message "render! #{source}"
        end        
        
        map "-v" => :version
        desc "version", "Display version information"
        def version
            puts "DownUnder #{DownUnder::Version.current}"
        end
    end
    
end