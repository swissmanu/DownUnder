module DownUnder
    class Core
        
        def initialize(ressource_bundle)
            @ressource_bundle = ressource_bundle
        end
        
        def render!(source, target)
            
            content = concat_files source, '.md'
            
            if content.empty? then
                Logger.warn " - No markdown files found! Exiting."
                return
            end
            
            
            Logger.message "Parse Markdown..."
            html = parse_markdown content
            html = "<html><head><meta charset=\"UTF-8\"><link href=\"#{@ressource_bundle.stylesheet}\" rel=\"stylesheet\" /></head><body>#{html}</body></html>"

            Logger.message "Render PDF..."
            arguments = [
                bin,
                "--quiet",
                "--title \"InTe Vorlesungsnotizen\"",
                "--toc",
                "--toc-header-text \"Inhaltsverzeichnis\"",
                "--outline",
                "--cover \"#{@ressource_bundle.coverpage}\"",
                "--footer-font-size 8",
                "--footer-left \"[section] - [subsection]\"",
                "--footer-right \"Seite [page]/[topage]\"",
                "--quiet",
                "-",
                "\"#{target}\""
            ]
            stdout,stderr,status = Open3.capture3(arguments.join(" "), :stdin_data => html)
            
            unless stderr.empty?
                Logger.error "wkhtmltopdf failed: \"#{stderr.strip}\""
                Logger.message "PDF not created. Sorry :-("
            else
                Logger.message "PDF \"#{target}\" created. Bye :-)"
            end 
        end
        
        
        private
        def concat_files(path, extension)
            content = ""
            
            if File.file?(path) && File.extname(path).eql?(extension)
                Logger.message "Processing  \"#{path}\""
                content = read_file(path)
            else
                Logger.message "Looking for markdown files in \"#{path}\":"
                Dir.foreach(path) do |filename|
                    if File.file?(filename) && File.extname(filename).eql?(extension)
                        Logger.message " - \"#{filename}\""
                        content.concat(read_file(filename))
                    end
                end
            end
            
            content
        end
        
        def read_file(file)
            content = ""
            
            File.open(file,'r') do |data|
                while(line = data.gets)
                    content.concat(line)
                end
            end
            
            content.concat "\n\n"
        end
        
        def parse_markdown(markdown)
            parser = Redcarpet::Markdown.new(
                DownUnder::Util::HTMLWithCodeRay,
                :autolink => true,
                :space_after_headers => true,
                :fenced_code_blocks => true
            )
            
            parser.render markdown
        end
        
        def bin
            "\"#{(`which wkhtmltopdf`).chomp}\""
        end
        
    end
end