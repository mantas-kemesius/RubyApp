# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LecturesController, type: :controller do
  render_views

  before do
    post :create, params: {
      lecture: { teacher: 'teach@gmail.com', id: '201812',
                 status: 'Active', name: 'Komparch', credits: 5 }
    }
  end

  it 'have add new email link' do
    get :index
    expect(response.body.match?('<title>WebApp</title>')).to eq true
  end

  it 'have span' do
    get :index
    expect(
      response.body.match?('>your lectures: </')
    ).to eq true
  end

  it 'have mail from value' do
    post :create,
         params: { lecture: { teacher: 'teach@gmail.com', id: '201812',
                              status: 'Active', name: 'Komparch', credits: 5 } }
    get :index
    expect(response.body.match?('Active 5')).to eq true
  end

  it 'have mail message value' do
    post :create,
         params: { lecture: { teacher: 'teach@gmail.com', id: '201812',
                              status: 'Active', name: 'Komparch', credits: 5 } }
    get :index
    expect(response.body.match?('Komparch')).to eq true
  end

  it 'index view have javascript lib files' do
    get :index
    expect(response.body.match?('<script src="js/vendor.js"></script>'))
      .to eq true
  end

  it 'index view have javascript files' do
    get :index
    expect(response.body.match?('<script src="js/app.js"></script>')).to eq true
  end
end
