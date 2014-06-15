require 'rails_helper'

RSpec.describe FieldTripsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # FieldTrip. As you add validations to FieldTrip, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FieldTripsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all field_trips as @field_trips" do
      field_trip = FieldTrip.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:field_trips)).to eq([field_trip])
    end
  end

  describe "GET show" do
    it "assigns the requested field_trip as @field_trip" do
      field_trip = FieldTrip.create! valid_attributes
      get :show, {:id => field_trip.to_param}, valid_session
      expect(assigns(:field_trip)).to eq(field_trip)
    end
  end

  describe "GET new" do
    it "assigns a new field_trip as @field_trip" do
      get :new, {}, valid_session
      expect(assigns(:field_trip)).to be_a_new(FieldTrip)
    end
  end

  describe "GET edit" do
    it "assigns the requested field_trip as @field_trip" do
      field_trip = FieldTrip.create! valid_attributes
      get :edit, {:id => field_trip.to_param}, valid_session
      expect(assigns(:field_trip)).to eq(field_trip)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FieldTrip" do
        expect {
          post :create, {:field_trip => valid_attributes}, valid_session
        }.to change(FieldTrip, :count).by(1)
      end

      it "assigns a newly created field_trip as @field_trip" do
        post :create, {:field_trip => valid_attributes}, valid_session
        expect(assigns(:field_trip)).to be_a(FieldTrip)
        expect(assigns(:field_trip)).to be_persisted
      end

      it "redirects to the created field_trip" do
        post :create, {:field_trip => valid_attributes}, valid_session
        expect(response).to redirect_to(FieldTrip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved field_trip as @field_trip" do
        post :create, {:field_trip => invalid_attributes}, valid_session
        expect(assigns(:field_trip)).to be_a_new(FieldTrip)
      end

      it "re-renders the 'new' template" do
        post :create, {:field_trip => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested field_trip" do
        field_trip = FieldTrip.create! valid_attributes
        put :update, {:id => field_trip.to_param, :field_trip => new_attributes}, valid_session
        field_trip.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested field_trip as @field_trip" do
        field_trip = FieldTrip.create! valid_attributes
        put :update, {:id => field_trip.to_param, :field_trip => valid_attributes}, valid_session
        expect(assigns(:field_trip)).to eq(field_trip)
      end

      it "redirects to the field_trip" do
        field_trip = FieldTrip.create! valid_attributes
        put :update, {:id => field_trip.to_param, :field_trip => valid_attributes}, valid_session
        expect(response).to redirect_to(field_trip)
      end
    end

    describe "with invalid params" do
      it "assigns the field_trip as @field_trip" do
        field_trip = FieldTrip.create! valid_attributes
        put :update, {:id => field_trip.to_param, :field_trip => invalid_attributes}, valid_session
        expect(assigns(:field_trip)).to eq(field_trip)
      end

      it "re-renders the 'edit' template" do
        field_trip = FieldTrip.create! valid_attributes
        put :update, {:id => field_trip.to_param, :field_trip => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested field_trip" do
      field_trip = FieldTrip.create! valid_attributes
      expect {
        delete :destroy, {:id => field_trip.to_param}, valid_session
      }.to change(FieldTrip, :count).by(-1)
    end

    it "redirects to the field_trips list" do
      field_trip = FieldTrip.create! valid_attributes
      delete :destroy, {:id => field_trip.to_param}, valid_session
      expect(response).to redirect_to(field_trips_url)
    end
  end

end
