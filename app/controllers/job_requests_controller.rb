class JobRequestsController < ApplicationController

  uses_an_organization!

  # GET /job_requests/new
  def new
    @locations = @organization.schedulable_locations
    @job_request = @organization.job_requests.build
    @job_request.build_physical_address
    @job_request.build_virtual_address
    @certifications = Certification.active.all
    @job_types = JobType.all
  end

  # POST /job_requests/interpreters_available.json
  def interpreters_available
    addy = Address.new params[:job_request][:physical_address_attributes]
    time = Date.parse params[:job_request][:start_datetime]
    duration = params[:job_request][:duration_in_hours].to_f
    gender = params[:gender]

    @interpreters = Interpreter.
        willing_to_travel_to( addy.full_address ).
        available_between_the_times( time, time + duration.hours ).
        with_gender( gender ).
        all

    respond_to do |format|
      format.json { render json: @interpreters }
    end
  end


  # POST /job_requests
  # POST /job_requests.json
  def create
    @job_request = @organization.job_requests.build( params[ :job_request ] )

    if params[:add_to_address_book]
      location = @organization.schedulable_locations.build( params[ :job_request ][:physical_address_attributes] )
      location.save!
    end

    respond_to do |format|
      if @job_request.save
        format.html { redirect_to root_path, notice: "Job Request Created" }
        format.json { render json: @job_request }
      else
        format.html { render action: "new" }
        format.json { render json: @job_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_requests/1
  # PUT /job_requests/1.json
  def update
    begin
      @job_request = @organization.job_requests.find( params[ :id ] )
    rescue ActiveRecord::RecordNotFound
      @job_request = nil
    end

    respond_to do |format|
      if @job_request && @job_request.update_attributes( params[ :job_request ] )
        format.html { redirect_to root_path, notice: "Job Requests Updated Successfully"}
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: "Update Failed" }
        format.json { render json: @job_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_location

  end

end