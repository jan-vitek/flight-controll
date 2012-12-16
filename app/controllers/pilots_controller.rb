class PilotsController < ApplicationController
  # GET /pilots
  # GET /pilots.json
  def index
    @pilots = Pilot.where("begin > ? ", Date.yesterday).order('begin')
    @aktualnis= Aktualni.last

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pilots }
    end
  end

  # GET /export
  # GET /export.json
#  def export1
#    @pilots = Pilot.order('begin')
#    @aktualnis= Aktualni.last

#    respond_to do |format|
#      format.html
#      format.json {render json: {:current => @aktualnis, :pilots => @pilots}}
#    end
#  end

  def export
    @pilots = Pilot.where("begin > ? ", Date.yesterday).order('begin')
    @aktualnis= Aktualni.last


 #   Jbuilder.encode do |json|
 # 	json.(@aktualnis, :pilot, :begin)

 # 	json.author do
 #   		json.pilot @pilots.pilot
 #   		json.begin @message.begin
 # 	end

 #   end
  end


  # GET /pilots/1
  # GET /pilots/1.json
  def show
    @pilot = Pilot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pilot }
    end
  end

  # GET /pilots/new
  # GET /pilots/new.json
  def new
    @pilot = Pilot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pilot }
    end
  end

  # GET /pilots/1/edit
  def edit
    @pilot = Pilot.find(params[:id])
  end

  # POST /pilots
  # POST /pilots.json
  def create
    @pilot = Pilot.new(params[:pilot])
    respond_to do |format|
  #   if @pilot.save 
   
      if @pilot.save
	@pilot.update_attributes(:end => @pilot.end.change(:year => @pilot.begin.year, :month => @pilot.begin.month, :day => @pilot.begin.day))
        if @pilot.end < @pilot.begin
	  @pilot.update_attributes(:end =>  @pilot.end + 1.days)
	end
        format.html { redirect_to pilots_path, notice: 'Pilot was successfully created.' }
        format.json { render json: @pilot, status: :created, location: @pilot }
      else
        format.html { render action: "new" }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pilots/1
  # PUT /pilots/1.json
  def update
    @pilot = Pilot.find(params[:id])

    respond_to do |format|
      if @pilot.update_attributes(params[:pilot])
        format.html { redirect_to @pilot, notice: 'Pilot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilots/1
  # DELETE /pilots/1.json
  def destroy
    @pilot = Pilot.find(params[:id])
    @pilot.destroy

    respond_to do |format|
      format.html { redirect_to pilots_url }
      format.json { head :no_content }
    end
  end
end
