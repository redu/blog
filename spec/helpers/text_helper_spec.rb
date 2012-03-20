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
      it 'should truncate given tag off of the resultant text'
      it 'should produce a text smaller than the given text'
    end

    context 'when given text does not have some of given tag' do
      it 'should produce as result a text equal to the given text'
    end

  end 
  
end