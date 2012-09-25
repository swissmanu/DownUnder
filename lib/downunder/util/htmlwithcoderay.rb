module DownUnder
    module Util
        
        ##
        # A RedCarpet HTML Renderer which uses CodeRay for syntax highlightning
        # in code blocks.
        class HTMLWithCodeRay < Redcarpet::Render::HTML
            def block_code(code, language)
                language = :text if language.nil?
                CodeRay.scan(code, language).div(:line_numbers => :table)
            end
        end
        
    end
end