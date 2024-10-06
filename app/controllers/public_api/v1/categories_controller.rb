# frozen_string_literal: true

module PublicApi
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[update destroy]

      # GET /category
      def index
        @categories = Category.all

        render json: @categories
      end

      # POST /category

      def create
        @category = Category.new(category_params)

        if @category.save
          render json: @category, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # PUT /category/{category_id}
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /category/{category_id}
      def destroy
        @category.destroy
        head :no_content
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:title, { points: [] })
      end
    end
  end
end
