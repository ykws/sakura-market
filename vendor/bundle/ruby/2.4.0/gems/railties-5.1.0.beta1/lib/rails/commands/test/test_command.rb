require "rails/command"
require "rails/test_unit/minitest_plugin"

module Rails
  module Command
    class TestCommand < Base # :nodoc:
      def help
        perform # Hand over help printing to minitest.
      end

      def perform(*)
        $LOAD_PATH << Rails::Command.root.join("test")

        Minitest.run_via = :rails

        require "active_support/testing/autorun"
      end
    end
  end
end
