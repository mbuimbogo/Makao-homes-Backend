class PropertiesController < ApplicationController
    def index
        property = Property.all
        render json: property
    end

    def show 
        property = Property.find_by(id: params[:id])
        render json: property
    end

    def create
        property = Property.create(property_params)
        if property.valid?
            render json: property, status: :created
        else
            render json: { errors: property.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        property = Property.find_by(id: params[:id])
        if property
            property.destroy
            head :no_content
        else
            render json: { error: "Property not found"}, status: :not_found
        end
    end

    private

    def property_params
    params.permit(:name, :location, :price, :image_url, :description)
    end
end