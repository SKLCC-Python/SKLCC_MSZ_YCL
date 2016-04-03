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
    :param UserID:工号
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
    :param taskInfo:需要修改或新增的数据
    :param userID:工号
    :return:
    """
    raw = Raw_sql()
    if taskInfo['isNew']:
        raw.sql = "insert into RMI_TASK(CreateTime,LastModifiedTime,ProductNo,ColorNo,ArriveTime,UserID,FlowID) values(GETDATE(),GETDATE(),'%s','%s','%s','%s','%s')" \
                  % (taskInfo['ProductNo'], taskInfo['ColorNo'], taskInfo['ArriveTime'], userID, taskInfo['FlowID'])
    else:
        raw.sql = "update RMI_TASK set ProductNo = '%s',ArriveTime = '%s',ColorNo = '%s',LastModifiedTime = GETDATE() where SerialNo = '%s'" \
                  % (taskInfo['ProductNo'], taskInfo['ArriveTime'], taskInfo['ColorNo'], taskInfo['SerialNo'])
    print raw.sql
    raw.update()
    return


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

def getStepDataList(serialNo,processID):
    """
    根据流水号和表格ID获取步骤对应数据
    :param serialNo:流水号
    :param processID:表格ID
    :return:返回数据list，list中每个元素是dict,[{},{}]
    """
    raw = Raw_sql()
    raw.sql = "select Finished as state, StepName as name, RMI_TASK_PROCESS_STEP.StepID as [value] from RMI_TASK_PROCESS_STEP inner join RMI_STEP on RMI_TASK_PROCESS_STEP.StepID = RMI_STEP.StepID where SerialNo = '%s' and ProcessID = '%s'" %(serialNo,processID)
    res,columns = raw.query_all(needColumnName=True)
    stepDataList = translateQueryResIntoDict(columns,res)
    return stepDataList

def getF01DataBySerialNo(serialNo, getMethod, userID):
    """
    获取点开F01表格所需数据
    :param serialNo:流水号
    :param getMethod:获取方式,两种：check和dataEntry
    :param userID:工号
    :return: dict
    """
    formData = {}
    raw = Raw_sql()
    # 构造formData['info']
    raw.sql = "select ProductNo,convert(varchar(16),ArriveTime,20)ArriveTime,convert(varchar(16),AssessTime,20)AssessTime,Assessor,UserID,convert(varchar(16),CreateTime,20)CreateTime,ColorNo from RMI_TASK inner join RMI_TASK_PROCESS " \
              "on  RMI_TASK.SerialNo = RMI_TASK_PROCESS.Serialno where RMI_TASK.SerialNo = '%s' and RMI_TASK_PROCESS.ProcessID = 'F01'" % serialNo
    res, columns = raw.query_one(needColumnName=True)
    formData['info'] = dict(zip(columns, res))
    formData['info']['check'] = True
    if getMethod == 'dataEntry':
        formData['info']['check'] = False

    # 构造formData['data']
    raw.sql = "select DingDanHao,HeGeShu,DaoLiaoZongShu,QiTa,GongYingShang,ShiCeShu,GuiGe,TouChanShu,DingDanShu,BiaoZhiShu,WaiGuan,JianYanHao,MaterialType as SelectedType from RMI_F01_DATA where SerialNo = '%s'" %serialNo
    if getMethod == 'dataEntry':
        raw.sql += "and InspectorNo ='%s'" %userID
    res,columns = raw.query_all(needColumnName=True)
    listData = translateQueryResIntoDict(columns,res)
    formData['data'] = listData[0].copy()
    # 构造formData['data']['listData']
    formData['data']['listData'] = listData
    # 构造formData['data']['step']
    formData['data']['step'] = getStepDataList(serialNo,'F01')
    return formData

def updateStepAndModified(isFinsined, SerialNo, ProcessID, selectedStep, userID):
    """
    更新表单step（填写、审核）的状态（1-完成，0-未完）,更新表格的最新修改人和修改时间
    :param isFinsined:step是否完成
    :param SerialNo:流水号
    :param selectedStep:选中的stepID
    :param userID:工号
    :return:sql语句
    """
    sql = "update RMI_TASK_PROCESS set LastModifiedTime = GETDATE(), LastModifiedUser = '%s' where Serialno = '%s' and ProcessID = '%s' " %(userID,SerialNo,ProcessID)
    if isFinsined:
        sql += "update RMI_TASK_PROCESS_STEP set Finished = 1, FinishTime = GETDATE() ,LastModifiedTime = GETDATE() where SerialNo = '%s' and ProcessID = '%s' and StepID = '%s'" %(SerialNo,ProcessID,selectedStep)
    return sql


def insertF01DataBySerialNo(formData, userID, serialNo):
    """
    根据任务流水号在F01表格中插入数据
    :param formData:需新增的数据
    :param userID:工号
    :param serialNo:流水号
    :return:
    """
    raw = Raw_sql()
    raw.sql = "delete from RMI_F01_DATA where SerialNo = '%s' and InspectorNo = '%s'" %(serialNo,userID)
    if len(formData['listData']) > 0:
        raw.sql += "insert into RMI_F01_DATA(SerialNo, InspectorNo, DaoLiaoZongShu, DingDanHao, MaterialType, GongYingShang, GuiGe, BiaoZhiShu, ShiCeShu, HeGeShu, WaiGuan, JianYanHao, QiTa, TouChanShu, DingDanShu) "
        for dic in formData['listData']:
            valuesList = [dic['GuiGe'],dic['BiaoZhiShu'],dic['ShiCeShu'],dic['HeGeShu'],dic['WaiGuan'],dic['JianYanHao'], dic['QiTa']]
            valuesList.append(dic.get('TouChanShu',None))
            valuesList.append(dic.get('DingDanShu',None))
            values = ','.join(["'"+str(value)+"'" for value in valuesList])
            values = values.replace("'None'",'NULL')
            raw.sql += "select '%s','%s','%s','%s','%s','%s',%s union all " % (serialNo,userID,formData['DaoLiaoZongShu'],formData['DingDanHao'],formData['SelectedType'],formData['GongYingShang'],values)
        raw.sql = raw.sql[:-10]
    raw.sql += updateStepAndModified(formData['isSubmit'],serialNo,'F01',formData['selectedStep'],userID)
    raw.update()
    return



# def deleteTaskBySerialNo(SerialNo):

