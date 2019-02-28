class MoviesController < ApplicationController

  # NOOB LEVEL BASIC - Will break when no query is passed.

  # def index
  #   @movies = Movie.where(title: params[:query])
  # end

  # # CODING POTWASHER - Won't break if no params are passed, but only finds exact matches.

  # def index
  #   if params[:query].present?
  #     @movies = Movie.where(title: params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # # GETTING THERE - ILIKE for case insensitivity and % for open ended matches.

  # def index
  #   if params[:query].present?
  #     @movies = Movie.where("title ILIKE ?", "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # # MULTIPLE COLUMN SEARCH -

  # def index
  #   if params[:query].present?
  #     sql_query = "title ILIKE :query_key OR syllabus ILIKE :query_key"
  #     @movies = Movie.where(sql_query, query_key: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # ABOVE AND BELOW EMPHASISE WHICH VARIABLES AND KEYS ARE GOING WHERE

  # def index
  #   if params[:query].present?
  #     query = "title ILIKE :query OR syllabus ILIKE :query"
  #     @movies = Movie.where(query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # ASSOCIATION SEARCH - Can search on the movie model and the associated director model

  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title ILIKE :query \
  #       OR movies.syllabus ILIKE :query \
  #       OR directors.first_name ILIKE :query \
  #       OR directors.last_name ILIKE :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  #

  # SEARCH THAT FINDS WORD COMBOS IN THE WRONG ORDER - "superman batman" will now find "batman vs superman"

  # def index
  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title @@ :query \
  #       OR movies.syllabus @@ :query \
  #       OR directors.first_name @@ :query \
  #       OR directors.last_name @@ :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # TIME TO GET SOMETHING MORE POWERFUL LET'S GO OVER TO THE MODEL AND PUT PGSEARCH IN

  # def index
  #   if params[:query].present?
  #     @movies = Movie.search_by_title_and_syllabus(params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # # ASSOCIATED PG SEARCH

  # def index
  #   if params[:query].present?
  #     @movies = Movie.global_search(params[:query])
  #   else
  #     @movies = Movie.all
  #   end
  # end

  # MULTISEARCH

  # def index
  #   if params[:query].present?
  #     @results = PgSearch.multisearch(params[:query])
  #   else
  #     @actv_results = [Movie.all, Serie.all].flatten
  #   end
  # end

  # ELASTICSEARCH

  # def index
  #   if params[:query].present?
  #     @movies = Movie.search(params[:query])
  #   else
  #     @movies = [Movie.all, Serie.all].flatten
  #   end
  # end

end
