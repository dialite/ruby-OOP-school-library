require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name.strip.slice(0..10) unless @nameable.correct_name.strip.length > 10
  end
end
