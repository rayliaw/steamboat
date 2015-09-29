class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @board = Board.find(params[:board_id])
    @category = @board.categories.build
  end

  def edit
    @board = Board.find(params[:board_id])
    @category = @board.categories.find(params[:id])
  end

  def create
    @board = Board.find(params[:board_id])
    @category = @board.categories.create(category_params)
    if @category.save
      redirect_to @board
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @board
    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @category = @board.categories.find(params[:id])
    @category.destroy
    redirect_to @board
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
