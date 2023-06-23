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
    validate_direction(direction)
    @cursor.send(direction.to_s)
    @cursor.validate_new_position(height, width)
  end

  def validate_direction(direction)
    raise ArgumentError unless %i[up down left right].include? direction
  end
end
