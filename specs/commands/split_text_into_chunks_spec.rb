describe Exercises::SplitTextIntoChunks do
  describe '#result' do
    subject { Exercises::SplitTextIntoChunks.call(text: text, length: 5).result }
    let(:text) { 'To be or not to be-that is the question' }
    let(:expected_result) do
      'To be\\n' \
      'or\\n' \
      'not\\n' \
      'to be\\n' \
      '-that\\n' \
      'is\\n' \
      'the\\n' \
      'quest\\n' \
      'ion'
    end

    it 'wraps the long lines in the given text to the given length' do
      subject.must_equal expected_result
    end
  end
end
