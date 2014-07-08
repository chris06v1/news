class UpVote < Vote

  after_create :increase_counter

  def increase_counter
    post.increment!(:up_votes_count) if post
  end
end
