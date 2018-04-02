require './environment'

exercises = [
	{ 
		description: "1.Replace ranges in the given string with the shortened form."\
		 "e. g. `'abcdab987612' => 'a-dab9-612",
		prompt: 'Please enter text: ',
		exercise: -> (value) { Exercises::ConvertToCharacterRanges.call(text: value).result }
	},
	{
		description: '2.Wrap the long lines in the given text to the given length',
		prompt: 'Please enter text and length separated by semicolon : ',
		exercise: -> (value) do
			values = value.split(';').map(&:strip)
			text, length = values.first, values.last.to_i
		  Exercises::SplitTextIntoChunks.call(text: text, length: length).result
    end
	},
	{
		description: "3.Remove the words from the array that are repeated more than 2 times and add their count in the parentheses."\
    "e. g. `['cat', 'cat', 'dog', 'dog', 'dog'] => ['cat', 'cat', 'dog (3)']`",
    prompt: 'Please enter words separated by comma: ',
    exercise: -> (value) { Exercises::CountWordOccurences.call(values: value.split(',').map(&:strip)).result }
	},
	{
		description: '4. Transforms the translations from simple format into yml file that can be used in the rails application',
		prompt: 'Please enter file path:',
		exercise: -> (path) { Exercises::ConvertYamlTranslations.call(file_path: path).result }
	},
	{
		description: '5. Filters party participants due to budget limit',
		prompt: 'Please enter budget:',
		exercise: -> (value) { Exercises::FilterPartyParticipants.call(budget: value.to_f).result }
	}
]

exercises.each do |ex|
	p ex[:description]
end

begin
	p 'Please enter number of exercises(1,2,3,4,5): '
  exercise = exercises[gets.chomp.to_i - 1]
  p exercise[:prompt]
  while (input = gets.chomp)
    p exercise[:exercise].call(input)
  end
rescue Exception => e
  puts 'Goodbye!'
end