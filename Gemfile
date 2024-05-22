source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# 最新のRailsを使用する代わりに: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.7'
# Active Record用のsqlite3を使用
gem 'sqlite3', '~> 1.4'
# アプリケーションサーバーとしてPumaを使用
gem 'puma', '~> 5.0'
# スタイルシートにSCSSを使用
gem 'sass-rails', '>= 6'
# アプリのようなJavaScriptをトランスパイルします。詳細: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinksはウェブアプリケーションのナビゲーションを高速化します。詳細: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# JSON APIを簡単に構築できます。詳細: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# 本番環境でAction Cableを実行するためにRedisアダプターを使用
# gem 'redis', '~> 4.0'
# Active Modelのhas_secure_passwordを使用
# gem 'bcrypt', '~> 3.1.7'

# Active Storageのバリアントを使用
gem 'image_processing', '~> 1.2'

# キャッシュを通じてブート時間を短縮します。config/boot.rbで必要です。
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # コード内の任意の場所で 'byebug' を呼び出すと、実行が停止し、デバッガーコンソールが表示されます。
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # 例外ページやコード内の任意の場所で 'console' を呼び出すと、インタラクティブコンソールにアクセスできます。
  gem 'web-console', '>= 4.1.0'
  # 各リクエストのSQL時間やフレームグラフなどのパフォーマンス情報をブラウザで表示します。
  # 本番環境でも動作するように構成できます。詳細: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Springはアプリケーションをバックグラウンドで実行し、開発を高速化します。詳細: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Capybaraのシステムテストとseleniumドライバーのサポートを追加
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # ブラウザでシステムテストを実行するためのウェブドライバーの簡単なインストールと使用
  gem 'webdrivers'
end

# Windowsにはzoneinfoファイルが含まれていないため、tzinfo-data gemをバンドルします。
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'enum_help'
gem 'kaminari','~> 1.2.1'
