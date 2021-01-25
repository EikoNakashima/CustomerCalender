FROM ruby:2.6.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim \
                       yarn

RUN mkdir /CustomerCalender
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

WORKDIR /CustomerCalender

COPY Gemfile /CustomerCalender/Gemfile
COPY Gemfile.lock /CustomerCalender/Gemfile.lock

ENV BUNDLER_VERSION 2.1.4
RUN gem install bundler
RUN bundle install
RUN yarn install

COPY . /CustomerCalender

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids


# ##########################
# # RoR Container
# # setup step
# # 1. install yarn
# # 2. install node.js
# # 3. create application user ( docker launch user)
# # 4. add rails application ( app_name )
# # 5. switch app user
# ##########################
# FROM ruby:2.7.0
# # -q 標準出力しない、-y インタラクティブにyesと答える。
# # /var/lib/apt/lists配下のキャッシュを削除し容量を小さくする
# RUN apt-get update -qq && \
#     apt-get install -y \
#     build-essential \
#     libpq-dev \
#     imagemagick \
#     vim && \
#     rm -rf /var/lib/apt/lists/*
# ENV LANG C.UTF-8
# # timezoneを日本に変更
# RUN unlink /etc/localtime && \
#     ln -s /usr/share/zoneinfo/Japan /etc/localtime
# # install yarn
# # aptコマンドをhttpsに対応させるためにapt-transport-httpsを入れる http://mirahouse.jp/n10/2015/12/17-145739.html
# # 複数DLに対応させるためwgetを入れる https://www.atmarkit.co.jp/ait/articles/1506/09/news006.html
# RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
#     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#     apt-get update && apt-get install -y yarn
# # install Node.js
# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
# # create application user
# # -m(--create-home): ホームディレクトリの作成
# # -s(--shell) ログインシェル ユーザー名: ユーザに対してログインシェルを指定。
# # bin/falseとするとログインできないユーザを作成可能。セキュアになる。
# # https://eng-entrance.com/linux-command-useradd
# # https://www.express.nec.co.jp/linux/distributions/knowledge/system/false.html
# RUN useradd --user-group --create-home --shell /bin/false app
# ENV APP_ROOT /app_name
# RUN mkdir /$APP_ROOT && \
#     mkdir /$APP_ROOT/log && \
#     mkdir -p /$APP_ROOT/tmp/sockets /$APP_ROOT/tmp/pids
# WORKDIR /$APP_ROOT
# COPY Gemfile /$APP_ROOT
# COPY Gemfile.lock /$APP_ROOT
# RUN gem install bundler -v 2.0.2 && \
#     bundle config --global build.nokogiri --use-system-libraries && \
#     bundle install --path=vendor/bundle --jobs 4
# ADD . /$APP_ROOT
# EXPOSE 3000
# RUN chown -R app:app /$APP_ROOT
# USER app