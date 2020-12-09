# frozen_string_literal: true

module EmailTypo
  RemoveMailTo = lambda do |email|
    email.delete_prefix("mailto:")
  end
end
