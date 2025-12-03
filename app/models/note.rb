class Note < ApplicationRecord
  belongs_to :student
  has_one :classroom, through: :student
  has_many :read_notifications, as: :notification

  #adding to make unread note for parents if teacher replies
  after_save :mark_parent_unread_if_replied, if: :saved_change_to_reply?

  private

  def mark_parent_unread_if_replied
    # don't do anything if reply is blank
    return if reply.blank?

    # get ReadNotification of parent_user
    rn = ReadNotification.find_or_initialize_by(
      user: student.user,
      notification: self
    )

    # change/make the status to false
    rn.status  = false
    rn.save!
  end

end
