require File.dirname(__FILE__) + '/../spec_helper' #carrega o que for necessário

describe TextHelper do

  describe :truncate_html do 

    before { @minor_text = "An almost nothing text." }

    context 'when specified text has length minor than specified length' do
      it 'should not modify the given text' do
        result = truncate_html(@minor_text, @minor_text.length+1, "")
        assert (result == @minor_text)
      end
      it 'should not append given ellipsis'
    end

    context 'when specified text has length greater than specified length' do
      it 'should truncate the text'
      it 'should append ellipsis into result last chars'
    end

  end #fim do describe para truncate_html

  describe :truncate_html_tag do

    context 'when given text has some of given tag' do

      before do
        @text_with_img_simple_tag = "The following image <img src='http://exa" +
          "mple.com/nothing'>Image</img> show us nothing."
        @text_with_img_empty_tag = "The following image show us nothing a kind"+
          "different way <img src='http://img.com/nothing' />"
        @text_should_return_empty = "<img src='http://redu.com.br/img.jpg' />"
      end

      it 'should truncate given tag off of the resultant text' do
        result = truncate_html_tag(@text_with_img_simple_tag, "img")
        img_tags_counter = Nokogiri::HTML(result).xpath('//img').length
        img_tags_counter.should be 0
      end
      it 'should produce a text smaller than the given text' do
        result = truncate_html_tag(@text_with_img_empty_tag, "img")
        result.length.should be < Nokogiri::HTML(@text_with_img_empty_tag).to_html.length
      end
      it 'should return an empty string when given text is an image tag only'
    end

    context 'when given text does not have some of given tag' do
      it 'should produce as result a text equal to the given text'
    end

  end #fim do describe para truncate_html_tag
  
end