require 'debugger'
module Stock
  class Stock1
    attr_accessor :items
    def import_from_csv file
      file ||= 'stock_items.csv'
      lines = File.readlines(file)
      @items = lines.split(',')
    end

    def parse_items
      @items[1..items.length].each do |item|
        #TODO need validation
        rs = Hash.new
        rs[:id] = item[0]
        rs[:description] = item[1]
        rs[:price] = item[2]
        rs[:cost] = item[3]
        rs[:price_type] = item[4]
        rs[:quantity_on_hand] = item[5]
        rs[:modifiers] = Array.new
        item[6..item.length].each_with_index do |modifier, index|
          if index % 2 == 1
            rs_modifier = Hash.new
            rs_modifier[:name] = modifier
          else
            rs_modifier[:price] = modifier
            rs[:modifiers] << rs_modifier
          end
        end if item.length >= 7
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