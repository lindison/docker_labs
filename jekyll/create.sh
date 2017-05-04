# http://jekyllrb.com

docker run -d -P -v $(pwd):/site -w /site jekyll/jekyll:stable bundle exec jekyll serve --force_polling -H 0.0.0.0 -p 4000
