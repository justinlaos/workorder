class Api::V1::PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :update, :destroy]

    def index
        @properties = Property.all
        render json: @properties
    end

    def search
        if params[:search_term].blank?
            @results = []
        else
            @results = Elasticsearch::Model
                .search(params[:search_term])
                .results.as_json
        end
        render json: @results
    end

    def show
        render json: @property
    end

    def create
        @property = Property.new(property_params)
        if @property.save
            render json: @property
        else
            render error: { error: 'error creating new property'}, status: 400
        end
    end

    def update
        if @property
            @property.update(property_params)
            render json: {message: 'Property updated'}, status: 200
        else
            render error: { error: 'error updating property'}, status: 400
        end
    end

    def destroy
        if @property
            @property.destroy
            render json: {message: 'Property deleted'}, status: 200
        else
            render error: { error: 'error deleting property'}, status: 400
        end
    end

    private

    def set_property
        @property = Property.find(params[:id])
    end

    def property_params
        params.require(:property).permit(
            :property_type, :address, :city, :state,
            :zip_code, :price, :bed_rooms, :bath_rooms,
            :square_feet, :lot_size, :year_built,
            :latitude, :longitude
        )
    end
end
