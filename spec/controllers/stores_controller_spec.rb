require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  let(:invalid_attributes) {
    attributes_for(:store, store_name: nil, store_address: nil, store_postcode: nil, store_state: nil, store_phone: nil)
  }

  let(:valid_attributes) {
    attributes_for(:store)
  }

  describe "GET #show" do
    it "assigns the requested store to @store" do
      store = create(:store)
      get :show, params: {id: store.to_param}
      expect(assigns(:store)).to eq store
    end

    it "renders the :show template" do
      store = create(:store)
      get :show, params: {id: store.to_param}
      expect(response).to render_template :show
    end
  end

  describe "GET #index" do
    it "populates an array of all stores" do
      store = create(:store)
      get :index, params: {}
      expect(assigns(:stores)).to eq([store])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new store as @store" do
      get :new
      expect(assigns(:store)).to be_a_new(Store)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested store as @store" do
      store = create(:store)
      get :edit, params: {id: store.to_param}
      expect(assigns(:store)).to eq store
    end

    it "renders the :edit template" do
      store = create(:store)
      get :edit, params: {id: store.to_param}
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new store and save it to the database" do
        expect {
          post :create, params: {store: valid_attributes}
        }.to change(Store, :count).by 1
      end

      it "redirects to store#show" do
        post :create, params: {store: attributes_for(:store, valid_attributes)}
        expect(response).to redirect_to store_path(assigns[:store])
      end
    end

    context "with invalid params" do
      it "does not create a new store and don't save it to the database" do
        expect {
          post :create, params: {store: invalid_attributes}
        }.not_to change(Store, :count)
      end

      it "re-renders to the :new template" do
        post :create, params: {store: attributes_for(:store, invalid_attributes)}
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) {
      attributes_for(:store, store_name: "test store", store_address: "kota bharu", store_postcode: 12345, store_state: "kelantan", store_phone: "012345678")
    }

    context "with valid params" do
      it "locates the requested store" do
        store = create(:store, valid_attributes)
        put :update, params: {id: store.to_param, store: valid_attributes}
        expect(assigns(:store)).to eq store
      end

      it "changes store as @store" do
        store = create(:store, valid_attributes)
        put :update, params: {id: store.to_param, store: attributes_for(:store, new_attributes)}
        store.reload
        expect(assigns(:store)).to eq store
      end

      it "redirects to the store" do
        store = create(:store, valid_attributes)
        put :update, params: {id: store.to_param, store: valid_attributes}
        expect(response).to redirect_to store
      end
    end

    context "with invalid params" do
      it "does not change the store's attributes" do
        store = create(:store, valid_attributes)
        put :update, params: {id: store.to_param, store: invalid_attributes}
        expect(assigns(:store)).to eq store
      end

      it "re-renders the :edit template" do
        store = create(:store, valid_attributes)
        put :update, params: {id: store.to_param, store: invalid_attributes}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the requested store" do
      store = create(:store, valid_attributes)
      expect {
        delete :destroy, params: {id: store.to_param}
      }.to change(Store, :count).by -1
    end

    it "redirects to the stores list (index page)" do
      store = create(:store, valid_attributes)
      delete :destroy, params: {id: store.to_param}
      expect(response).to redirect_to stores_url
    end
  end
end
