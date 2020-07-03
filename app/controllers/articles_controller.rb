class ArticlesController < ApplicationController

    def show
      @article = Article.find(params[:id])
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new #initie un article pour que lorsque l'on affiche une page pour la première fois il y ait un objet
    end

    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "L'article a bien été créée"
        redirect_to @article
      else
        render 'new'
      end
    end

end