class LineAnalyzer
  # highest_wf_count - calc max number of occurrences for a single word 
  # highest_wf_words - calc words with max occurences
  # content          - the string analyzed
  # line_number      - the line number analyzed
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize(content, line_number) 
    @content = content
    @line_number = line_number
    calculate_word_frequency
  end

  # calculate highest_wf_count, store words into highest_wf_words
  def calculate_word_frequency() 
    content_hash = Hash.new(0)

    @content.split(" ").each do |element|
      content_hash[element.downcase]+=1
    end

    @highest_wf_count = content_hash.max_by { |k, v| v }[1]

    @highest_wf_words = content_hash.select { |k, v| content_hash[k] == @highest_wf_count}.keys
  end
end


#  Implement a class called Solution. 
class Solution
  # analyzers - array of LineAnalyzer objects for each line in the file
  # highest_count_across_lines - max value for highest_wf_words 
  # highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize()
    @analyzers = Array.new
  end

  def analyze_file()
    File.open("test.txt", "r") do |f|
      count = 0
      f.each_line do |line|
        @analyzers << LineAnalyzer.new(line, count)
        count+=1
      end
    end
  end

  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and highest_count_words_across_lines attribute values
  def calculate_line_with_highest_frequency()
    @highest_count_across_lines = @analyzers.map { |element| element.highest_wf_count }.max
    @highest_count_words_across_lines = @analyzers.select { |element| element.highest_wf_count == @highest_count_across_lines}
  end

  def print_highest_word_frequency_across_lines()
    puts "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each { |analyzer|
      puts "#{analyzer.highest_wf_words} (appears in line # #{analyzer.line_number}"
    }
  end
end