# frozen_string_literal: true

module EmailTypo
  Gmail = lambda do |email|
    email.gsub(
      /@ga?e?i?o?r?g?[nm]{0,2}s?[ail]{1,2}[aiklmou]{0,3}\.(?!gov|edu)/,
      "@gmail."
    )
  end
end
