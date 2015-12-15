class TagsController < ApplicationController
	def new 
		@tag = Tag.new
	end

	def create
		@tag = Tag.new(permitted_params[:tag])
		if @tag.save
			flash[:notice] = "Good"
			redirect_to tags_path
		else 
			flash[:notice] = "No good"
			render 'new'
		end
	end

	def index
		@tags = Tag.all
	end

	def show 
		@tag = Tag.find(params[:id])
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update_attributes!(permitted_params[:tag])
			flash[:notice] = "Updated"
			redirect_to tags_path
		else
			flash[:notice] = "Somthing wrong"
			render "edit"
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash[:notice] = "Destroed"
		redirect_to tags_path
	end



	private

	def permitted_params
		{ tag: 
			params.fetch(:tag, {}).permit(:name, :status) }
	end 

end