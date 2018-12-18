# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MailController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    it 'returns http success' do
      get :create, params: { mail:
                                { from: 'vardauskas', to: 'vardauskaitis',
                                  title: 'test', message: 'testt' } }
      expect(response).to have_http_status(:success)
    end

    it 'VIEWS TEST: create renders view' do
      get :create, params: { mail:
                                 { from: 'vardauskas', to: 'vardauskaitis',
                                   title: 'test', message: 'testt' } }
      expect(response).to render_template(:create)
    end
    it 'task is created' do
      post :create, params: { mail: { from: 'vardauskas', to: 'vardauskaitis',
                                      title: 'test', message: 'testt' } }
      expect(Mail.find_by(from: 'vardauskas', to: 'vardauskaitis',
                          title: 'test', message: 'testt'))
        .not_to be nil
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      Mail.create
      mail = Mail.first
      get :destroy, params: { id: mail.id }
      expect(response).to have_http_status(:success)
    end

    it 'deletes mail' do
      Mail.create(from: 'vardauskas')
      mail = Mail.find_by(from: 'vardauskas')
      get :destroy, params: { id: mail.id }
      expect(Mail.find_by(from: 'vardauskas')).to be nil
    end
  end
end
