class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /projects/:id/tasks/:id/blocks
  # GET /projects/:id/tasks/:id/blocks.json
  def index
    @blocks = policy_scope(Project).where(id: params[:project_id]).limit(1).first
                                   .tasks.where(id: params[:task_id]).limit(1).first
                                   .blocks
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    authorize @block
    puts @block.inspect
  end

  # GET /blocks/new
  def new
    @block = Block.new
    puts @block.inspect
  end

  # GET /blocks/1/edit
  def edit
    authorize @block
  end

  # POST /blocks
  # POST /blocks.json
  def create
    @block = Block.new(block_params)

    authorize @block
    respond_to do |format|
      if @block.save
        format.html { redirect_to @block, notice: 'Block was successfully created.' }
        format.json { render action: 'show', status: :created, location: @block }
      else
        format.html { render action: 'new' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    authorize @block
    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to @block, notice: 'Block was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    authorize @block
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:started_at, :ended_at, :task_id)
    end
end
