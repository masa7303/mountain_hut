module EntryHelper
    def first_image(body)
        Nokogiri::HTML(body).xpath("//img")[0]['src'].to_s
    end

    def remove_image(body)
        doc = Nokogiri::HTML.parse(body)
        doc.search(:img).map &:remove
        doc.at(:body).to_html
    end
end
