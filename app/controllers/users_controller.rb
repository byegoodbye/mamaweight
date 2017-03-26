class UsersController < ApplicationController
  def show
    @today = Date.today
    @topname = current_user.name
    @topbabyname = current_user.babyname
    t = Date.today
    dateofbirth = current_user.date_of_birth - t
    @dateofbirth = dateofbirth.to_i
    date_of_pregnancy = current_user.date_of_birth - 280
    today_pregnancy = t - date_of_pregnancy
    @today_pregnancy = today_pregnancy.to_i
    month_pregnancy = today_pregnancy / 7
    @month_pregnancy = month_pregnancy.to_i
    day_pregnancy = today_pregnancy % 7
    @day_pregnancy = day_pregnancy.to_i
    if current_user.weights.exists?
      commentweight = Weight.where(user_id: current_user.id).last.weight - Weight.where(user_id: current_user.id).first.weight

      if commentweight <= 0.05 then
        @babycomment = "ママのお腹の中\nとっても居心地がいいな\nいつもありがとう"
      elsif  commentweight > 0.05 && commentweight <= 0.1 then
        @babycomment = "快適だなー  "
      elsif commentweight > 0.1 && commentweight <= 0.3 then
        @babycomment = "暇だなー  お外で遊びたいな"
      elsif commentweight > 0.3 && commentweight <= 0.5 then
        @babycomment = "ママのお腹の中ちょっと苦しいな\nもっと広いところがいいな"
      elsif commentweight > 0.5 then
        @babycomment = "ママのお腹狭いなー苦しい\nもっと居心地よくしてほしいな"
      else
        @babycomment = "体重を測ってね！"
      end
    else
      @babycomment = "体重を測ってね！"
    end
  end

  def create
  end
end