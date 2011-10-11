class LessonsController < ApplicationController
  before_filter :load_course
  # GET /lessons
  # GET /lessons.xml
  layout "admin"
  def index
    @lessons = Lesson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.xml
  def show
    @lesson = @course.lessons.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.xml
  def new
    @lesson = @course.lessons.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = @course.lessons.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.xml
  def create
    @lesson = @course.lessons.build(params[:lesson])

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to(@course, :notice => 'Lesson was successfully created.') }
        format.xml  { render :xml => @lesson, :status => :created, :location => @lesson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.xml
  def update
    @lesson = @course.lessons.find(params[:id])

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to(@course, :notice => 'Lesson was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lesson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.xml
  def destroy
    @lesson = @course.lessons.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to(lessons_url) }
      format.xml  { head :ok }
    end
  end

  def load_course
    @course = Course.find(params[:course_id])
  end

end
