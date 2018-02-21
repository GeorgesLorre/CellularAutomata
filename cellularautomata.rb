class CellularAutomata
  def initialize(rule, width = 100, runs = 40, symbol = "1", antisymbol = "0")
    @symbol = symbol
    @antisymbol = antisymbol
    @width = width
    @seed = " "*(@width/2) + "1" + " "*(@width/2)
    @runs = runs
    @rule = rule.to_s(2).rjust(8, "0").reverse
  end

  def write_lines
    p @seed.gsub("1", @symbol).gsub("0", @antisymbol)
    line = @seed
    @runs.times do
      newline = " "*(@width+1)
      line.chars.to_a.each_with_index do |x, i|
        if 0 < i && i < line.size - 1
         j = (line[i-1]+ line[i] + line[i+1]).to_i(2)
         newline[i] = @rule[j]
        end
      end
      line = newline
      p newline.gsub("0", @antisymbol).gsub("1", @symbol)
    end
  end

end

CellularAutomata.new(182).write_lines


