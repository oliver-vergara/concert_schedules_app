class Api::V1::ConcertsController < ApplicationController

    def index
      @concerts = Concert.all
    end

    def show
      @concert = Concert.find_by(id: params[:id])
    end

    def create
      @concert = Concert.new(artist: params[:artist], genre: params[:genre], concert_date: params[:concert_date], city: params[:city], state: params[:state])
      @concert.save
      render :show
    end


    def update
      @concert = Concert.find_by(id: params[:id])
      @concert.artist = params[:artist] || @concert.artist
      @concert.genre = params[:genre] || @concert.genre
      @concert.concert_date = params[:concert_date] || @concert.concert_date
      @concert.city = params[:city] || @concert.city
      @concert.state = params[:state] || @concert.state
      render :show
    end

    def destroy
      @concert = Concert.find_by(id: params[:id])
      @concert.destroy
      render json: @concert

    end
end
