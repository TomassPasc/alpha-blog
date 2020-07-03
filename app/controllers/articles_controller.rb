class ArticlesController < ApplicationController

    def show
      @article = Article.find(params[:id])
    end

    def index
      @articles = Article.all
    end

    def new
    
    end

    def create
      #render plain: params[:article] #afficher sur le navigateur la création d'un article
      @article = Article.new(params.require(:article).permit(:title, :description)) #permit est une sécurité paramètre fort pour les formulaires
      #render plain: @article.inspect
      @article.save #si on s'arrete là l'article est sauvegardé mais on reste sur la page
      #redirect_to article_path(@article) #on redirige vers la page de l'article / article_path(@article) : extrait l'id de article object
      redirect_to @article #meme action que precedemmet avec un shortcut
    end

end