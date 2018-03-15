class Unlike < ActiveRecord::Base

  belongs_to :unlikable, :polymorphic => true
  belongs_to :unliker,   :polymorphic => true

end
