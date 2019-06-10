class FuncaoTransacionalsController < ApplicationController
  before_action :set_funcao_transacional, only: [:show, :edit, :update, :destroy]

  # GET /funcao_transacionals
  # GET /funcao_transacionals.json
  def index
    @funcao_transacionals = FuncaoTransacional.all
  end

  # GET /funcao_transacionals/1
  # GET /funcao_transacionals/1.json
  def show
  end

  # GET /funcao_transacionals/new
  def new
    @funcao_transacional = FuncaoTransacional.new
  end

  # GET /funcao_transacionals/1/edit
  def edit
  end

  # POST /funcao_transacionals
  # POST /funcao_transacionals.json
  def create
    @funcao_transacional = FuncaoTransacional.new(funcao_transacional_params)

    respond_to do |format|
      if @funcao_transacional.save
        format.html { redirect_to @funcao_transacional, notice: 'Funcao transacional was successfully created.' }
        format.json { render :show, status: :created, location: @funcao_transacional }
      else
        format.html { render :new }
        format.json { render json: @funcao_transacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcao_transacionals/1
  # PATCH/PUT /funcao_transacionals/1.json
  def update
    respond_to do |format|
      if @funcao_transacional.update(funcao_transacional_params)
        format.html { redirect_to @funcao_transacional, notice: 'Funcao transacional was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcao_transacional }
      else
        format.html { render :edit }
        format.json { render json: @funcao_transacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcao_transacionals/1
  # DELETE /funcao_transacionals/1.json
  def destroy
    @funcao_transacional.destroy
    respond_to do |format|
      format.html { redirect_to funcao_transacionals_url, notice: 'Funcao transacional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcao_transacional
      @funcao_transacional = FuncaoTransacional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcao_transacional_params
      params.require(:funcao_transacional).permit(:nameFunc, :typeFunc, :param1, :param2, :complexity, :qntdPF, :nameCounter, :registry)
    end
end
