# frozen_string_literal: true

require "test_helper"

class EmailTypoTest < Minitest::Test # rubocop:disable Metrics/ClassLength
  test "shows deprecation message" do
    _, stderr = capture_io do
      EmailTypo.fix("john@gmail.com")
    end

    assert_equal "EmailTypo.fix is deprecated; use EmailTypo.call instead.",
                 stderr.chomp
  end

  %w[
    john.@gmail.co
    john.@gmail.com
    john@gamil.com
    john@gmaal.com
    john@gmai.com
    john@gmaii.com
    john@gmail.net
    john@gmailc.om
    john@gmaill.com
    john@gmal.com
    john@gmali.com
    john@gmaol.com
    john@gmaul.com
    john@gmial.com
    john@gmil.com
    john@gmila.com
    john@gmsil.com
    john@gnail.com
    john@gamail.com
    john@gemail.com
    john@gimail.com
    john@gomail.com
    john@ggmail.com
    john@grmail.com
    john@gmail.com.co
    john@gmail.c
  ].each do |email|
    test "fix gmail account (#{email})" do
      assert_equal "john@gmail.com", EmailTypo.call(email)
    end
  end

  %w[
    john@gmai.co.uk
    john@gmal.co.uk
    john@gmaal.co.uk
    john@gmil.co.uk
    john@gmial.co.uk
    john@gmali.co.uk
    john@gmila.co.uk
    john@gmaill.co.uk
    john@gamil.co.uk
    john@gnail.co.uk
    john@gmail.co.um
    john@gmail.o.uk
    john@gmail.couk
  ].each do |email|
    test "fix international gmail account (#{email})" do
      assert_equal "john@gmail.co.uk", EmailTypo.call(email)
    end
  end

  %w[
    john@example.co.lp
    john@example.cojp
    john@example.co.p
  ].each do |email|
    test "fix .co.jp account (#{email})" do
      assert_equal "john@example.co.jp", EmailTypo.call(email)
    end
  end

  %w[
    john@example.co.br
    john@example.cobr
  ].each do |email|
    test "fix .co.br account (#{email})" do
      assert_equal "john@example.com.br", EmailTypo.call(email)
    end
  end

  %w[
    john.@gogglemaii.com
    john.@gogglemail.com
    john.@gogolemail.com
    john.@googlemail.co
    john.@googlemail.com
    john.@goooglemail.com
    john@googleamil.com
    john@googlemaal.com
    john@googlemai.com
    john@googlemaii.com
    john@googlemailc.om
    john@googlemaill.com
    john@googlemal.com
    john@googlemali.com
    john@googlemial.com
    john@googlemil.com
    john@googlemila.com
    john@googlenail.com
    john@goooglemail.net
  ].each do |email|
    test "fix googlemail account (#{email})" do
      assert_equal "john@googlemail.com", EmailTypo.call(email)
    end
  end

  %w[
    john@aho.com
    john@ahoo.com
    john@yaho.com
    john@yahooo.com
    john@yhao.com
    john@yhaoo.com
    john@yho.com
    john@yhooo.com
    john@yao.com
    john@yaooo.com
    john@yahooc.om
    john@yahoo.co
    john@uahoo.com
  ].each do |email|
    test "fix yahoo account (#{email})" do
      assert_equal "john@yahoo.com", EmailTypo.call(email)
    end
  end

  %w[
    john@hotamail.com
    john@htmail.com
    john@hotmaill.com
    john@hotmaik.com
    john@hoymail.com
    john@hptmail.com
    john@htomali.com
    john@homtail.com
    john@hotmail.co
    john@hitmail.com
    john@hotnail.com
    john@hormail.com
    john@hortmail.com
    john@otmail.com
    john@hotmail.comr
  ].each do |email|
    test "fix hotmail account (#{email})" do
      assert_equal "john@hotmail.com", EmailTypo.call(email)
    end
  end

  %w[
    john@ail.cm
    john@ao.com
    john@aol.cm
    john@aol.co
    john@aol.net
    john@ol.com
  ].each do |email|
    test "fix aol account (#{email})" do
      assert_equal "john@aol.com", EmailTypo.call(email)
    end
  end

  [
    "jo\ hn@example.com",
    "jo\'hn@example.com",
    "john.@example.com",
    "john@#example.com",
    "john@.example.com",
    "john@@example.com",
    "john@example,com",
    "john@example..com",
    "john@example.c0m",
    "john@example.clom",
    "john@example.cm",
    "john@example.cmo",
    "john@example.co,",
    "john@example.co.",
    "john@example.co<",
    "john@example.co>",
    "john@example.coim",
    "john@example.cok",
    "john@example.colm",
    "john@example.com",
    "JOHN@EXAMPLE.COM",
    "john@example.com,",
    "john@example.com.",
    "john@example.com.com",
    "john@example.com\"",
    "john@example.com\'",
    "john@example.com\\",
    "john@example.comj",
    "john@example.comm",
    "john@example.comme",
    "john@example.comn",
    "john@example.con",
    "john@example.con.com",
    "john@example.conm",
    "john@example.coom",
    "john@example.copm",
    "john@example.cpm",
    "john@example.ocm",
    "john@example.om",
    "john@example.vom",
    "john@example.xom",
    "john@example.fom",
    "john@example.ckm",
    "john@examplec.om",
    "john@examplecom",
    "john\#@example.com",
    "mailto:john@example.com",
    "john@example.vcom",
    "john@example.xcom"
  ].each do |email|
    test "fix generic dot com account (#{email})" do
      assert_equal "john@example.com", EmailTypo.call(email)
    end
  end

  %w[
    john@example.nt
    john@example.ne
    john@example.et
    john@example.nte
    john@example.nett
    john@example.net
    john@examplenet
    john@example.ney
    john@example.met
  ].each do |email|
    test "fix dot net account (#{email})" do
      assert_equal "john@example.net", EmailTypo.call(email)
    end
  end

  %w[
    john@example.or
    john@example.og
    john@example.ogr
    john@example.orgg
    john@exampleorg
  ].each do |email|
    test "fix dot org account (#{email})" do
      assert_equal "john@example.org", EmailTypo.call(email)
    end
  end

  %w[
    jo.nh@gmail.com
    john+spamfilter@gmail.com
    john.comisky@gmail.com
    john@anything.comcast.com
    john@anything.comcastbiz.net
    john@aol.com
    john@army.mil
    john@att.net
    john@example.cn
    john@example.co
    john@example.com.co
    john@example.coop
    john@example.gr
    john@facebook.com
    john@gao.gov
    john@gm.com
    john@gmx.com
    john@googlemail.com
    john@hotmail.co.uk
    john@live.com
    john@mac.com
    john@mail.com
    john@me.com
    john@msn.com
    john@ya.ru
    john@yahoo.co.uk
    john@ymail.com
    john@gial.edu
    john@support.comcastbiz.net
    john@dogmail.net
    john@engaol.net
    john@chengmail.net
    john@gial.ac.in
    john@gla.gov
    john@hanmail.net
  ].each do |email|
    test "don't mess with #{email}" do
      assert_equal email, EmailTypo.call(email)
    end
  end

  (EmailData.tlds - %w[unicom comsec et free om mm mo mom ne cm]).each do |tld|
    test "accept #{tld} account" do
      email = "john@example.#{tld}"
      assert_equal email, EmailTypo.call(email)
    end
  end

  %w[cm et ne om].each do |tld|
    test "reject #{tld} account" do
      email = "john@example.#{tld}"
      refute_equal email, EmailTypo.call(email)
    end
  end

  %w[
    john@veizon.net
    john@verion.net
    john@verizon.net
    john@verzon.net
  ].each do |email|
    test "fix verizon account (#{email})" do
      assert_equal "john@verizon.net", EmailTypo.call(email)
    end
  end

  %w[
    john@icoud.com
    john@icloud.co
    john@icloud.net
    john@iclod.com
    john@iclud.com
    john@icluod.com
    john@icld.com
  ].each do |email|
    test "fix icloud account (#{email})" do
      assert_equal "john@icloud.com", EmailTypo.call(email)
    end
  end

  %w[
    john@outloo.com
    john@outlook.co
    john@outlook.net
  ].each do |email|
    test "fix outlook account (#{email})" do
      assert_equal "john@outlook.com", EmailTypo.call(email)
    end
  end

  %w[
    john@comacast.net
    john@comcastn.et
    john@comcastt.net
    john@comcat.net
    john@concast.net
    john@cmcast.net
  ].each do |email|
    test "fix comcast account (#{email})" do
      assert_equal "john@comcast.net", EmailTypo.call(email)
    end
  end

  %w[
    john@example.com1
  ].each do |email|
    test "fix extraneous numbers (#{email})" do
      assert_equal "john@example.com", EmailTypo.call(email)
    end
  end

  {
    "john@example.co.ul" => "john@example.co.uk",
    "john@example.co.uj" => "john@example.co.uk",
    "john@example.rul" => "john@example.ru",
    "john@example.ry" => "john@example.ru",
    "john@example.r" => "john@example.ru",
    "john@example.iit" => "john@example.it",
    "john@example.itt" => "john@example.it",
    "john@example.com/.au" => "john@example.com.au",
    "john@example.co.u" => "john@example.co.uk",
    "john@example.co.k" => "john@example.co.uk",
    "john@example.co.ukl" => "john@example.co.uk",
    "`john@example.com" => "john@example.com",
    "john@example.dek" => "john@example.de",
    "john@example.com.brr" => "john@example.com.br",
    "john@example.com.vr" => "john@example.com.br",
    "john@example.fe" => "john@example.fr",
    "john@example.gob" => "john@example.gov",
    "john@example.gob.br" => "john@example.gov.br",
    "john@gobblin.example.gob" => "john@gobblin.example.gov",
    "john@example.ffr" => "john@example.fr",
    "john@example.ed" => "john@example.edu",
    "john@example.ed.br" => "john@example.edu.br",
    "john@ed.example.com" => "john@ed.example.com",
    "john@example.edi" => "john@example.edu",
    "john@example.edi.br" => "john@example.edu.br",
    "john@edi.example.com" => "john@edi.example.com",
    "john@example.com.mxg" => "john@example.com.mx",
    "john@example.comar" => "john@example.com.ar",
    "john@example.co.ar" => "john@example.com.ar",
    "john@example.comau" => "john@example.com.au",
    "john@example.co.au" => "john@example.com.au"
  }.each do |actual, expected|
    test "fix emails (#{actual})" do
      assert_equal expected, EmailTypo.call(actual)
    end
  end
end
