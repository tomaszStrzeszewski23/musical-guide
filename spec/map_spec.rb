# frozen_string_literal: true
class NonExistingCursorError < StandardError; end
require_relative './test_helper'
require_relative './../lib/map'
require_relative './../lib/cursor'

@cursor = Cursor.new
@map = Map.new(5, 5)
@map.new_cursor
@map.new_cursor

def test_map
  Assert.assert_equal(false) { @map.nil? }
  Assert.assert_equal(false) { @map.cursor.nil? }
  Assert.assert_equal(false) { @map.additional_cursors[0].nil? }
  Assert.assert_equal(false) { @map.additional_cursors[1].nil? }
  Assert.assert_equal(true) { @map.additional_cursors[2].nil? }
  Assert.assert_equal(5) { @map.height }
  Assert.assert_equal(5) { @map.width }
end

def test_cursor
  Assert.assert_equal(1) { @cursor.x }
  Assert.assert_equal(1) { @cursor.y }
end

def test_multiple_cursors
  Assert.assert_equal(1) { @map.additional_cursors[0].x }
  Assert.assert_equal(1) { @map.additional_cursors[0].y }
end

def test_moves
  Assert.assert_equal(2) do
    @map.move(:right, 0)
    @map.additional_cursors[0].x
  end

  Assert.assert_equal(2) do
    @map.move(:right)
    @map.cursor.x
  end

  Assert.assert_equal(2) do
    @map.move(:up)
    @map.cursor.y
  end

  @map.cursor.x = 2
  @map.cursor.y = 2

  Assert.assert_equal(1) do
    @map.move(:down)
    @map.cursor.y
  end

  Assert.assert_equal(1) do
    @map.move(:left)
    @map.cursor.x
  end
end

def test_invalid_cases
  test_invalid_coord_x
  test_invalid_coord_y
  test_invalid_cursor_ind
  Assert.assert_error(ArgumentError) { @map.move(:nowhere) }
end

def test_invalid_coord_x
  @map.cursor.x = 1
  Assert.assert_error(RangeError) { @map.move(:left) }
  @map.cursor.x = 5
  Assert.assert_error(RangeError) { @map.move(:right) }
end

def test_invalid_coord_y
  @map.cursor.y = 5
  Assert.assert_error(RangeError) { @map.move(:up) }
  @map.cursor.y = 1
  Assert.assert_error(RangeError) { @map.move(:down) }
end

def test_invalid_cursor_ind
  Assert.assert_error(NonExistingCursorError) { @map.move(:right, 2) }
end

test_map
test_cursor
test_multiple_cursors
test_moves
test_invalid_cases
