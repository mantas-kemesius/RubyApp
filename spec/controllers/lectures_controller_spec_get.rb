# frozen_string_literal: true

require_relative '../rails_helper'

describe LecturesController do
  render_views

  it 'renders form only' do
    get :create
    expect(response.body).to match('"submit" name="commit" value="Create"')
  end

  it 'sets the variable on page loading' do
    sign_in(User.find_by(email: 'teach@gmail.com'))
    get :index
    expect(assigns(:lectures)).not_to be nil
  end

  it 'load lectures' do
    sign_in(User.find_by(email: 'teach@gmail.com'))
    get :index
    expect(response.body).to match('|201050| act8 In progress 200.0')
  end

  it 'covers mutation manager: nil/"" ' do
    sign_in(User.find_by(email: 'teach@gmail.com'))
    get :index
    expect(assigns(:lectures).first.name).to eq 'Tomas'
  end
end