class Players
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lostLife
    @lives -= 1
  end

  def is_dead
    @lives == 0
  end

end