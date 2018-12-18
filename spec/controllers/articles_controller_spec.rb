# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  it 'covers mutation +super' do
    expect_any_instance_of(ArticlesController).not_to receive(:initialize)
    get :index
  end

  context 'when params[:article] is not present' do
    before { post :show }

    it 'does not assign a message' do
      expect(assigns(:article)).to be_nil
    end
  end

  context 'when params[:article] is present' do
    before { post :show, params: { article: 'great test!' } }

    it 'assigns the message from params' do
      expect(assigns(:article)).to eq 'great test!'
    end
  end

  context 'when creating' do
    it 'assigns the message from params' do
      post :create, params: { article: { title: 'new', text: 'geras' } }
      expect(Article.find_by(title: 'new')).not_to be nil
    end
  end

  context 'when creating' do
    it 'assigns the message from params' do
      post :create, params: { article: { title: 'new1', text: 'geras2' } }
      artic = Article.find_by(title: 'new1')
      articleid = '/articles/' + artic.id.to_s
      expect(response).to redirect_to(articleid)
    end
  end

  context 'when indexing' do
    it 'get index success' do
      get :index
      assert_response :success
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end

    render_views
    it 'renders index' do
      post :create, params: { article: { title: 'new1', text: 'geras2' } }
      get :index

      bodytest = response.body.match?('new1') &&
                 response.body.match?('geras2')
      expect(bodytest).to be true
    end
  end
end
