# frozen_string_literal: true

module EmailTypo
  Googlemail = lambda do |email|
    email
      .gsub(/@go{0,3}g{0,2}o?le?[mn]?[ail]{1,2}m?[aikl]{0,3}\./, "@googlemail.")
  end
end
