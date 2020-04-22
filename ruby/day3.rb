module ActsAsCsv
  
  class CsvRow
    attr_accessor :headers, :content

    def initialize(headers, content)
      @headers = headers
      @content = content
    end

    def method_missing name, *args
      index = @headers.index(name.to_s)
      return @content[index]
    end

    def to_ary
      return @content
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    def each &block
      @csv_contents.each do |content|
        block.call(CsvRow.new(@headers, content))
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|x| puts x.one}
