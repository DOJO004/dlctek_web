require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create(title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true)
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      product = Product.create(title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true)
      get :edit, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: { product: { title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true } }
        }.to change(Product, :count).by(1)
      end

      it "redirects to the created product" do
        post :create, params: { product: { title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true } }
        expect(response).to redirect_to(dashboard_path)
      end
    end                                                                                                                                         
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:product) { Product.create(title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true) }

      it "updates the requested product" do
        patch :update, params: { id: product.to_param, product: { title: "New Title" } }
        product.reload
        expect(product.title).to eq("New Title")
      end

      it "redirects to the product" do
        patch :update, params: { id: product.to_param, product: { title: "New Title" } }
        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create(title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true)
      expect {
        delete :destroy, params: { id: product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create(title: "Test Product", descript: "This is a test product", price: 10.99, amount: 10, status: true)
      delete :destroy, params: { id: product.to_param }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
