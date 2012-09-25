module DownUnder
    module Util
        
        class HTMLWithCodeRay < Redcarpet::Render::HTML
            def block_code(code, language)
                language = :text if language.nil?
                CodeRay.scan(code, language).div(:line_numbers => :table)
            end
        end
        
    end
end