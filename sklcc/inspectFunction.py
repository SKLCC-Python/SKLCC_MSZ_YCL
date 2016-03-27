# -*- coding: utf-8 -*-
"""
检验工序所使用的所有的功能函数
"""
__author__ = "XuWeitao"
from rawSql import *
from CommonUtilities import *

def getTasksList(UserID):
    """
    获取某用户创建的任务列表
    :param UserID:
    :return: {key:value}
    """
    raw = Raw_sql()
    raw.sql = "select convert(varchar(16),RMI_TASK.ArriveTime,20)ArriveTime, RMI_TASK.ColorNo, convert(varchar(16),RMI_TASK.CreateTime,20)CreateTime, convert(varchar(16),RMI_TASK.LastModifiedTime,20)LastModifiedTime, RMI_TASK.ProductNo, RMI_TASK.SerialNo, RMI_ACCOUNT_USER.Name " \
              "from RMI_TASK,RMI_ACCOUNT_USER where RMI_TASK.UserID = RMI_ACCOUNT_USER.ID"
    if UserID != 'ALL':
        raw.sql += " and RMI_TASK.UserID = '%s'" % UserID
    data_list,col_names = raw.query_all(needColumnName=True)
    return translateQueryResIntoDict(col_names, data_list)


def editTaskInfo(taskInfo, userID):
    """
    插入或更新任务的相关信息
    :param taskInfo:
    :param userID:
    :return:
    """
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
    raw.sql = "select C.ProcessID, C.modifyTime, C.modifyPeople, C.name, C.currentState, convert(float,P.states)states from(" \
              "select M.ProcessID, N.states, (M.max1+1-N.num) curstate from(" \
              "select ProcessID, max(StepSeq) AS max1 from RMI_PROCESS_STEP group by ProcessID" \
              ")M join(" \
              "select ProcessID,count(Finished) AS num, sum(Finished)/count(Finished)*100.0 states from RMI_TASK_PROCESS_STEP where Serialno = '%s' group by ProcessID" \
              ")N on M.ProcessID = N.ProcessID" \
              ")P join(" \
              "select B.*, RMI_STEP.StepName AS currentState from(" \
              "select T.Serialno, T.ProcessID, convert(varchar(16),T.LastModifiedTime,20)modifyTime, convert(varchar(16),T.LastModifiedUser)modifyPeople, RMI_PROCESS_TYPE.Name AS name, RMI_PROCESS_STEP.StepID, RMI_PROCESS_STEP.StepSeq " \
              "from RMI_TASK_PROCESS AS T join RMI_PROCESS_TYPE on T.ProcessID = RMI_PROCESS_TYPE.Id join RMI_PROCESS_STEP on T.ProcessID = RMI_PROCESS_STEP.ProcessID where T.Serialno = '%s'" \
              ")B join RMI_STEP on B.StepID = RMI_STEP.StepID" \
              ")C on P.ProcessID = C.ProcessID and P.curstate = C.StepSeq" % (serialNo, serialNo)
    data_list,col_names = raw.query_all(needColumnName=True)
    return translateQueryResIntoDict(col_names, data_list)


def getFormDataList(serialNo, processID, getMethod):
    """
    获取点开某个表单页面所需数据
    :param serialNo:
    :param processID:
    :param getMethod:
    :return: formData
    """
    formData = {}
    raw = Raw_sql()
    # 构造formData['info']
    raw.sql = "select ProductNo,convert(varchar(16),ArriveTime,20)ArriveTime,convert(varchar(16),AssessTime,20)AssessTime,Assessor,UserID,convert(varchar(16),CreateTime,20)CreateTime,Assessor from RMI_TASK inner join RMI_TASK_PROCESS " \
              "on  RMI_TASK.SerialNo = RMI_TASK_PROCESS.Serialno where RMI_TASK.SerialNo = '%s' and RMI_TASK_PROCESS.ProcessID = '%s'" % (serialNo,processID)
    res, columns = raw.query_one(needColumnName=True)
    formData['info'] = dict(zip(columns, res))
    formData['info']['check'] = True
    if getMethod == 'dataEntry':
        formData['info']['check'] = False

    # 构造formData['data']
    listData = {}
    if processID == 'F01':
        raw.sql = "select DingDanHao,HeGeShu,DaoLiaoZongShu,QiTa,GongYingShang,ShiCeShu,GuiGe,TouChanShu,DingDanHao,BiaoZhiShu,WaiGuan,JianYanHao,MaterialType as SelectedType from RMI_F01_DATA where SerialNo = '%s'" %serialNo
        res,columns = raw.query_one(needColumnName=True)
        listData = dict(zip(columns,res))
    # else:
    #     raw.sql = "select DingDanHao,HeGeShu,DaoLiaoZongShu,QiTa,GongYingShang,ShiCeShu,GuiGe,TouChanShu,DingDanHao,BiaoZhiShu,WaiGuan,JianYanHao,MaterialType as SelectedType from RMI_F01_DATA where SerialNo = '%s'" %serialNo
    #     res,columns = raw.query_one(needColumnName=True)
    #     listData = dict(zip(columns,res))
    formData['data'] = listData.copy()
    # 构造formData['data']['listData']
    formData['data']['listData'] = []
    formData['data']['listData'].append(listData.copy())
    # 构造formData['data']['step']
    formData['data']['step'] = []
    raw.sql = "select Finished,StepName,RMI_TASK_PROCESS_STEP.StepID from RMI_TASK_PROCESS_STEP inner join RMI_STEP on RMI_TASK_PROCESS_STEP.StepID = RMI_STEP.StepID where SerialNo = '%s' and ProcessID = '%s'" %(serialNo,processID)
    res = raw.query_all()
    for item in res:
        step = {}
        step['state'] = item[0]
        step['name'] = item[1]
        step['value'] = item[2]
        formData['data']['step'].append(step)
    return formData

def insertFormDataList(formData, userID, processID, serialNo):
    """
    在相应的表单（F01、F02）中插入数据
    :param formData:
    :param userID:
    :param processID:
    :param serialNo:
    :return:
    """
    raw = Raw_sql()
    raw.sql = ''
    if processID == 'F01':
        for dic in formData['listData']:
            # dic.pop('hasTouChanShu')
            # dic.pop('timer')
            # dic.pop('hasDingDanShu')
            # columns = ','.join(['[' + unicode(key) + ']' for key in dic.keys()])
            # columns = columns.replace('SelectedType','MaterialType')
            # values = ','.join(["'" + unicode(value) + "'" for value in dic.values()])
            # values = values.replace('None','Null')
            raw.sql += "insert into RMI_F01_DATA(SerialNo,GuiGe,BiaoZhiShu,ShiCeShu,HeGeShu,WaiGuan,JianYanHao,QiTa,InspectorNo,GongYingShang,DaoLiaoZongShu,DingDanHao,MaterialType) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s') " \
                       % (serialNo,dic['GuiGe'],dic['BiaoZhiShu'],dic['ShiCeShu'],dic['HeGeShu'],dic['WaiGuan'],dic['JianYanHao'],dic['QiTa'],userID,formData['GongYingShang'],formData['DaoLiaoZongShu'],formData['DingDanHao'],formData['SelectedType'])
    raw.update()



# def deleteTaskBySerialNo(SerialNo):

