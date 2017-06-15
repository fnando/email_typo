# frozen_string_literal: true

module EmailTypo
  DotCom = lambda do |email|
    email
      .gsub(/\.co[mn]\.com/, ".com")
      .gsub(/\.com\.$/, ".com")
      .gsub(/\.com(?!cast|\.|@).{1,3}$/, ".com")
      .gsub(/\.co[^op]$/, ".com")
      .gsub(/\.c*(c|ci|coi|l|m|n|o|op|cp|0)*m+o*$/, ".com")
      .gsub(/\.(c|v|x)o+(m|n)$/, ".com")
  end
end
