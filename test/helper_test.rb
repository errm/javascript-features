require File.join(File.dirname(__FILE__), *%w[test_helper])

class HelperTest < Test::Unit::TestCase
  include JavascriptFeatures::Helper

  context "when a JavaScript feature is enabled" do
    setup{ use_javascript_for "something" }
    should "set the corresponding body class" do
      assert_equal "with-js-something", javascript_feature_classes
    end
  end

  context "when the same feature is enabled multiple times" do
    setup do
      use_javascript_for "something"
      use_javascript_for "something-else"
      use_javascript_for "something"
    end
    should "only include each class once" do
      assert_equal "with-js-something with-js-something-else", javascript_feature_classes
    end
  end

  context "when no features have been enabled" do
    should "not produce any classes" do
      assert_equal "", javascript_feature_classes
    end
  end
end
