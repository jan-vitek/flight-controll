class AktualnisController < ApplicationController
  # GET /aktualnis
  # GET /aktualnis.json
  def index
    @aktualnis = Aktualni.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aktualnis }
    end
  end

  # GET /aktualnis/1
  # GET /aktualnis/1.json
  def show
    @aktualni = Aktualni.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aktualni }
    end
  end

  # GET /aktualnis/new
  # GET /aktualnis/new.json
  def new
    @aktualni = Aktualni.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aktualni }
    end
  end

  # GET /aktualnis/1/edit
  def edit
    @aktualni = Aktualni.find(params[:id])
  end

  # POST /aktualnis
  # POST /aktualnis.json
  def create
    @aktualni = Aktualni.new(params[:aktualni])

    respond_to do |format|
      if @aktualni.save
        format.html { redirect_to pilots_path, notice: 'Pilot successully changed' }
        format.json { render json: @aktualni, status: :created, location: @aktualni }
      else
        format.html { render action: "new" }
        format.json { render json: @aktualni.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aktualnis/1
  # PUT /aktualnis/1.json
  def update
    @aktualni = Aktualni.find(params[:id])

    respond_to do |format|
      if @aktualni.update_attributes(params[:aktualni])
        format.html { redirect_to @aktualni, notice: 'Aktualni was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aktualni.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aktualnis/1
  # DELETE /aktualnis/1.json
  def destroy
    @aktualni = Aktualni.find(params[:id])
    @aktualni.destroy

    respond_to do |format|
      format.html { redirect_to aktualnis_url }
      format.json { head :no_content }
    end
  end
end
