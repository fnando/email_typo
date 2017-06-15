# frozen_string_literal: true

require "test_helper"

class EmailTypoTest < Minitest::Test
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
  ].each do |email|
    test "fix gmail account (#{email})" do
      assert_equal "john@gmail.com", EmailTypo.fix(email)
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
      assert_equal "john@gmail.co.uk", EmailTypo.fix(email)
    end
  end

  %w[
    john@example.co.lp
    john@example.cojp
  ].each do |email|
    test "fix .co.jp account (#{email})" do
      assert_equal "john@example.co.jp", EmailTypo.fix(email)
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
      assert_equal "john@googlemail.com", EmailTypo.fix(email)
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
      assert_equal "john@yahoo.com", EmailTypo.fix(email)
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
  ].each do |email|
    test "fix hotmail account (#{email})" do
      assert_equal "john@hotmail.com", EmailTypo.fix(email)
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
      assert_equal "john@aol.com", EmailTypo.fix(email)
    end
  end

  %w[
    jo\ hn@example.com
    jo\'hn@example.com
    john.@example.com
    john@#example.com
    john@.example.com
    john@@example.com
    john@\#example.com
    john@example,com
    john@example..com
    john@example.c0m
    john@example.clom
    john@example.cm
    john@example.cmo
    john@example.co,
    john@example.co.
    john@example.co<
    john@example.co>
    john@example.coim
    john@example.cok
    john@example.colm
    john@example.com
    JOHN@EXAMPLE.COM
    john@example.com,
    john@example.com.
    john@example.com.com
    john@example.com\
    john@example.com\'
    john@example.com\\
    john@example.comj
    john@example.comm
    john@example.comme
    john@example.comn
    john@example.con
    john@example.con.com
    john@example.conm
    john@example.coom
    john@example.copm
    john@example.cpm
    john@example.ocm
    john@example.om
    john@example.vom
    john@example.xom
    john@examplec.om
    john@examplecom
    john\#@example.com
  ].each do |email|
    test "fix generic dot com account (#{email})" do
      assert_equal "john@example.com", EmailTypo.fix(email)
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
  ].each do |email|
    test "fix dot net account (#{email})" do
      assert_equal "john@example.net", EmailTypo.fix(email)
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
      assert_equal "john@example.org", EmailTypo.fix(email)
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
  ].each do |email|
    test "don't mess with #{email}" do
      assert_equal email, EmailTypo.fix(email)
    end
  end

  %w[
    ac ad ae af ag ai al am an ao aq ar as at au aw ax az ba bb bd be bf bg bh
    bi bj bm bn bo br bs bt bv bw by bz ca cc cd cf cg ch ci ck cl cn co cr cs
    cu cv cx cy cz dd de dj dk dm do dz ec ee eg eh er es eu fi fjfk fm fo fr
    ga gb gd ge gf gg gh gi gl gm gn gp gq gr gs gt gu gw gy hk hm hn hr ht
    hu id ie il im in io iq ir is it je jm jo jp ke kg kh ki km kn kp kr kw
    ky kz la lb lc li lk lr ls lt lu lv ly ma mc md me mg mh mk ml mn mp mq
    mr ms mt mu mv mw mx my mz na nc nf ng ni nl no np nr nu nz pa pe pf pg
    ph pk pl pm pn pr ps pt pw py qa re ro rs ru rw sa sb sc sd se sg sh si
    sj sk sl sm sn so sr ss st su sv sx sy sz tc td tf tg th tj tk tl tm tn
    to tp tr tt tv tw tz ua ug uk us uy uz va vc ve vg vi vn vu wf ws ye yt
    yu za zm zw aero asia biz cat com coop info int jobs mobi museum name net
    org post pro tel travel xxx edu gov mil
  ].each do |tld|
    test "accept #{tld} account" do
      email = "john@example.#{tld}"
      assert_equal email, EmailTypo.fix(email)
    end
  end

  %w[cm et ne om].each do |tld|
    test "reject #{tld} account" do
      email = "john@example.#{tld}"
      refute_equal email, EmailTypo.fix(email)
    end
  end

  %w[
    john@veizon.net
    john@verion.net
    john@verizon.net
    john@verzon.net
  ].each do |email|
    test "fix verizon account (#{email})" do
      assert_equal "john@verizon.net", EmailTypo.fix(email)
    end
  end

  %w[
    john@icoud.com
    john@icloud.co
    john@icloud.net
  ].each do |email|
    test "fix icloud account (#{email})" do
      assert_equal "john@icloud.com", EmailTypo.fix(email)
    end
  end

  %w[
    john@outloo.com
    john@outlook.co
    john@outlook.net
  ].each do |email|
    test "fix outlook account (#{email})" do
      assert_equal "john@outlook.com", EmailTypo.fix(email)
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
      assert_equal "john@comcast.net", EmailTypo.fix(email)
    end
  end
end
