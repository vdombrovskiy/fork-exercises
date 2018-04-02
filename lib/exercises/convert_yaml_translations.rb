require 'yaml'
module Exercises
  class ConvertYamlTranslations
    prepend SimpleCommand
    include Virtus.model

    attribute :file_path, String

    def call
      yml_hash = YAML.load_file(file_path)
      write_to_file(merge_hashes(yml_hash))
      'Please see result in translations.yml file'
    end

    private

    def nested_hashes(yml_hash)
      yml_hash.map do |nested_key, translation|
        nested_key.split('.').reverse.inject(translation) do |value, key|
          { key => value }
        end
      end
    end

    def merge_hashes(yml_hash)
      merger = proc do |_key, old_hash, new_hash|
        old_hash.is_a?(Hash) && new_hash.is_a?(Hash) ? old_hash.merge(new_hash, &merger) : new_hash
      end
      nested_hashes(yml_hash).inject({}) do |aggregator, hash|
        aggregator.merge(hash, &merger)
      end.to_yaml
    end

    def write_to_file(data)
      File.open('translations.yml', 'w') { |f| f.write data }
    end
  end
end
