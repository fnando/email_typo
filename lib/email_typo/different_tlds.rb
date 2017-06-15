# frozen_string_literal: true

module EmailTypo
  DifferentTlds = lambda do |email|
    email
      .gsub(/\.(o\.uk|couk|co\.um)$/, ".co.uk")
      .gsub(/\.(cojp|co\.lp)$/, ".co.jp")
  end
end
