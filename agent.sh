#!/bin/sh

# 下载并解压 Nezha agent
wget -O ~/nezha-agent_freebsd_amd64.zip https://github.com/nezhahq/agent/releases/download/v0.16.7/nezha-agent_freebsd_amd64.zip
unzip ~/nezha-agent_freebsd_amd64.zip -d ~/domains/vedrgt.serv00.com/public_html/nezhapanel

# 创建 tmp 目录
mkdir -p ~/tmp

# 切换到 nezhapanel 目录
cd ~/domains/vedrgt.serv00.com/public_html/nezhapanel

# 赋予 nezha-agent 可执行权限
chmod +x nezha-agent

# 创建 agent.sh 脚本
cat > agent.sh << EOF
#!/bin/sh

export TMPDIR=/home/USERNAME/tmp

/home/USERNAME/domains/vedrgt.serv00.com/public_html/nezhapanel/nezha-agent -s 47.119.127.149:8008 -p BlVFeb2XQAftxysjKW5Z5d51NPsAOVk3 -d
EOF

# 赋予 agent.sh 可执行权限
chmod +x agent.sh

# 后台运行 agent.sh 脚本
nohup ./agent.sh &
