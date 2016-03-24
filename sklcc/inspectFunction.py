# -*- coding: utf-8 -*-
"""
检验工序所使用的所有的功能函数
"""
__author__ = "XuWeitao"
from rawSql import *
from CommonUtilities import *

def getTasksList(UserID):
    raw = Raw_sql()
    raw.sql = "select convert(varchar(16),RMI_TASK.ArriveTime,20)ArriveTime, RMI_TASK.ColorNo, convert(varchar(16),RMI_TASK.CreateTime,20)CreateTime, convert(varchar(16),RMI_TASK.LastModifiedTime,20)LastModifiedTime, RMI_TASK.ProductNo, RMI_TASK.SerialNo, RMI_ACCOUNT_USER.Name " \
              "from RMI_TASK,RMI_ACCOUNT_USER where RMI_TASK.UserID = RMI_ACCOUNT_USER.ID"
    if UserID != 'ALL':
        raw.sql += " and RMI_TASK.UserID = '%s'" % UserID
    data_list,col_names = raw.query_all(needColumnName=True)
    return translateQueryResIntoDict(col_names, data_list)


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


def getTaskProcessList(serialNo):
    raw = Raw_sql()
    raw.sql = "select C.ProcessID, C.modifyPeople, C.modifyTime, C.name, C.currentState, convert(float,P.states)states from(" \
              "select RMI_TASK_PROCESS.ProcessID, min(RMI_PROCESS_STEP.StepSeq)curstates,(1-min(RMI_PROCESS_STEP.StepSeq))/max(RMI_PROCESS_STEP.StepSeq)*100.0states " \
              "from RMI_TASK_PROCESS join RMI_PROCESS_STEP on RMI_TASK_PROCESS.ProcessID = RMI_PROCESS_STEP.ProcessID where RMI_TASK_PROCESS.Serialno = '%s' group by RMI_TASK_PROCESS.ProcessID)P join(" \
              "select B.*, RMI_STEP.StepName AS currentState from(" \
              "select RMI_TASK_PROCESS.ProcessID, convert(varchar(16),RMI_TASK_PROCESS.LastModifiedTime,20)modifyTime, convert(varchar(16),RMI_TASK_PROCESS.LastModifiedUser)modifyPeople, RMI_PROCESS_TYPE.Name AS name, RMI_PROCESS_STEP.StepID, RMI_PROCESS_STEP.StepSeq " \
              "from RMI_TASK_PROCESS join RMI_PROCESS_TYPE on RMI_TASK_PROCESS.ProcessID = RMI_PROCESS_TYPE.Id join RMI_PROCESS_STEP on RMI_TASK_PROCESS.ProcessID = RMI_PROCESS_STEP.ProcessID " \
              "where RMI_TASK_PROCESS.Serialno = '%s')B join RMI_STEP on B.StepID = RMI_STEP.StepID)C on P.ProcessID = C.ProcessID and P.curstates = C.StepSeq" % (serialNo, serialNo)
    data_list,col_names = raw.query_all(needColumnName=True)
    return translateQueryResIntoDict(col_names, data_list)


#
# def deleteTaskBySerialNo(SerialNo):

