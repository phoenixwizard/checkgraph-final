class TasksController < ApplicationController
  before_filter :authenticate_user!
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def create_new_orphan_child
    @name=params[:name]
    @graph_id=params[:graph_id]
    @graph=Graph.find(@graph_id)
    @task=Task.new
    @task.name=@name
    @task.state="NOT_DONE"
    @task.save
    @task.graphs<<@graph
    @task.reload
    respon=Hash.new
    respon[:status]="200"
    respon[:task]=@task
    respon[:task][:children] = @task.childs
    respond_to do |format|
      format.json { render json: respon }
    end
  end

  def change_status
    task_id=params[:task_id]
    stat=params[:status]
    @task=Task.find(task_id)
    @task.state=stat
    @task.save
    respon=Hash.new
    respon[:status]="200"
    respond_to do |format|
      format.json { render json: respon }
    end
  end


  def link_task
    graph=params[:graph_id]
    task_parent=params[:task_parent]
    task_child=params[:task_child]
    @task1=Task.find(task_parent)
    @task2=Task.find(task_child)
    # u.graphs[0].tasks[0].childs<<u.graphs[0].tasks[1]

    @task1.childs<<@task2
    #I have just added a task -> Associate it with the graph (done when created) -> Next the task will be adsociated with the user (also done when creatred, with all the users in the graph?) and then associated with itself
    respon=Hash.new
    respon[:status]="200"
    respond_to do |format|
      format.json { render json: respon }
    end
  end

end
