# frozen_string_literal: true

# Text class for notifications
class Text
  attr_reader :title, :text

  def initialize(title, text)
    @title = title
    @text = text
  end
end
