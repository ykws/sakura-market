## Rails 5.1.0.beta1 (February 23, 2017) ##

*   Fix running multiple tests in one `rake` command

    e.g. `bin/rake test:models test:controllers`

    *Dominic Cleal*

*   Add option to configure Ruby's warning behaviour to test runner.

    *Yuji Yaginuma*

*   Initialize git repo when generating new app, if option `--skip-git`
    is not provided.

    *Dino Maric*

*   Install Byebug gem as default in Windows (mingw and x64_mingw) platform.

    *Junichi Ito*

*   Make every Rails command work within engines.

    *Sean Collins*, *Yuji Yaginuma*

*   Don't generate HTML/ERB templates for scaffold controller with `--api` flag.

    Fixes #27591.

    *Prathamesh Sonpatki*

*   Make `Rails.env` fall back to `development` when `RAILS_ENV` and `RACK_ENV` is an empty string.

    *Daniel Deng*

*   Remove deprecated `CONTROLLER` environment variable for `routes` task.

    *Rafael Mendonça França*

*   Remove deprecated tasks: `rails:update`, `rails:template`, `rails:template:copy`,
    `rails:update:configs` and `rails:update:bin`.

    *Rafael Mendonça França*

*   Remove deprecated file `rails/rack/debugger`.

    *Rafael Mendonça França*

*   Remove deprecated `config.serve_static_files`.

    *Rafael Mendonça França*

*   Remove deprecated `config.static_cache_control`.

    *Rafael Mendonça França*

*   The `log:clear` task clear all environments log files by default.

    *Yuji Yaginuma*

*   Add Webpack support in new apps via the --webpack option, which will delegate to the rails/webpacker gem.

    To generate a new app that has Webpack dependencies configured and binstubs for webpack and webpack-watcher:

      `rails new myapp --webpack`

    To generate a new app that has Webpack + React configured and an example intalled:

      `rails new myapp --webpack=react`

    *DHH*

*   Add Yarn support in new apps with a yarn binstub and package.json. Skippable via --skip-yarn option.

    *Liceth Ovalles*, *Guillermo Iguaran*, *DHH*

*   Removed jquery-rails from default stack, instead rails-ujs that is shipped
    with Action View is included as default UJS adapter.

    *Guillermo Iguaran*

*   The config file `secrets.yml` is now loaded in with all keys as symbols.
    This allows secrets files to contain more complex information without all
    child keys being strings while parent keys are symbols.

    *Isaac Sloan*

*   Add `:skip_sprockets` to `Rails::PluginBuilder::PASSTHROUGH_OPTIONS`

    *Tsukuru Tanimichi*

*   Allow the use of listen's 3.1.x branch

    *Esteban Santana Santana*

*   Run `Minitest.after_run` hooks when running `rails test`.

    *Michael Grosser*

*   Run `before_configuration` callbacks as soon as application constant
    inherits from `Rails::Application`.

    Fixes #19880.

    *Yuji Yaginuma*

*   A generated app should not include Uglifier with `--skip-javascript` option.

    *Ben Pickles*

*   Set session store to cookie store internally and remove the initializer from
    the generated app.

    *Prathamesh Sonpatki*

*   Set the server host using the `HOST` environment variable.

    *mahnunchik*

*   Add public API to register new folders for `rake notes`:

        config.annotations.register_directories('spec', 'features')

    *John Meehan*

*   Display name of the class defining the initializer along with the initializer
    name in the output of `rails initializers`.

    Before:
        disable_dependency_loading

    After:
        DemoApp::Application.disable_dependency_loading

    *ta1kt0me*

*   Do not run `bundle install` when generating a new plugin.

    Since bundler 1.12.0, the gemspec is validated so the `bundle install`
    command will fail just after the gem is created causing confusion to the
    users. This change was a bug fix to correctly validate gemspecs.

    *Rafael Mendonça França*

*   Default `config.assets.quiet = true` in the development environment. Suppress
    logging of assets requests by default.

    *Kevin McPhillips*

*   Ensure `/rails/info` routes match in development for apps with a catch-all globbing route.

    *Nicholas Firth-McCoy*

*   Added a shared section to `config/secrets.yml` that will be loaded for all environments.

    *DHH*

Please check [5-0-stable](https://github.com/rails/rails/blob/5-0-stable/railties/CHANGELOG.md) for previous changes.
