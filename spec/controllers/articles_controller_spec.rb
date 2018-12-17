# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  it 'covers mutation +super' do
    expect_any_instance_of(ArticlesController).not_to receive(:initialize)
    get :index
  end
end
