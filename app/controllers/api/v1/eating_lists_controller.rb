class Api::V1::EatingListsController < Api::V1::GraphitiController
  def index
    eating_lists = EatingListResource.all(params)
    respond_with(eating_lists)
  end

  def show
    eating_list = EatingListResource.find(params)
    respond_with(eating_list)
  end

  def create
    eating_list = EatingListResource.build(params)

    if eating_list.save
      render jsonapi: eating_list, status: :created
    else
      render jsonapi_errors: eating_list
    end
  end

  def update
    eating_list = EatingListResource.find(params)

    if eating_list.update_attributes
      render jsonapi: eating_list
    else
      render jsonapi_errors: eating_list
    end
  end

  def destroy
    eating_list = EatingListResource.find(params)

    if eating_list.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: eating_list
    end
  end
end
