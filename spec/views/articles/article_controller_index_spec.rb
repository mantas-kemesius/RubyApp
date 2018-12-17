# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views

  it 'index view have title' do
    get :index
    # puts response.body.inspect
    expect(response.body.match?('<th>Title</th>')).to eq true
  end

  it 'index view have table' do
    get :index
    expect(response.body.match?('<table>')).to eq true
  end

  it 'index view have content in table labas' do
    post :create, params: { article: { title: 'labas', text: 'vakaras' } }
    get :index
    expect(response.body.match?('<td>labas</td>')).to eq true
  end

  it 'index view have content in table vakaras' do
    post :create, params: { article: { title: 'labas', text: 'vakaras' } }
    get :index
    expect(response.body.match?('<td>vakaras</td>')).to eq true
  end

  it 'index view have javascript lib files' do
    get :index
    expect(response.body.match?('<script src="js/vendor.js"></script>')).to eq true
  end

  it 'index view have javascript files' do
    get :index
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end
