class AvailibilitySerializer < ActiveModel::Serializer
  attributes :id, :employee_id, :day, :active, :not_active, :slots
  def slots
    object.slots.map do |slot|
      {
        id: slot.id,
        from: slot.from,
        to: slot.to
      }
    end
  end
end
