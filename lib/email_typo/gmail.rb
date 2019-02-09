# frozen_string_literal: true

module EmailTypo
  Gmail = lambda do |email|
    email.gsub(/@g[nm]{0,2}s?[ail]{1,2}[aiklmou]{0,3}\.(?!gov|edu)/, "@gmail.")
  end
end
