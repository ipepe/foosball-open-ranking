class ResourceController < ApplicationController
  class_attribute :resource_class
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # TODO: ability
  # load_and_authorize_resource

  # GET /resources
  # GET /resources.json
  def index
    self.resources = resource_class.all.paginate(per_page: 15, page: (params[:page] || 1).to_i)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    self.resource = resource_class.new(params_for_create)
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    self.resource = resource_class.new(params_for_create.to_hash.merge({created_by: current_user}))

    respond_to do |format|
      if resource.save
        format.html { redirect_to resource, notice: "#{resource_class_name} was successfully created." }
        format.json { render :show, status: :created, location: resource }
      else
        format.html { render :new }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if resource.update(params_for_update)
        format.html { redirect_to resource, notice: "#{resource_class_name} was successfully updated." }
        format.json { render :show, status: :ok, location: resource }
      else
        format.html { render :edit }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    resource.destroy
    respond_to do |format|
      format.html { redirect_to self.send("#{resource_class_name.pluralize.underscore}_url"), notice: "#{resource_class_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  protected

  def params_for_update
    params.require(resource_class_name.underscore.to_sym)
  end

  def params_for_create
    params.require(resource_class_name.underscore.to_sym)
  end

  def resource_class_name
    resource_class.to_s
  end

  def resources
    instance_variable_get "@#{resource_class_name.pluralize.underscore}"
  end

  def resource
    instance_variable_get "@#{resource_class_name.underscore}"
  end

  def resources=(value)
    instance_variable_set "@#{resource_class_name.pluralize.underscore}", value
  end

  def resource=(value)
    instance_variable_set "@#{resource_class_name.underscore}", value
  end

  private

  def set_resource
    self.resource = resource_class.find(params[:id])
  end
end