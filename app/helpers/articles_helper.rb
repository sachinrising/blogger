module ArticlesHelper

	def permissible_params
		params.require(:article).permit(:title, :body)
	end
	
end
