# coding=utf-8
import configparser
import os
import logging
import colorlog
import pymysql
import sys
import subprocess

log_colors_config = {
    'DEBUG': 'white',  # cyan white
    'INFO': 'green',
    'WARNING': 'yellow',
    'ERROR': 'red',
    'CRITICAL': 'bold_red',
}
logger = logging.getLogger('logger_name')

# 输出到控制台
console_handler = logging.StreamHandler()

# 日志级别，logger 和 handler以最高级别为准，不同handler之间可以不一样，不相互影响
logger.setLevel(logging.DEBUG)
console_handler.setLevel(logging.DEBUG)

# 日志输出格式
console_formatter = colorlog.ColoredFormatter(
    # fmt='%(log_color)s[%(asctime)s.%(msecs)03d] %(filename)s -> %(funcName)s line:%(lineno)d [%(levelname)s] : %(message)s',
    fmt='%(log_color)s[%(asctime)s.%(msecs)03d] [%(levelname)s] : %(message)s',
    datefmt='%Y-%m-%d  %H:%M:%S',
    log_colors=log_colors_config
)
console_handler.setFormatter(console_formatter)

# 重复日志问题：
# 1、防止多次addHandler；
# 2、loggername 保证每次添加的时候不一样；
# 3、显示完log之后调用removeHandler
if not logger.handlers:
    logger.addHandler(console_handler)

console_handler.close()
def runcmd(command, s):
    logger.info(s)

    ret = subprocess.run(command, shell=True, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, encoding="utf-8")
    if ret.returncode == 0:
        logger.info("success")
    else:
        if str(s).find("关闭") >= 0 or str(s).find("备份并删除") >= 0:
            logger.error("执行报错!!\n错误命令:   "+command+'')
            logger.warning("如重复合服 可忽略此错误")
        else:
            logger.error("执行报错!!\n错误命令:   "+command+'')
            sys.exit()

if not os.path.exists("./config.ini"):
    logger.error("配置文件 config 不存在")
    sys.exit()

cf = configparser.ConfigParser()
cf.read('./config.ini', encoding="UTF-8")

conn = pymysql.connect(autocommit=True, host=cf.get('MYSQL', 'mysqlhost'), user=cf.get(
    'MYSQL', 'mysqluser'), password=cf.get('MYSQL', 'mysqlpasswd'))
cursor = conn.cursor(cursor=pymysql.cursors.DictCursor)
fuquArr = []

if __name__ == '__main__':
    qianzhui = cf.get("config", "qianzhui")+"_"
    zhuquId = cf.get("config", "zhuqu")
    fuqu = cf.get("config", "fuqu")
    logger.info("主区ID: "+zhuquId)
    logger.info("副区ID: "+fuqu)
    fuquArr = fuqu.split(",")
    logger.warning("确认以上服务器将被合并,回车键继续")
    logger.warning("CTRL + C 可退出或中断程序")
    input("")
    logger.info('===========================================')
    zqdb = qianzhui+zhuquId
    noMerge=[
        'boss_tiaozhan_refresh',
        'houtai_data',
        'role_jingji',
        'server_recorde',
        'system_mail',
        'wenhuangzhen_boss_refresh',
        'auction_item_data',
    ]

    for fq in fuquArr:
        fqdb = qianzhui+fuqu
        cursor.execute("SHOW TABLES FROM %s;"%(fqdb))
        all=cursor.fetchall()
        for s in all:
            table = s["Tables_in_"+fqdb]
            if table in noMerge:
                continue
            # sql = "desc %s.%s"%(zqdb,table)
            # cursor.execute(sql)
            # tableDesc = cursor.fetchall()
            # # print(cursor.fetchall())
            # # for a in  tableDesc:
            # #     print(a['Field'])
            # sql = "insert into `%s`.`%s` ("%(zqdb,table)
            # for a in tableDesc:
            #     a = a['Field']
            #     # print(a)
            #     sql += "`%s`,"%(a)
            # sql =sql[:-1]
            # sql += ")"
            # print(sql)
            sql = "REPLACE into %s.%s   (select * from %s.%s)"%(zqdb,table,fqdb,table)
            cursor.execute(sql)

            
