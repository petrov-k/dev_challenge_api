# frozen_string_literal: true

module Resources
  class Category < Grape::API
    helpers do
      def permitted_params
        declared(params, include_missing: false)
      end

      def category
        @category ||= ::Category.find(params[:id])
      end
    end

    resource :category do
      desc 'Return list of categories'
      get do
        categories = ::Category.all
        present categories, with: Entities::Category
      end

      desc 'Create a new category'
      params do
        requires :title, type: String, desc: 'Category title'
        optional :points, type: Array[String], desc: 'Category points'
      end
      post do
        # TODO When adding or updating a category,
        # it is necessary to check if the conversations still belong to this category.
        category = ::Category.new(permitted_params)
        if category.save
          status 201
          present category, with: Entities::Category
        else
          error!({ error: 'Unable to create category', details: category.errors }, :unprocessable_entity)
        end
      end

      route_param :id, type: Integer do
        desc 'Update a category'
        params do
          optional :title, type: String, desc: 'Category title'
          optional :points, type: Array[String], desc: 'Category points'
        end
        put do
          # TODO When adding or updating a category,
          # it is necessary to check if the conversations still belong to this category.
          if category.update(permitted_params)
            status :ok

            present category, with: Entities::Category
          else
            error!({ error: category.errors.full_messages }, :unprocessable_entity)
          end
        end

        desc 'Delete a category'
        delete do
          if category.destroy
            status 204
          else
            error!({ error: 'Unable to delete category' }, :unprocessable_entity)
          end
        end
      end
    end
  end
end
