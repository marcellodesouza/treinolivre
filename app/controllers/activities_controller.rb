class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.xml
  before_filter :load_lesson
  layout "classes", :except => [:edit]
  def index
    @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = @lesson.activities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = @lesson.activities.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = @lesson.activities.find(params[:id])
    render :layout => "admin"
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = @lesson.activities.build(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to([@lesson.course, @lesson], :notice => 'Activity was successfully created.') }
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = @lesson.activities.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to([@lesson.course, @lesson], :notice => 'Activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = @lesson.activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      #format.html { redirect_to(activities_url) }
      format.html { redirect_to([@lesson.course, @lesson]) }
      format.xml  { head :ok }
    end
  end

  def load_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

end
