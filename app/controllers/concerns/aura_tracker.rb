module AuraTracker
  extend ActiveSupport::Concern

  def self.manage_aura(action, user_id)
    user = User.find(user_id)
    aura = user.aura

    if action == 'new_question'
      user.update(aura: aura + 2)
    elsif action == 'new_answer'
      user.update(aura: aura + 3)
    elsif action == 'saved_question'
      user.update(aura: aura + 1)
    elsif action == 'unsave_question'
      user.update(aura: aura - 1)
    else
      return
    end
  end
end
