class GameOfGolf
  attr_reader :player_name, :course, :score_total

  def get_player_name
    print "Player Name: "
    @player_name = gets.chomp
  end

  def play_round(course)
    @course = course
    course.play
    @score_total = course.score
  end
end

class Course
  attr_reader :holes

  def initialize(holes)
    @holes = holes
  end

  def play
    holes.each {|hole| hole.play }
  end

  def score
    holes.map(&:score).inject(&:+)
  end
end

class Hole
  attr_reader :par, :score

  def initialize(par)
    @par = par
  end

  def play
    @score = rand(3..10)
  end
end
