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
_____________|____________|_______________
MSG

VERTICAL_LINE = <<-MSG
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

puts concat_lines(X_MARK, VERTICAL_LINE)
