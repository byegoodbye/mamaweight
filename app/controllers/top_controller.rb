class TopController < ApplicationController
  def index
  @topname = current_user.name
  @topweight = Weight.where(user_id: current_user.id).last.weight
  @weightchange = Weight.where(user_id: current_user.id).last.weight - Weight.where(user_id: current_user.id).first.weight
  @topbabyname = current_user.babyname
  commentweight = Weight.where(user_id: current_user.id).last.weight - Weight.where(user_id: current_user.id).first.weight

    if commentweight  <= 0.05 then
      @babycomment = "ママのお腹の中とっても居心地がいいな　いつもありがとう"
    elsif  commentweight > 0.05 && commentweight <= 0.1 then
      @babycomment = "快適だなー　"
    elsif commentweight > 0.1 && commentweight <= 0.3 then
      @babycomment = "暇だなー　お外で遊びたいな"
    elsif commentweight > 0.3 && commentweight <= 0.5 then
      @babycomment = "ママのお腹の中ちょっと苦しいな　もっと広いところがいいな"
    elsif commentweight > 0.5 then
      @babycomment = "ママのお腹狭いなー　苦しい、もっと居心地よくしてほしいな"
    else
      @babycomment = "もう一度測定して"
    end
  end
end