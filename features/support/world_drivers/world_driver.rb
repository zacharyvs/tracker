class WorldDriver
  attr_reader :errors

  def initialize
    @errors = []
  end

  def check_unexpected_errors
    errors.present? && fail("Unexpected errors happened:\n #{errors.join("\n")}")
  end
end
