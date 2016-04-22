require 'rails_helper'

describe RecipesController do
  describe "GET #index" do
    it "assigns @recipes and renders the index template" do
      recipe = Recipe.create(
                        name: "Spanish Omelet",
                        description: "Delicious"
                      )

      get :index

      expect(assigns(:recipes)).to eq([recipe])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns @recipe and renders the show template" do
      recipe = Recipe.create(
                        name: "Spanish Omelet",
                        description: "Delicious"
                      )

      get :show, id: recipe.id

      expect(assigns(:recipe)).to eq(recipe)
      expect(response).to render_template("show")
    end
  end

  describe "GET #edit" do
    let(:recipe) { Recipe.create(
                      name: "Spanish Omelet",
                      description: "Delicious"
                    ) }
    before do
      get :edit, id: recipe.id
    end
    it "assigns the requested recipe as @recipe" do
      expect(assigns(:recipe)).to eq(recipe)
    end
    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) {
        { recipe: {name: "Risotto", description: "With rice."} }
      }
      it "creates a new Recipe" do
        expect {
          post :create, valid_params
        }.to change(Recipe, :count).by(1)
      end
      before do
        post :create, valid_params
      end
      it "redirects to the created recipe" do
        expect(response).to redirect_to(Recipe.last)
      end
      it "assigns a newly created recipe as @recipe" do
        expect(assigns(:recipe)).to be_a(Recipe)
        expect(assigns(:recipe)).to be_persisted
      end
    end

    context "with invalid params" do
      let(:invalid_params) {
        { recipe: {name: "Risotto", description: nil } }
      }
      before do
        post :create, invalid_params
      end
      it "assigns a newly created but unsaved recipe as @recipe" do
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end
      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:valid_params) {
  #       { recipe: {name: "Risotto", description: "With rice."} }
  #     }
  #     it "updates a selected recipe" do
  #       expect(assigns) {
  #         put :update, valid_params, id: recipe.id
  #       }.to
  #     end
  #     it "redirects to the updated recipe" do
  #       expect(response(:recipe)).to eq_to(Recipe.id)
  #     end
  #
  #   end

    # context "with invalid params" do
    #   let(:invalid_params) {
    #     { recipe: {name: "Risotto", description: nil } }
    #   }
    #
    # end
  # end
end
