
require 'minitest/autorun'

# code here
class Diamond
  
  def self.make_diamond(str)
   
    alpha = ("A".."Z").to_a
    alpha_index = alpha.index(str)
    range = alpha.slice(0, alpha_index+1)

    inside_counter = 1

    diamond = range.map.with_index do |char, index|
      
      outside_spaces = " " * (alpha_index - index)
      
      string = "#{outside_spaces}#{char}"
      
      if char == "A"
        string += "#{outside_spaces}\n"
      else
        inside_spaces = " " * inside_counter
        inside_counter += 2
        string += "#{inside_spaces}#{char}#{outside_spaces}\n"
      end

    end

     while alpha_index > 0 do
        diamond.push(diamond[alpha_index-1])
        alpha_index-=1
      end

    # reverse_diamond = diamond.slice(0,alpha_index).reverse
    # diamond = (diamond + reverse_diamond).join("")

    diamond = diamond.join("")

    return diamond
  end
end

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal("A\n", answer)
  end

  def test_letter_b
    # -A-
    # B-B
    # -A-
    answer = Diamond.make_diamond('B')
    string = " A \nB B\n A \n"
    assert_equal string, answer
  end
 
  def test_letter_c
    # --A--
    # -B-B-
    # C---C
    # -B-B-
    # --A--
    answer = Diamond.make_diamond('C')
    string = "  A  \n B B \nC   C\n B B \n  A  \n"
    assert_equal string, answer
  end    
  
  def test_letter_e
    # ----A----
    # ---B-B---
    # --C---C--
    # -D-----D-
    # E-------E
    # -D-----D-
    # --C---C--
    # ---B-B---
    # ----A----
    answer = Diamond.make_diamond('E')
    string = "    A    \n   B B   \n  C   C  \n D     D \nE       E\n D     D \n  C   C  \n   B B   \n    A    \n"
    assert_equal string, answer
  end
end
