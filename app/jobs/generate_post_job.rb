class GeneratePostJob < ApplicationJob
  queue_as :default


  def perform(*args)

    def perform(user_id)
      user = User.find(user_id)
      user.posts.delete_all
    end


  end
end
