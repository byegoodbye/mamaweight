class TopController < ApplicationController
  def index
    @today = Date.today
    @topname = current_user.name
    @topbabyname = current_user.babyname
    if current_user.weights.exists?
      @topweight = Weight.where(user_id: current_user.id).last.weight
      @weightchange = Weight.where(user_id: current_user.id).last.weight - Weight.where(user_id: current_user.id).first.weight
      if current_user.weights.length >= 2
        @commentlist = Weight.where(user_id: current_user.id).order("created_at DESC")
        commentweight = @commentlist[0].weight - @commentlist[1].weight

        if commentweight <= 0.05 then
          @babycomment = "ママのお腹の中とっても居心地がいいな\nいつもありがとう"
        elsif  commentweight > 0.05 && commentweight <= 0.1 then
          @babycomment = "快適だなー うーん眠たい、"
        elsif commentweight > 0.1 && commentweight <= 0.3 then
          @babycomment = "ちょっと苦しい、気のせいかなぁ"
        elsif commentweight > 0.3 && commentweight <= 0.5 then
          @babycomment = "ママのお腹の中ちょっと苦しいな\nもっと広いところがいいな"
        elsif commentweight > 0.5 then
          @babycomment = "ママのお腹狭いなー 苦しい\nもっと居心地をよくしてほしいな"
        else
          @babycomment = "体重を測ってね！"
        end
      else
        @babycomment = "今日も一日お疲れ様！"
      end
    else
      @babycomment = "体重を測定してね！"
    end
  end
end