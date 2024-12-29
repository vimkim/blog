@_default:
    @just --choose

deploy:
    @echo 'This blog is deployed automatically using github actions!'

today:
    util/new-page.sh

serve:
    mdbook serve
