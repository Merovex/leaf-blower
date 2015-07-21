class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:show, :edit, :new]
  load_and_authorize_resource

  def breadcrumb
    add_breadcrumb "Templates", templates_path, :title => "Back to the Templates List"
    add_breadcrumb @template.name, template_path(@template) if @template
  end

  def scope
    if ['fox','hawk','lion'].include?(params[:scope].downcase)
      # raise params.inspect
      @templates = Template.where(:rank => params[:scope].titleize)
    end
    render :index
    # @templates = Template
  end
  def index
    # @templates = Template.all
    # raise @templates.first.inspect
    # @templates = {
    #   :fox => Template.find_all_by_rank("Fox"),
    # }
    @templates = {
      :fox => [],
      :hawk => [],
      :lion => []
    }
    Template.all.each do |t|
      key = t.rank.downcase.to_sym
      puts key.inspect
      @templates[key] << t
    end

  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :description, :heritage, :hobbies, :outdoor_activities, :pioneer_skills, :sci_tech, :life_skills, :values, :life_skills, :service_hours, :rank)
    end
end
