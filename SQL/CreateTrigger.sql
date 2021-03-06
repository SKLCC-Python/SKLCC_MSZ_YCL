
----RMI_TASK表插入后更新RMI_TASK_PROCESS
CREATE TRIGGER update_rmi_task_process_when_rmi_task_insert
ON rmi_task
FOR INSERT
AS
DECLARE @flow uniqueidentifier, @serial uniqueidentifier, @process varchar(50), @userID varchar(50);
DECLARE CUR_INS CURSOR SCROLL FOR SELECT FlowID, Serialno, UserID FROM INSERTED;
OPEN CUR_INS;
FETCH FIRST FROM CUR_INS INTO @flow, @serial, @userID;
WHILE( @@fetch_status=0 ) 
BEGIN 
	DECLARE CUR_SEL CURSOR SCROLL FOR SELECT ProcessID FROM RMI_FLOW_PROCESS WHERE FlowID = @flow;
	OPEN CUR_SEL;
	FETCH FIRST FROM CUR_SEL INTO @process;
	WHILE( @@fetch_status=0 ) 
	BEGIN 
		INSERT INTO RMI_TASK_PROCESS(Serialno, ProcessID, LastModifiedUser, LastModifiedTime) VALUES(@serial, @process, @userID, GETDATE());
		FETCH NEXT FROM CUR_SEL INTO @process;
	END
	CLOSE CUR_SEL;
	DEALLOCATE CUR_SEL;
	FETCH NEXT FROM CUR_INS INTO @flow, @serial, @userID;
END
CLOSE CUR_INS;
DEALLOCATE CUR_INS;


----rmi_task_process表插入后更新RMI_TASK_PROCESS_STEP
CREATE TRIGGER update_rmi_task_process_step_when_rmi_task_process_insert
ON rmi_task_process
FOR INSERT
AS
DECLARE @step uniqueidentifier, @serial uniqueidentifier, @process varchar(50);
DECLARE CUR_INS_RMI_TASK_PROCESS CURSOR SCROLL FOR SELECT ProcessID, Serialno FROM INSERTED;
OPEN CUR_INS_RMI_TASK_PROCESS;
FETCH FIRST FROM CUR_INS_RMI_TASK_PROCESS INTO @process, @serial;
WHILE( @@fetch_status=0 ) 
BEGIN 
	DECLARE CUR_SEL_RMI_PROCESS_STEP CURSOR SCROLL FOR SELECT StepID FROM RMI_PROCESS_STEP WHERE ProcessID = @process;
	OPEN CUR_SEL_RMI_PROCESS_STEP;
	FETCH FIRST FROM CUR_SEL_RMI_PROCESS_STEP INTO @step;
	WHILE( @@fetch_status=0 ) 
	BEGIN 
		INSERT INTO RMI_TASK_PROCESS_STEP(Serialno, ProcessID, StepID, Finished, LastModifiedTime)
		 VALUES(@serial, @process, @step, 0, GETDATE());
		FETCH NEXT FROM CUR_SEL_RMI_PROCESS_STEP INTO @step;
	END
	CLOSE CUR_SEL_RMI_PROCESS_STEP;
	DEALLOCATE CUR_SEL_RMI_PROCESS_STEP;
	FETCH NEXT FROM CUR_INS_RMI_TASK_PROCESS INTO @process, @serial;
END
CLOSE CUR_INS_RMI_TASK_PROCESS;
DEALLOCATE CUR_INS_RMI_TASK_PROCESS;


----rmi_task表删除任务后更新所有包含流水号的表
CREATE TRIGGER update_other_tables_when_delete_rmi_task
ON rmi_task
FOR DELETE
AS
DECLARE @serial uniqueidentifier;
DECLARE CUR_DEL_IN_RMI_TASK CURSOR SCROLL FOR SELECT Serialno FROM DELETED;
OPEN CUR_DEL_IN_RMI_TASK;
FETCH FIRST FROM CUR_DEL_IN_RMI_TASK INTO @serial;
WHILE( @@fetch_status=0 ) 
BEGIN 
	DELETE FROM RMI_TASK_PROCESS WHERE Serialno = @serial;
	DELETE FROM RMI_TASK_PROCESS_STEP WHERE SerialNo = @serial;
	DELETE FROM RMI_F01_DATA WHERE SerialNo = @serial;
	DELETE FROM RMI_F02_DATA WHERE SerialNo = @serial;
	FETCH NEXT FROM CUR_DEL_IN_RMI_TASK INTO @serial;
END
CLOSE CUR_DEL_IN_RMI_TASK;
DEALLOCATE CUR_DEL_IN_RMI_TASK;



