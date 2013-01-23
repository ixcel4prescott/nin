class InterpretersController < ApplicationController
  # GET /interpreters
  # GET /interpreters.json
  def index
    @interpreters = Interpreter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interpreters }
    end
  end

  # GET /interpreters/1
  # GET /interpreters/1.json
  def show
    @interpreter = Interpreter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interpreter }
    end
  end

  # GET /interpreters/new
  # GET /interpreters/new.json
  def new
    @interpreter = Interpreter.new
    #@interpreter.notes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interpreter }
    end
  end

  # GET /interpreters/1/edit
  def edit
    @interpreter = Interpreter.find(params[:id])
  end

  # POST /interpreters
  # POST /interpreters.json
  def create
    @interpreter = Interpreter.new(params[:interpreter])

    respond_to do |format|
      if @interpreter.save
        format.html { redirect_to @interpreter, notice: 'Interpreter was successfully created.' }
        format.json { render json: @interpreter, status: :created, location: @interpreter }
      else
        format.html { render action: "new" }
        format.json { render json: @interpreter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /interpreters/1
  # PUT /interpreters/1.json
  def update
    @interpreter = Interpreter.find(params[:id])

    respond_to do |format|
      if @interpreter.update_attributes(params[:interpreter])
        format.html { redirect_to @interpreter, notice: 'Interpreter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interpreter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interpreters/1
  # DELETE /interpreters/1.json
  def destroy
    @interpreter = Interpreter.find(params[:id])
    @interpreter.destroy

    respond_to do |format|
      format.html { redirect_to interpreters_url }
      format.json { head :no_content }
    end
  end
end
