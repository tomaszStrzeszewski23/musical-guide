# frozen_string_literal: true

require_relative './cursor'

class Map
  attr_reader :height, :width, :cursor, :additional_cursors

  def initialize(height, width)
    @height = height
    @width  = width
    # to not crash the whole program, it will be 'basic cursor'
    @cursor = Cursor.new
    # and these are additional ones
    @additional_cursors = []
  end

  def new_cursor
    @additional_cursors << Cursor.new
  end

  def move(direction, index = -1)
    validate_direction(direction)

    if index >= 0 && @additional_cursors[index]
      @additional_cursors[index].send(direction.to_s)
      @additional_cursors[index].validate_new_position(height, width)
    elsif index >= 0
      raise RangeError
    else
      @cursor.send(direction.to_s)
      @cursor.validate_new_position(height, width)
    end
  end

  def validate_direction(direction)
    raise ArgumentError unless %i[up down left right].include? direction
  end
end
