describe Exercises::ConvertToCharacterRanges do
  describe '#result' do
    let(:text) { 'abcdab987612' }
    subject { Exercises::ConvertToCharacterRanges.call(text: text).result }

    it 'replaces character ranges in the given string with the shortened form' do
      subject.must_equal 'a-dab9-612'
    end
  end
end
