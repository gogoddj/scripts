## scripts
> 工作常用自动化脚本

### python

- aliSendMail.py 阿里云服务器通过465发送邮件
- rds_binlog.py 阿里云rds下载binlog日志
- redisdel.py 删除redis指定键值
- serverCommand.py 连接指定服务器并执行命令
- serverDownload.py 下载服务器上nginx或者laravel日志
- systemissue.py 查看服务器系统信息
- nginx_ip.py 统计nginx访问日志ip并以柱状图显示
- nginx_url.py 统计nginx访问前十的url并以柱状图访问
- gitlabCi.py gitlab结合python实现自动化入口

### shell
- changeServerTag.sh 基于阿里云的灰度发布项目上线脚本
- itMastere.sh it组预上线钩子函数代码
- DevelopUrl.sh it组开发分支自动化更新并钉钉推送url
- object_tag.sh 监听gitlab的tag推送事件，触发并推送最新5个tag的url链接