class Api::V1::PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :update, :destroy]

    # GET /properties
    def index
        @properties = Property.all
        render json: @properties
    end

    # GET /property/:id
    def show
        render json: @property
    end

    # POST /properties
    def create
        @property = Property.new(property_params)
        if @property.save
            render json: @property
        else
            render error: { error: 'error creating new property'}, status: 400
        end
    end

    # PUT /properties/:id
    def update
        if @property
            @property.update(property_params)
            render json: {message: 'Property updated'}, status: 200
        else
            render error: { error: 'error updating property'}, status: 400
        end
    end

    # DELETE /properties/:id
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
