FROM nginx:latest

RUN apt-get update && \
    apt-get install -y apt-utils \
                    locales && \
    sed -i -e 's/# ja_JP.UTF-8/ja_JP.UTF-8/g' /etc/locale.gen && \
    locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_TIME C

COPY ./src/public /var/www/public

# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
