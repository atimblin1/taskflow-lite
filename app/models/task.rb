class Task < ApplicationRecord
  # Enums
  enum :priority, { low: 0, normal: 1, high: 2 }, default: :normal
  
  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :status, presence: true, inclusion: { in: %w[open completed] }
  validates :priority, presence: true
  
  # Scopes
  scope :open, -> { where(status: 'open') }
  scope :completed, -> { where(status: 'completed') }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_priority, ->(priority_value) { where(priority: priority_value) if priority_value.present? }
  
  # Callbacks
  before_save :set_completed_at
  
  # Instance methods
  def complete!
    update(status: 'completed', completed_at: Time.current)
  end
  
  def reopen!
    update(status: 'open', completed_at: nil)
  end
  
  def completed?
    status == 'completed'
  end
  
  private
  
  def set_completed_at
    if status == 'completed' && status_changed?
      self.completed_at = Time.current
    elsif status == 'open' && status_changed?
      self.completed_at = nil
    end
  end
end
