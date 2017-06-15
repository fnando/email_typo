# frozen_string_literal: true

module EmailTypo
  RemoveInvalidChars = lambda do |email|
    email
      .gsub(/(\s|\#|\'|\"|\\)*/, "")
      .gsub(/(\,|\.\.)/, ".")
      .gsub("@@", "@")
  end
end
