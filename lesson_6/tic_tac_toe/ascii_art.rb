BOARD = <<-MSG
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
_____________|____________|_______________
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
_____________|____________|_______________
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
             |            |               
MSG

X_MARK = <<-MSG
              
    .____,    
   . \\  / ,   
   |`-  -'|   
   |,-  -.|   
   ' /__\\ `   
    '    `    
              
MSG


O_MARK = <<-MSG
              
     ____     
   ,' __ `.   
  / ,'  `. \\  
  | | () | |  
  \\ `.__,' /  
   `.____,'   
              
MSG

EMPTY_SQUARE = <<-MSG
              
              
              
              
              
              
              
              
MSG

HORIZONTAL_LINE = <<-MSG
\n______________|______________|_______________
MSG

VERTICAL_LINE = <<-MSG
|
|
|
|
|
|
|
|
MSG

def concat_lines(string1, string2)
  lines1 = string1.split("\n")
  lines2 = string2.split("\n")
  concat_lines = []

  lines1.each_with_index do |line, index|
    concat_lines << line + lines2[index]
  end

  concat_lines.join("\n")
end

def concat_many_lines(*strings)
  strings.reduce { |concat, string| concat_lines(concat, string) }
end

# puts concat_lines(X_MARK, VERTICAL_LINE)
# puts concat_lines(concat_lines(X_MARK, VERTICAL_LINE), O_MARK)
puts concat_many_lines(X_MARK, VERTICAL_LINE, O_MARK, VERTICAL_LINE, EMPTY_SQUARE) + HORIZONTAL_LINE + concat_many_lines(O_MARK, VERTICAL_LINE, O_MARK, VERTICAL_LINE, EMPTY_SQUARE) + HORIZONTAL_LINE + concat_many_lines(O_MARK, VERTICAL_LINE, X_MARK, VERTICAL_LINE, X_MARK)
