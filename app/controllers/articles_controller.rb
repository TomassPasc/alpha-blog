class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

    def show 
    end

    def index
      @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
      @article = Article.new #initie un article pour que lorsque l'on affiche une page pour la première fois il y ait un objet
    end

    def edit 
    end

    def create
      byebug
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
        flash[:notice] = "L'article a bien été créée"
        redirect_to @article
      else
        render 'new'
      end
    end

    def update
      if @article.update(article_params)
        flash[:notice] = "L'article a bien été édité"
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_path
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description, category_ids:[])
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:alert] = "you can only edit or delete your own article"
        redirect_to @article  
      end

    end

end