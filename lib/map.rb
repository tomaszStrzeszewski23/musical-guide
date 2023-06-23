# frozen_string_literal: true

require_relative './cursor'

class Map
  attr_reader :height, :width, :cursor
  def initialize(height, width)
    @height = height
    @width  = width
    @cursor = Cursor.new
  end

  def move(direction)
    case direction
    when :up
      @cursor.up
    when :down
      @cursor.down
    when :left
      @cursor.left
    when :right
      @cursor.right
    else
      raise ArgumentError
    end
  @cursor.validate_new_position(height, width)
  end
end
