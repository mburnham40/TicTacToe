# git@github.com:mburnham40/TicTacToe.git


class Grid
    attr_accessor :h0, :h1, :h2, :h3, :grid

    def initialize
        @h0 = ['* ', '1 ', '2 ', '3 ']
        @h1 = ['1 ', '- ', '- ', '- ']
        @h2 = ['2 ', '- ', '- ', '- ']
        @h3 = ['3 ', '- ', '- ', '- ']
        @grid = [@h0, @h1, @h2, @h3]
    end

    def draw
        vert_ind = 0
        while vert_ind < 4
            row = grid[vert_ind].join('')
            puts row
            vert_ind += 1
        end
    end

    def update(vert, horiz, current)
            grid[vert][horiz] = "#{current} "
    end
end

class Current
    attr_accessor :i_am
    def initialize
        @i_am = "nothing yet"
    end
    def what_am_i?(counter)
        if (counter % 2 == 0)
            @i_am = "X"
        else
            @i_am = "O"
        end
        i_am
    end
end

class WinnerCheck
    attr_accessor :marker, :mesh
    def initialize(marker, mesh)
        @marker = marker
        @mesh = mesh
    end
    def won(passedVal)
        if ((mesh[1][1] == passedVal) && (mesh[1][2] == passedVal) && (mesh[1][3] == passedVal))
            return true
        elsif ((mesh[2][1] == passedVal) && (mesh[2][2] == passedVal) && (mesh[2][3] == passedVal))
            return true
        elsif ((mesh[3][1] == passedVal) && (mesh[3][2] == passedVal) && (mesh[3][3] == passedVal))
            return true
        elsif ((mesh[1][1] == passedVal) && (mesh[2][1] == passedVal) && (mesh[3][1] == passedVal))
            return true
        elsif ((mesh[1][2] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][2] == passedVal))
            return true
        elsif ((mesh[1][3] == passedVal) && (mesh[2][3] == passedVal) && (mesh[3][3] == passedVal))
            return true
        elsif ((mesh[1][3] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][1] == passedVal))
            return true
        elsif ((mesh[1][1] == passedVal) && (mesh[2][2] == passedVal) && (mesh[3][3] == passedVal))
            return true
        else
            return false
        end
    end
    puts ""
end

puts ""
puts "Here's the blank grid!"
puts ""
my_grid = Grid.new
my_counter = 0
my_grid.draw
puts ""
player = Current.new

while my_counter < 9
    current_player = player.what_am_i?(my_counter)
    is_empty = false
    puts "**************************************"
    puts ""
    puts "It is player #{current_player}'s turn!"
    puts ""
    
    while (is_empty == false)
        puts "What row between 1 and 3?"
        vertical = gets.chomp
        while !((vertical == "3") || (vertical == "2") || (vertical == "1"))
            puts ""
            puts "Invalid input, try entering your row again!"
            vertical = gets.chomp
        end
        puts ""
        puts "What column between 1 and 3?"
        horizontal = gets.chomp
        while !((horizontal == "3") || (horizontal == "2") || (horizontal == "1"))
            puts ""
            puts "Invalid input, try entering your row again!"
            horizontal = gets.chomp
        end
        occupied = my_grid.grid[vertical.to_i][horizontal.to_i]
        if (occupied == '- ')
            is_empty = true
        end
        if (is_empty == false)
            puts ""
            puts "That space is already taken!  Try picking an available space this time:"
            puts ""
            next
        else
            my_grid.update(vertical.to_i, horizontal.to_i, current_player)
            puts ""
        end
    end
    
    
    puts ""
    puts "Here is the updated grid: "
    puts ""
    
    my_grid.draw
    status = WinnerCheck.new(current_player, my_grid.grid)
    tar = "#{current_player} "
    puts ""
    did_win = status.won(tar)
    if did_win == true
        puts ""
        puts "**************************************"
        puts " Congratulations player #{current_player}, you won!!!"
        puts "**************************************"
        puts ""
        break
    end
    my_counter += 1
end
if did_win == false
    puts ""
    puts "**************************************"
    puts " It's a draw, no winner, no loser."
    puts "**************************************"
    puts ""
end