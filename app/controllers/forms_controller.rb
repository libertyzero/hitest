class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all

    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])

    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new

    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])
    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    @roomtype = DetailRoom.all_types
    @time = Room.all_times
    @time.push("All Free Time")
    @day_list = Room.all_days
    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end
end