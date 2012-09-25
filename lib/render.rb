require 'redcarpet'
require 'coderay'

class HTMLWithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
        if language.nil? then
            language = :text
        end
        CodeRay.scan(code, language).div(:line_numbers => :table)
    end
end

markdown = Redcarpet::Markdown.new(
    HTMLWithCodeRay,
    :autolink => true,
    :space_after_headers => true,
    :fenced_code_blocks => true
)
content = ''

Dir.foreach('./') do |filename|
    if File.file?(filename) && filename.end_with?('.md')
        puts "Adding #{filename}"
        File.open(filename,'r') do |data|
            while(line = data.gets)
                content.concat(line)
            end
        end
    end
end

puts "Render Markdown..."
html = markdown.render content

File.open('output.html','w') do |out|
    out.write('<html><head><meta charset="UTF-8"><link href="style.css" rel="stylesheet" /></head><body>'+html+'</body></html>')
end

puts "Rendering PDF..."
`wkhtmltopdf --title "InTe Vorlesungsnotizen" -t --toc-depth 2 --toc-header-text "Inhaltsverzeichnis" --outline --cover title.html --footer-font-size 8 --footer-left "[section] - [subsection]" --footer-right "Seite [page]/[topage]" --quiet output.html test.pdf`

puts "Done."