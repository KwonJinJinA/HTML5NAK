import pymysql
import redis
import hashlib

conn = pymysql.connect(autocommit=True, host="127.0.0.1", user="root", password="game10086...A123456...")
cursor = conn.cursor(cursor=pymysql.cursors.DictCursor)

cursor.execute("select username,ming from account.account")
all=cursor.fetchall()

acckey="a1f8886d329fa228"
for i in all:
    # print(i)
    acc = i['username']
    pw= i['ming']
    newacc = str(acc)+str(pw)+acckey
    md5 = hashlib.md5()   				
    md5.update(newacc.encode('utf-8'))  	
    value = md5.hexdigest()
    cursor.execute("update account.account set accsign = '%s' where username = '%s'"%(value,acc))


sqldict ={}
sql = "select username,accsign from account.account"
cursor.execute(sql)
a=cursor.fetchall()
for q in a :
    uid = q['username']
    sign = q['accsign']
    sqldict[uid]=sign
# print(sqldict)

cursor.execute("SHOW DATABASES;")
all=cursor.fetchall()
for i in all:  
    database = i['Database']
    if str(database).find("xkm_server_")<0 :
        continue
    # if database != "xkm_server_1001":
    #     continue
    print(database)
    sql = "select user_id from %s.role"%(database)
    cursor.execute(sql)
    s=cursor.fetchall()
    for ss in s:
        uid = ss['user_id']
        if not uid in sqldict.keys():
            continue
        newAcc = sqldict[uid]
        sql = "update %s.role set user_id = '%s' where user_id = '%s'"%(database,newAcc,uid)
        cursor.execute(sql)

    sql = "select user_id from %s.recharge_record"%(database)
    cursor.execute(sql)
    s=cursor.fetchall()
    for ss in s:
        uid = ss['user_id']
        if not uid in sqldict.keys():
            continue
        newAcc = sqldict[uid]
        sql = "update %s.role set user_id = '%s' where user_id = '%s'"%(database,newAcc,uid)
        cursor.execute(sql)

    sql = "select user_id from %s.`user`"%(database)
    cursor.execute(sql)
    s=cursor.fetchall()
    for ss in s:
        uid = ss['user_id']
        if not uid in sqldict.keys():
            continue
        newAcc = sqldict[uid]
        sql = "update %s.role set user_id = '%s' where user_id = '%s'"%(database,newAcc,uid)
        cursor.execute(sql)

pool = redis.ConnectionPool(host='127.0.0.1', port=6379, decode_responses=True,password="game10086...A123456...",db=30)
r = redis.Redis(connection_pool=pool)
# print()
keyAll=["user-server-info","xiyou_uc_userId_to_RoleInfo"]
for k in keyAll:
    for aa in r.hkeys(k):
        if not aa in sqldict:
            continue
        val = r.hget(k,aa)
        r.hdel(k,aa)
        r.hset(k,sqldict[aa],val)






