describe Exercises::ConvertYamlTranslations do
  describe '#result' do
    let(:file_path) { 'lib/files/translations_simple.yml' }
    let(:expected_content) do
      <<-EOS
---
en:
  pets:
    types:
      cat: Cat
      dog: Dog
    title: My lovely pets
  actions:
    add: Add
    remove: Remove
EOS
    end

    it 'converts translations to Rails I18n configuration' do
      Exercises::ConvertYamlTranslations.call(file_path: file_path).result
      hash = YAML.load_file('./translations.yml')
      hash.to_yaml.must_equal expected_content
    end
  end
end
