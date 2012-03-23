module TextHelper

  def markparser
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        :autolink => true,
                                        :space_after_headers => false)

    parser
  end

  def truncate_html(html)
    parsed = Nokogiri::HTML(html)
    count = 0
    parsed.xpath("//body").children.each do |child|
      child.remove if count > 5
      count = count + 1
    end

    parsed.to_html
  end

  def truncate_html_tag(html_text, tag)
    parsed = Nokogiri::HTML(html_text)
    parsed.xpath("//"+tag).each do |img|
      img.remove
      img.text.gsub(/\s+/, " ").strip
    end

    parsed.to_html
  end

end

module NokogiriTruncator
  module NodeWithChildren
    def truncate(max_length)
      return self if inner_text.length <= max_length
      truncated_node = self.dup
      truncated_node.children.remove

      self.children.each do |node|
        remaining_length = max_length - truncated_node.inner_text.length
        break if remaining_length <= 0
        truncated_node.add_child node.truncate(remaining_length)
      end
      truncated_node
    end
  end

  module TextNode
    def truncate(max_length)
      Nokogiri::XML::Text.new(content[0..(max_length - 1)], parent)
    end
  end

end

Nokogiri::HTML::DocumentFragment.send(:include, NokogiriTruncator::NodeWithChildren)
Nokogiri::XML::Element.send(:include, NokogiriTruncator::NodeWithChildren)
Nokogiri::XML::Text.send(:include, NokogiriTruncator::TextNode)