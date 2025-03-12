class BookCopiesController < ApplicationController
  before_action :set_book_copy, only: [:update]

  def create
    @book_copy = BookCopy.new(book_copy_create_params)

    if @book_copy.save
      render json: @book_copy, status: :created
    else
      render json: { errors: @book_copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @book_copy.update(book_copy_update_params)
      render json: @book_copy, status: :ok
    else
      render json: { errors: @book_copy.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_book_copy
    @book_copy = BookCopy.find(params[:id])
  end

  def book_copy_update_params
    params.require(:book_copy).permit(:state)
  end

  def book_copy_create_params
    params.require(:book_copy).permit(:book_id, :state)
  end
end
