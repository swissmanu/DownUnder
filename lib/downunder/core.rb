module DownUnder
    class Core
        
        def render!(source)
            
            Logger.message "Looking for markdown files..."
            content = concat_files source, '.md'
                        
            Logger.message "Render Markdown..."
            html = parse_markdown content
            html = "<html><head><meta charset=\"UTF-8\"><link href=\"style.css\" rel=\"stylesheet\" /></head><body>#{html}</body></html>"
            File.open("output.html",'w') do |out|
                out.write(html)
            end

            Logger.message "Rendering PDF..."
            `wkhtmltopdf --title "InTe Vorlesungsnotizen" -t --toc-depth 2 --toc-header-text "Inhaltsverzeichnis" --outline --cover title.html --footer-font-size 8 --footer-left "[section] - [subsection]" --footer-right "Seite [page]/[topage]" --quiet output.html test.pdf`

            Logger.message "Done."
        end
        
        
        private
        def concat_files(path, extension)
            content = ""
            
            if File.file?(path) && path.end_with?(extension)
                content.concat(read_file(path))
            else
                Dir.foreach(path) do |filename|
                    if File.file?(filename) && filename.end_with?(extension)
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
            
            content
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
    end
end