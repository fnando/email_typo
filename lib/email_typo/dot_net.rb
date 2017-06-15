# frozen_string_literal: true

module EmailTypo
  DotNet = lambda do |email|
    email.gsub(/\.(nte*|n*et*)$/, ".net")
  end
end
