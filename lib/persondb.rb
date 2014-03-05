

require 'persondb/version'  # let it always go first


module PersonDb

  def self.banner
    "persondb/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  def self.root
    "#{File.expand_path( File.dirname(File.dirname(__FILE__)) )}"
  end

end  # module PersonDb


puts PersonDb.banner    # say hello

