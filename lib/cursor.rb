# frozen_string_literal: true

class Cursor
  attr_accessor :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def up
    @y -= 1
  end

  def down
    @y += 1
  end

  def left
    @x -= 1
  end

  def right
    @x += 1
  end

  def validate_new_position(height, width)
    raise RangeError unless (@x >= 0 && @y >= 0) && (@x < height && @y < width)
  end
end
