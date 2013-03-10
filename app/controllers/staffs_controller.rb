class StaffsController < ApplicationController
  # GET /staffs
  # GET /staffs.json
  def index
    if session[:admin] == nil
      redirect_to rooms_path
    else   
      @rooms = Room.all
      @admin = session[:admin]
    end
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    if session[:admin] == nil
      redirect_to rooms_path
    else
      @room = Room.find(params[:id])
    end
   # @staff = Staff.find(params[:id])

    #respond_to do |format|
     # format.html # show.html.erb
      #format.json { render json: @staff }
    #end
  end

  # GET /staffs/new
  # GET /staffs/new.json
  def new
   
    #@staff = Staff.new

    #respond_to do |format|
      #format.html # new.html.erb
     # format.json { render json: @staff }
    #end
  end

  # GET /staffs/1/edit
  def edit
    if session[:admin] == nil
      redirect_to rooms_path
    else   
      @room = Room.find(params[:id])
    end
    #@staff = Staff.find(params[:id])
  end

  # POST /staffs
  # POST /staffs.json
  def create
 #   @staff = Staff.new(params[:staff])

  #  respond_to do |format|
   #   if @staff.save
    #    format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
     #   format.json { render json: @staff, status: :created, location: @staff }
     # else
      #  format.html { render action: "new" }
       # format.json { render json: @staff.errors, status: :unprocessable_entity }
     # end
    #end
  end

  # PUT /staffs/1
  # PUT /staffs/1.json
  def update
   
   # @staff = Staff.find(params[:id])

    #respond_to do |format|
     # if @staff.update_attributes(params[:staff])
       # format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
      #  format.json { head :no_content }
     # else
       # format.html { render action: "edit" }
      #  format.json { render json: @staff.errors, status: :unprocessable_entity }
     # end
    #end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    #@staff = Staff.find(params[:id])
    #@staff.destroy

    #respond_to do |format|
     # format.html { redirect_to staffs_url }
      #format.json { head :no_content }
   # end
  end
  
  def login
    if session[:admin] != nil
      redirect_to staffs_path
    end    
  end

  def submit
    #@uname = Staff.find_by_username(params[:username])
    @user = params[:staff]
    @uname = Staff.find_by_username(@user["username"])
  
    if @user["username"]==""
      redirect_to login_path
    end
    if @uname == nil || @uname.password != @user["password"]
      flash[:notice] = "can not login"
      redirect_to login_path
    else
      session[:admin] = @uname.username
      flash[:notice] = "login successfully"
      redirect_to staffs_path
    end
  end
  
  def logout
    session[:admin] = nil
    redirect_to rooms_path
  end

end
