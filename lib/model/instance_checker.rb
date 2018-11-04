# checks instances
class InstanceChecker
  def number_is_right?(number)
    number.instance_of?(Integer)
  end

  def check_or_array(data)
    data.instance_of?(Array)
  end

  def check_or_string_valid?(val)
    val.instance_of?(String)
  end
end