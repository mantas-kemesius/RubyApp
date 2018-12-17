# frozen_string_literal: true

# mail controller
class MailController < ApplicationController
  def index
    @mails = Mail.all
  end

  def create
    return unless params.key?(:mail)

    email = params.fetch(:mail)
    Mail.create(
      from: email.fetch(:from), to: email.fetch(:to),
      title: email.fetch(:title), message: email.fetch(:message)
    )
  end

  def destroy
    Mail.find_by(id: params.fetch(:id)).destroy
  end
end
