# checks instances
class InstanceChecker
  def initialize(value)
    @value = value
  end

  def number_is_right?
    @value.instance_of?(Integer)
  end

  def check_or_array
    @value.instance_of?(Array)
  end

  def check_or_string_valid?
    @value.instance_of?(String)
  end
end
