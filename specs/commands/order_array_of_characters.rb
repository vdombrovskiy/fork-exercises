describe Exercises::OrderArrayOfCharachters do
  describe '#result' do
    let(:subject) do
      Exercises::OrderArrayOfCharachters.call(
        characters: characters,
        template: template
      ).result
    end
    let(:characters) { %w[a a a b c d d] }
    let(:template) { 'abcd' }

    it 'orders the array of the characters by given template' do
      # subject.must_equal ['a', 'b', 'c', 'd', 'a', 'd', 'a']
    end
  end
end
