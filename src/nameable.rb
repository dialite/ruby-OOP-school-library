class Nameable
  def correct_name
    raise NotImplementedError, "Please note! #{self.class} did not implement method '#{__method__}'"
  end
end
