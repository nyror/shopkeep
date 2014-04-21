require 'debugger'
module Stock
  class Stock1
    attr_accessor :items
    attr_accessor :line_items

    def initialize file = 'stock_items.csv' 
      import_from_csv file
      debugger
      @items = parse_items
    end

    def import_from_csv file = 'stock_items.csv' 
      lines = File.readlines(file)
      @line_items = lines.map{|line|line.delete("\n").split(',')}
    end

    def parse_items
      @line_items[1..@line_items.length].map do |item|
        #TODO need validation
        rs = Hash.new
        rs[:id] = item[0]
        rs[:description] = item[1]
        rs[:price] = item[2]
        rs[:cost] = item[3]
        rs[:price_type] = item[4]
        rs[:quantity_on_hand] = item[5]
        rs[:modifiers] = Array.new
        rs_modifier = Hash.new
        item[6..item.length].each_with_index do |modifier, index|
          if index % 2 == 0
            rs_modifier[:name] = modifier
          else
            rs_modifier[:price] = modifier
            rs[:modifiers] << rs_modifier
            rs_modifier = Hash.new
          end
        end if item.length >= 7
        rs
      end

    end

    def to_json
      debugger

    end

    def to_xml
    end

    def to_html
    end
  end
end