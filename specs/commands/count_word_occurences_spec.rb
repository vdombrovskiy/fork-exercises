describe Exercises::CountWordOccurences do
  describe '#result' do
    let(:values) { %w[cat cat dog dog dog] }
    subject { Exercises::CountWordOccurences.call(values: values).result }

    it 'removes the words from the array that are repeated more than 2 times' \
		   'and add their count in the parentheses' do
      subject.must_equal ['cat', 'cat', 'dog (3)']
    end
  end
end
