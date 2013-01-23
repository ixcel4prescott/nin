class ClientsController < ApplicationController

  def create_scheduled_location
    @organization = Client.find( params[:id] )
    @location = @organization.schedulable_locations.build( params[:address] )

    respond_to do |format|

      if @location.save
        format.html { render json: @location }
        format.json { render json: @location }
      else
        format.html { render json: @location.errors, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end

    end
  end


end