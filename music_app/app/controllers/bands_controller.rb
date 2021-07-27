class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to bands_url
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        @band.delete
        redirect_to bands_url
    end 

    protected

    def band_params
        params.require(:band).permit(:name)
    end
end