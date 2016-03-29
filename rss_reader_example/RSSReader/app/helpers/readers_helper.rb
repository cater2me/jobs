module ReadersHelper
  def self.parse_rss(doc)
    parsed = doc.xpath('//item//link').map do |link|
      {link: link.content}
    end

    doc.xpath('//item//title').each_with_index do |title, i|
      parsed[i][:title] = title.content
    end

    doc.xpath('//item//pubDate').each_with_index do |date, i|
      parsed[i][:date] = date.content
    end

    doc.xpath('//item//description').each_with_index do |desc, i|
      parsed[i][:description] = desc.content
    end

    doc.xpath('//item//author').each_with_index do |author, i|
      parsed[i][:author] = author.content
    end

    parsed
  end

  def self.parse_atom(doc)
    parsed = doc.css('entry title').map do |link|
      {link: attributes["href"].value}
    end
  end

  def self.parse(doc)
    if doc.namespaces["xmlns"] == "http://www.w3.org/2005/Atom"
      return parse_atom(doc)
    else
      return parse_rss(doc)
    end
  end

end
