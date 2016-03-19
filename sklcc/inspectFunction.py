# -*- coding: utf-8 -*-
"""
检验工序所使用的所有的功能函数
"""
__author__ = "XuWeitao"
from rawSql import *
from CommonUtilities import *

# def getTasksList(UserID):
#
def editTaskInfo(taskInfo, userID):
    raw = Raw_sql()
    if taskInfo['isNew']:
        raw.sql = "insert into RMI_TASK(CreateTime,LastModifiedTime,ProductNo,ColorNo,ArriveTime,UserID,FlowID) values(GETDATE(),GETDATE(),'%s','%s','%s','%s','%s')" \
                  % (taskInfo['ProductNo'], taskInfo['ColorNo'], taskInfo['ArriveTime'], userID, taskInfo['FlowID'])
    else:
        raw.sql = "update RMI_TASK set ProductNo = '%s',ArriveTime = '%s',ColorNo = '%s',LastModifiedTime = GETDATE() where SerialNo = '%s'" \
                  % (taskInfo['ProductNo'], taskInfo['ArriveTime'], taskInfo['ColorNo'], taskInfo['SerialNo'])
    raw.update()


def getFlowList():
	"""
	从数据库获取所有的工作流列表
	:return:返回{"name":FlowName,"value":FlowID}
	"""
	raw = Raw_sql()
	raw.sql = "SELECT FlowID AS value, FlowName AS name FROM RMI_WORK_FLOW WITH(NOLOCK)"
	res, columns = raw.query_all(needColumnName=True)
	return translateQueryResIntoDict(columns, res)

#
# def deleteTaskBySerialNo(SerialNo):

