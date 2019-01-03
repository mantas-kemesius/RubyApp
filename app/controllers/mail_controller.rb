# frozen_string_literal: true

# mail controller
# :reek:InstanceVariableAssumption
class MailController < ApplicationController
  def index
    @mails = Mail.all
  end

  # :reek:FeatureEnvy
  def create
    return unless params.key?(:mail)

    email = params.fetch(:mail)
    Mail.create(
      from: email.fetch(:from), to: email.fetch(:to),
      title: email.fetch(:title), message: email.fetch(:message)
    )
  end

  def destroy
    @mail = Mail.find_by(nil)
    @mail.destroy
  end
end
