class Player
  def initialize(name)
    @name = name
  end 
end

# 人類玩家的類別
class Human < Player
  def get_gesture
    input = gets.chomp
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS

  def initialize

    show_message
  
  end

  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "|===============================================|" 
    puts "|       Welcome to Rock Paper Scissors!!!       |"
    puts "|===============================================|"

    # 填入名字
    puts "Please enter your name."
    @name = gets.chomp
  end



  def get_player_gestures
    #取得玩家和電腦兩個物件的

    puts "Please choose one of the following: R / P / S" # R / P / S 選一個
    
    #玩家
    @human = Human.new(@name)
    @human_input = @human.get_gesture

    #電腦
    @computer = Computer.new("Com")
    @computer_input = @computer.get_gesture

    #印出來
    puts "你出：#{@human_input} ／ 電腦出：#{@computer_input}" 
    
  end

  
  def decide
    #邏輯判斷式
    hash = {
      "R"=>"P",
      "P"=>"S",
      "S"=>"R"
    }

    if hash[@human_input] == @computer_input
      puts "嫩咖～你輸了！"
    elsif hash[@computer_input] == @human_input
      puts "算你厲害，你贏了！"
    else
      puts "竟然平手！"
    end


  end

  def continue?
    #判斷玩家是否要繼續下一輪
    begin
      puts 'Play Again?: Y / N'
      @continue = gets.chomp.upcase
    end while !["Y", "N"].include?(@continue)

  end

  def show_message
    #印出結果
    intro

    begin
      get_player_gestures
      decide
      continue?
    end while @continue == 'Y'

    puts "|===============================================|" 
    puts "|         Good Bye! Thanks for playing!         |"
    puts "|===============================================|"
  end

end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new
