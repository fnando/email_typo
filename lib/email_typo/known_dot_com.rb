# frozen_string_literal: true

module EmailTypo
  KnownDotCom = lambda do |email|
    email
      .gsub(
        /@(aol|googlemail|gmail|hotmail|yahoo|icloud|outlook)\.([a-z]+)$/,
        "@\\1.com"
      )
  end
end
