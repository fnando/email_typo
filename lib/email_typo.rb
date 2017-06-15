# frozen_string_literal: true

require_relative "./email_typo/version"

require_relative "./email_typo/add_missing_m"
require_relative "./email_typo/add_missing_period"
require_relative "./email_typo/aol"
require_relative "./email_typo/different_tlds"
require_relative "./email_typo/dot_com"
require_relative "./email_typo/dot_net"
require_relative "./email_typo/dot_org"
require_relative "./email_typo/gmail"
require_relative "./email_typo/googlemail"
require_relative "./email_typo/hotmail"
require_relative "./email_typo/known_dot_com"
require_relative "./email_typo/period_around_at_sign"
require_relative "./email_typo/providers"
require_relative "./email_typo/remove_invalid_chars"
require_relative "./email_typo/transposed_periods"
require_relative "./email_typo/yahoo"

module EmailTypo
  class << self
    # List of default processors that will be applied to fix any email's typos.
    attr_accessor :default_processors
  end

  self.default_processors = [
    RemoveInvalidChars,
    TransposedPeriods,
    PeriodAroundAtSign,
    DifferentTlds,
    AddMissingM,
    AddMissingPeriod,
    Providers,
    Aol,
    DotCom,
    DotNet,
    DotOrg,
    Gmail,
    Googlemail,
    Hotmail,
    KnownDotCom,
    Yahoo
  ]

  def self.fix(email, processors = default_processors)
    return unless email

    processors.reduce(email.downcase) do |processed_email, processor|
      processor.call(processed_email)
    end
  end
end
