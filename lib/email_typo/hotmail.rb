# frozen_string_literal: true

module EmailTypo
  Hotmail = lambda do |email|
    email.gsub(/@h(i|o|p)?y?t?o?a?m?n?t?[aikl]{1,3}l?\./, "@hotmail.")
  end
end