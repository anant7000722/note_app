class NotesController < ApplicationController

before_action :find_note, only: [:show, :edit, :update, :destroy]
	def index
		@note = Note.all.order("created_at DESC")
		@note1 = Note.new
	end

	def show
		
	end

	# def igrate
	# 	@directions= Direction.where(ingredient_id: params[:other_params])
	# 	respond_to do |format|
	# 		format.js
	# 	end
	# end


	def new 
		@note = Note.new
	
	end

	def create
		@note = Note.new(note_params)
		# @note = current_user.notes.build(note_params)

		if @note.save
	        respond_to do |format|
	          
	          format.js
	        end
        
      	else
        	respond_to do |format|
          
              format.js
       		end
      	end
	end

	def edit
		
		@note1 = Note.new
		
	end

	def ingrat

		id = params[:data_value]
		# @directions = Direction.where(ingredient_id: id)

		respond_to do |format|
			format.js
		end
	end

	def update
        if @note.update( note_params)
        	redirect_to @note
        else
        	render 'edit'
        end
	end

	def destroy
		@note.destroy
		redirect_to root_path, notice: "Successfully deleted note"
	end

	private

	def note_params
		params.require(:note).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy, directions_attributes: [:id, :name, :_destroy]])
	end

	def find_note
		@note = Note.find(params[:id])
	end

end

