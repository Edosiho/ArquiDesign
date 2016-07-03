# File name: table_generator.rb
# Date: 27-Jan-2016
# Authors:
#          A01165829 Eduardo Rodriguez Ruiz


class TableGenerator

  def initialize(header, data)
    @header = header
    @data = data
  end

  def generate
    generate_header_row + (@data.map {|x| generate_row(x)}).join + generate_footer
  end

  def generate_header_row
    (@header.map {|x| generate_header_item(x)}).join
  end

  def generate_item(item)
    item
  end

  def generate_row(row)
    (row.map {|x| generate_item(x)}).join
  end

  def generate_header_item(item)
    item
  end
  def generate_footer
    ""
  end

end

class CSVTableGenerator < TableGenerator

  def generate_row(row)
    "#{(row.map {|x| generate_item(x)}).join(',')}\n"
  end

  def generate_header_row
    generate_row(@header)
  end

end
class HTMLTableGenerator < TableGenerator
  def generate_row(row)
     "<tr>" + "#{(row.map {|x| "<td>"+ generate_item(x.to_s)}).join('</td>')}</td></tr>\n"
  end
  
  def generate_header_row
     "<table>\n" + "<tr>" + "#{(@header.map {|x| "<th>"+ generate_item(x.to_s)}).join('</th>')}</th></tr>\n"
  end
  def generate_footer
    "</table>\n"
  end

end
class AsciiDocTableGenerator < TableGenerator
  def generate_row(row)
    "#{(row.map {|x| "|"+ generate_item(x.to_s)}).join()}\n"
  end
  def generate_header_row
    "[options=\"header\"]\n" +"|==========\n" +"#{(@header.map {|x| "|"+ generate_item(x.to_s)}).join()}\n"
  end
  def generate_footer
     "|==========\n"
  end
end
