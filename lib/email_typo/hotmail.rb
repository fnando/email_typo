# frozen_string_literal: true

module EmailTypo
  Hotmail = lambda do |email|
    email
      .gsub(/@h(i|o|p)?y?t?o?a?r?m?n?t?m?[aikl]{1,3}l?\./, "@hotmail.")
      .gsub(/@otmail\.com/, "@hotmail.com")
  end
end
