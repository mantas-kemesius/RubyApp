# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  it 'index view have label' do
    get :new
    expect(response.body.match?('<label for="article_text">Text</label>')).to eq true
  end

  it 'index view have textarea input' do
    get :new
    expect(response.body.match?('<textarea')).to eq true
  end

  it 'index view have submit button' do
    get :new
    expect(
      response.body.match?(
        '<input type="submit"'
      )
    ).to eq true
  end

  it 'index view have form with post method' do
    get :new
    expect(
      response.body.match?(
        '<form action="/articles" accept-charset="UTF-8" method="post">'
      )
    ).to eq true
  end

  it 'index view have javascript lib files' do
    get :new
    expect(response.body.match?('<script src="js/vendor.js"></script>')).to eq true
  end

  it 'index view have javascript files' do
    get :new
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end
