# frozen_string_literal: true

class MyNewsItemsController < SessionController
    before_action :set_representative
    before_action :set_representatives_list
    before_action :set_ratings_list
    before_action :set_issue_list
    before_action :set_current_user_id
    before_action :set_news_item, only: %i[edit update delete]

    def new
        @news_item = NewsItem.new
    end

    def edit
        if @news_item.owner.eql? session[:current_user_id].to_s
            render :edit
        else
            render :rate
        end
    end

    def rating; end

    def create
        @news_item = NewsItem.create!(news_item_params)
        if @news_item.save
            redirect_to representative_news_item_path(@representative, @news_item),
                        notice: 'News item was successfully created.'
        else
            render :new, error: 'An error occurred when creating the news item.'
        end
    end

    def update
        if @news_item.update(news_item_params)
            redirect_to representative_news_item_path(@representative, @news_item),
                        notice: 'News item was successfully updated.'
        else
            render :edit, error: 'An error occurred when updating the news item.'
        end
    end

    def delete
        item = NewsItem.find(params[:id])
        item.delete
        redirect_to representative_news_items_path(@representative),
                    notice: 'News was successfully destroyed.'
    end

    private

    def set_representative
        @representative = Representative.find(
            params[:representative_id]
        )
    end

    def set_representatives_list
        @representatives_list = Representative.all.map { |r| [r.name, r.id] }
    end

    def set_ratings_list
        @ratings_list = Rating.all_ratings
    end

    def set_current_user_id
        @curr_user = session[:current_user_id]
    end

    def set_issue_list
        @issue_list = Issue.all_issues
    end

    def set_news_item
        @news_item = NewsItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def news_item_params
        params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue, :owner,
                                          :rating)
    end
end
