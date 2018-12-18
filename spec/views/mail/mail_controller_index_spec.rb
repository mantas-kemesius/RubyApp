# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MailController, type: :controller do
  render_views

  it 'have add new email link' do
    get :index
    expect(
      response.body.match?('<a href="/mail/create">Add new email</a>')
    ).to eq true
  end

  it 'have span' do
    get :index
    expect(
      response.body.match?('<span class="txt-highl">All emails:</span>')
    ).to eq true
  end

  it 'have mail from value' do
    post :create, params: { mail:
                               { from: 'vardauskas', to: 'vardauskaitis',
                                 title: 'test', message: 'testt' } }
    get :index
    expect(response.body.match?('vardauskas')).to eq true
  end

  it 'have mail to value' do
    post :create, params: { mail:
                                { from: 'vardauskas', to: 'vardauskaitis',
                                  title: 'test', message: 'testt' } }
    get :index
    expect(response.body.match?('vardauskaitis')).to eq true
  end

  it 'have mail title value' do
    post :create, params: { mail:
                                { from: 'vardauskas', to: 'vardauskaitis',
                                  title: 'test', message: 'testt' } }
    get :index
    expect(response.body.match?('test')).to eq true
  end

  it 'have mail message value' do
    post :create, params: { mail:
                                { from: 'vardauskas', to: 'vardauskaitis',
                                  title: 'test', message: 'testt' } }
    get :index
    expect(response.body.match?('testt')).to eq true
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
