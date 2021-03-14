require 'spec_helper'

describe ArticlesController do
  describe 'index' do
    it 'parsing news from hack-news best' do
      get :index
      expect(assigns(:articles)).not_to be_empty
    end

    it 'render index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
