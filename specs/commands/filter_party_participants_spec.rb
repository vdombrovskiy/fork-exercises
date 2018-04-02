describe Exercises::FilterPartyParticipants do
  describe '#result' do
    let(:participants_list) do
      [
        { 'id' => 1, 'name' => 'Mildred Carson', 'drinks' => ['Macchiato'] },
        { 'id' => 2, 'name' => 'Clifford Brown', 'drinks' => ['Latte'] },
        { 'id' => 3, 'name' => 'Kellie Fletcher', 'drinks' => ['Flat White', 'Espresso'] },
        { 'id' => 4, 'name' => 'Don Parsons', 'drinks' => ['Espresso'] },
        { 'id' => 5, 'name' => 'Renee Reynolds', 'drinks' => %w[Cappuccino Macchiato] },
        { 'id' => 6, 'name' => 'Rudolph Bishop', 'drinks' => ['Latte', 'Macchiato', 'Flat White'] }
      ]
    end

    subject { Exercises::FilterPartyParticipants.call(budget: 5).result }

    it 'outputs the names, user ids and chosen drinks for the employees ' \
		   'that should be invited due to party budget' do
      subject.must_equal participants_list
    end
  end
end
