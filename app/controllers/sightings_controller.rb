class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings
    end
    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end
    def destroy
        sighting = sighting.find(params[:id])
        if sighting.destroy
            render json: sighting
        else
            render json: sighting.errors
        end
    end

    def update
        sighting = sighting.find(params[:id])
        sighting.update(sighting)
        if sighting.valid?
            render json: sighting
        else
            render json: sighting.errors
        end
    end


    private
    def sighting_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
        # make sure to have all key symbols referenced when creating new entries, or params won't be met.
    end
end
