# Email info
class EmailInfo
  attr_reader :text
  def initialize(text)
    # @title = title if title.instance_of?(String)
    @text = text if text.instance_of?(String)
  end
end