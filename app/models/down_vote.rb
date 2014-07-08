class DownVote < Vote

  after_create :increase_counter

  def increase_counter
    post.increment!(:down_votes_count) if post
  end
end
