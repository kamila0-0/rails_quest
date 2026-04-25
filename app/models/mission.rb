class Mission < ApplicationRecord
  belongs_to :agent

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[assigned in_progress completed] }

  def status=(value)
    unless value.in?([nil, 'assigned', 'in_progress', 'completed'])
      raise ArgumentError, "'#{value}' is not a valid status"
    end
    super
  end
end