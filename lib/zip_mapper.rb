require 'algorithms'

class ZipMapper
  def self.mapper
    @mapper ||= self.build_mapper(self.mappings)
  end

  def self.get_mapping_for(zip)
    self.mapper[self.mapper.longest_prefix(zip)]
  end

  def self.build_mapper(local_mappings)
    local_mapper = Containers::Trie.new
    local_mappings.each do |val, prefix|
      prefix.map{|v| v.is_a?(Range) ? Array(v) : v}.flatten.each do |zip_prefix|
        local_mapper.push(zip_prefix, val)
      end
    end
    return local_mapper
  end
  
  def self.mappings
    raise "Must be overriden by implementing class!"
  end
end

autoload :ZipToState,"zip_to_state.rb"
autoload :ZipToTimezone,"zip_to_timezone.rb"