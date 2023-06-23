# frozen_string_literal: true

class Cursor
  attr_accessor :x, :y

  def initialize
    @x = 1
    @y = 1
  end

  def up
    @y += 1
  end

  def down
    @y -= 1
  end

  def left
    @x -= 1
  end

  def right
    @x += 1
  end

  def validate_new_position(height, width)
    raise RangeError unless (@x >= 1 && @y >= 1) && (@x <= height && @y <= width)
  end
end
