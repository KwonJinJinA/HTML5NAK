cd /data/redis/bin
nohup ./redis-cli -p 26380 shutdown
#nohup ./redis-cli -p 26381 shutdown
#nohup ./redis-cli -p 26382 shutdown

nohup ./redis-cli -p 6380 -a game10086...A123456... shutdown
nohup ./redis-cli -p 6379 -a game10086...A123456... shutdown
