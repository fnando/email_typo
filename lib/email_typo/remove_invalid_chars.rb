# frozen_string_literal: true

module EmailTypo
  RemoveInvalidChars = lambda do |email|
    email
      .gsub(/(\s|[#`'"\\|])*/, "")
      .tr("/", ".")
      .gsub(/(,|\.\.)/, ".")
      .tr("!", "1")
      .gsub("@@", "@")
  end
end
