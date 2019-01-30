#!/bin/bash

giturl="/.git/config"
webdir="/var/www/html/"
tagdir="/data/html/"
nginxdir="/etc/nginx/conf.d/"
nginxexam="/data/scripts/shell/nginx.conf"

project=$1
branch=$2


function ittagurl() {
    cd $webdir$project
    tag=`git tag|sort -nr|head -n 1`
    cd $tagdir$project && mkdir $tag
    cd $tag
    cp -a $webdir$project . && cd $project
    git fetch && git checkout $tag
    cp .env.produce .env
    composer install
    /usr/local/php7/bin/php artisan queue:restart

    prodir=$tagdir$project/$tag/$project
    httptag=`echo $tag|tr '.' '_'`
    httpurl=$project'-'$httptag'_tag'
    servername=$httpurl'.51ucar.cn'
    nginxconf=$nginxdir/$httpurl.conf
    cp $nginxexam $nginxconf
    sed -i -r "s@root (/[A-Za-z]+)+;@root $project/public;@g" $nginxconf
    sed -i -r "s@server_name _@server_name $servername@g" $nginxconf
	sed -i -r "s@https://x.51ucar.cn@https://$servername@" $nginxconf

	if `sudo -u ucar nginx -t`;then
        sudo -u ucar nginx -s reload
        url_test 'tag:'$tag' \n测试连接:https://'$servername
    else
        url_test '分支名:'$2' \nnginx配置失败'
        exit
    fi

    cd $tagdir
    deleteDir=`ls |sort -n|head -n 1`
    rm -rf $deleteDir

}