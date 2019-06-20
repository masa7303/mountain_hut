module EntryHelper
    def first_image(body)
        path = Nokogiri::HTML(body).xpath("//img")
          if path[0].class != nil.class
            path[0]['src'].to_s
          end
    end

    def remove_image(body)
        doc = Nokogiri::HTML.parse(body)
        doc.search(:img).map &:remove
        doc.at(:body).to_html
    end
end
