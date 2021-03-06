# -*- coding: utf-8 -*-
"""
所有通用的功能函数
"""
__author__ = 'XuWeitao'

import json
import decimal

def translateQueryResIntoDict(columns, res):
	"""
	将数据库中检索到的数据按照字段名和记录构成字典列表
	:param columns: 字段名列表
	:param res: 检索结果元组
	:return:返回字典形式的结果列表，即[{"column":rowValue}]
	"""
	if not res:
		return [dict(zip(columns, [None for i in range(0, len(columns))]))]
	return [dict(zip(columns, row)) for row in res]


class DecimalEncoder(json.JSONEncoder):
	"""
	自定义decimalJSONencoder类来使decimal可以序列化
	"""
	def default(self, o):
		if isinstance(o, decimal.Decimal):
			return float(o) * 100 #去掉百分号的结果
		return json.JSONEncoder.default(self, o)

def JSONToCreateTable(JSON):
	rawDict = json.loads(JSON)
	SQL = "CREATE TABLE("
	for k, v in rawDict.items():
		temp = "%s varchar(50),\n"%k if not isinstance(v, bool) else "%s bit,\n"%k
		SQL += temp

	SQL += ")"
	return SQL

if __name__=="__main__":
	print JSONToCreateTable("""{
  "YangPinMingChen": "1",
  "PiCiAndGangHao": "1",
  "ZhengChangOrJiaJi": "ZhengChang",
  "CaiLiaoXingZhi": "AiMu",
  "ShenQingBuMen": "a",
  "SongJianRen": "a",
  "JianCeXingZhi": "ChouJian",
  "WeiWaiXiangMu": "YouHaiWuZhi",
  "LaiYangQingKuang": "DaHuo",
  "CanKaoBiaoZhun": "1",
  "CaoZuoGonYi": "1",
  "WaiJianCaiLiaoMingChen1": "1",
  "QiTaYaoQiu": "1",
  "YuYangJiLu": "DiuQi",
  "PingDing": "HeGe",
  "WaiJianHuoHao1": "1",
  "WaiJianSeHao1": "1",
  "WaiJianPiCiGangHao1": "1",
  "WaiJianGongYingShang1": "1",
  "WaiJianCaiLiaoMingChen2": "1",
  "WaiJianHuoHao2": "1",
  "WaiJianSeHao2": "1",
  "WaiJianPiCiGangHao2": "1",
  "WaiJianGongYingShang2": "1",
  "hasDuanLieQiangLi": true,
  "DuanLieQiangLiBiaoZhun1": "1",
  "DuanLieQiangLiBiaoZhun2": "1",
  "DuanLieQiangLiJianCeJieGuo": "1",
  "hasYaXianYingDu": true,
  "YaXianYingDuBiaoZhun1": "1",
  "YaXianYingDuBiaoZhun2": "1",
  "YaXianYingDuJianCeJieGuo": "1",
  "hasSiPoQiangLi": true,
  "SiPoQiangLiJingXiangBiaoZhun1": "1",
  "SiPoQiangLiJingXiangBiaoZhun2": "1",
  "SiPoQiangLiJingXiangJieGuo": "1",
  "hasMiDu": true,
  "MiDuBiaoZhun1": "1",
  "MiDuBiaoZhun2": "1",
  "MiDuJieGuo": "1",
  "SiPoQiangLiWeiXiangBiaoZhun1": "1",
  "SiPoQiangLiWeiXiangBiaoZhun2": "1",
  "SiPoQiangLiWeiXiangJieGuo": "1",
  "hasHuiTanXing": true,
  "HuiTanGaoDuBiaoZhun1": "1",
  "HuiTanGaoDuBiaoZhun2": "1",
  "HuiTanGaoDuJieGuo": "1",
  "hasDingPoQiangLi": true,
  "DingPoQiangLiBiaoZhun1": "1",
  "DingPoQiangLiBiaoZhun2": "1",
  "DingPoQiangLiJieGuo": "1",
  "HuiTanLvBiaoZhun1": "1",
  "HuiTanLvBiaoZhun2": "1",
  "HuiTanLvJieGuo": "1",
  "hasBoLiQiangLi": true,
  "BoLiQiangLi1BiaoZhun1": "1",
  "BoLiQiangLi1BiaoZhun2": "1",
  "BoLiQiangLi1JieGuo": "1",
  "hasKangHuangBian": true,
  "KangHuangBianBiaoZhun1": "1",
  "KangHuangBianBiaoZhun2": "1",
  "KangHuangBianJieGuo": "1",
  "BoLiQiangLi2BiaoZhun1": "1",
  "BoLiQiangLi2BiaoZhun2": "1",
  "BoLiQiangLi2JieGuo": "1",
  "hasDuanLieShenChangLv": true,
  "DuanLieBiaoJuBiaoZhun1": "1",
  "DuanLieBiaoJuBiaoZhun2": "1",
  "DuanLieBiaoJuJieGuo": "1",
  "hasTanXingShenChangLv": true,
  "TanXingShenChangLv": "1",
  "TanXingShenChangLvJingXiangBiaoZhun1": "1",
  "TanXingShenChangLvJingXiangBiaoZhun2": "1",
  "TanXingShenChangLvJingXiang": "1",
  "DuanLieShenChangLvBiaoZhun1": "1",
  "DuanLieShenChangLvBiaoZhun2": "1",
  "DuanLieShenChangLvJieGuo": "1",
  "TanXingShenChangLvWeiXiangBiaoZhun1": "1",
  "TanXingShenChangLvWeiXiangBiaoZhun2": "1",
  "TanXingShenChangLvWeiXiang": "1",
  "hasLaShenQiangDu": true,
  "LaShenQiangDuZuiDaLiZhiBiaoZhun1": "1",
  "LaShenQiangDuZuiDaLiZhiBiaoZhun2": "1",
  "LaShenQiangDuZuiDaLiZhi": "11",
  "hasNaiZaoXiSeLaoDu": true,
  "NaiZaoXiBianSeBiaoZhun1": "1",
  "NaiZaoXiBianSeBiaoZhun2": "1",
  "NaiZaoXiBianSe": "1",
  "LaShenQiangDuLaShenQiangDuBiaoZhun1": "1",
  "LaShenQiangDuLaShenQiangDuBiaoZhun2": "1",
  "LaShenQiangDuLaShenQiangDu": "1",
  "NaiZaoXiSeLaoDuZhanSeBiaoZhun1": "1",
  "NaiZaoXiSeLaoDuZhanSeBiaoZhun2": "1",
  "NaiZaoXiSeLaoDuZhanSe": "1",
  "hasSiLieQiangDu": true,
  "SiLieQiangDuZuiDaSiLieLiZhiBiaoZhun1": "1",
  "SiLieQiangDuZuiDaSiLieLiZhiBiaoZhun2": "1",
  "SiLieQiangDuZuiDaSiLieLiZhi": "1",
  "hasNaiShuiXiSeLaoDu": true,
  "NaiShuiXiSeLaoDuBianSeBiaoZhun1": "1",
  "NaiShuiXiSeLaoDuBianSeBiaoZhun2": "1",
  "NaiShuiXiSeLaoDuBianSe": "1",
  "SiLieQiangDuSiLieQiangDuBiaoZhun1": "1",
  "SiLieQiangDuSiLieQiangDuBiaoZhun2": "1",
  "SiLieQiangDuSiLieQiangDu": "1",
  "NaiShuiXiSeLaoDuZhanSeBiaoZhun1": "1",
  "NaiShuiXiSeLaoDuZhanSeBiaoZhun2": "1",
  "NaiShuiXiSeLaoDuZhanSe": "1",
  "hasFenBianHuang": true,
  "FenBianHuangBiaoZhun1": "1",
  "FenBianHuangBiaoZhun2": "1",
  "FenBianHuang": "1",
  "hasNaiHanZiSeLaoDu": true,
  "NaiHanZiSeLaoDuBianSeBiaoZhun1": "1",
  "NaiHanZiSeLaoDuBianSeBiaoZhun2": "1",
  "NaiHanZiSeLaoDuBianSe": "1",
  "hasJiaQuan": true,
  "JiaQuanBiaoZhun1": "1",
  "JiaQuanBiaoZhun2": "1",
  "JiaQuan": "1",
  "NaiHanZiSeLaoDuZhanSeBiaoZhun1": "1",
  "NaiHanZiSeLaoDuZhanSeBiaoZhun2": "1",
  "NaiHanZiSeLaoDuZhanSe": "1",
  "hasPH": true,
  "PHBiaoZhun1": "1",
  "PHBiaoZhun2": "1",
  "PH": "1",
  "hasNaiMoCaSeLaoDu": true,
  "GanMoBiaoZhun1": "1",
  "GanMoBiaoZhun2": "1",
  "GanMo": "1",
  "hasXiHouNiuDu": true,
  "XiHouNiuDuBiaoZhun1": "1",
  "XiHouNiuDuBiaoZhun2": "1",
  "XiHouNiuDu": "1",
  "ShiMoBiaoZhun1": "1",
  "ShiMoBiaoZhun2": "1",
  "ShiMo": "1",
  "hasXiDiSuoShuiLv": true,
  "XiDiSuoShuiLvJingXiangBiaoZhun1": "1",
  "XiDiSuoShuiLvJingXiangBiaoZhun2": "1",
  "XiDiSuoShuiLvJingXiang": "1",
  "hasNaiReSeLaoDu": true,
  "NaiReSeLaoDuBiaoZhun1": "1",
  "NaiReSeLaoDu": "1",
  "NaiReSeLaoDuBiaoZhun2": "1",
  "XiDiSuoShuiLvWeiXiangBiaoZhun1": "1",
  "XiDiSuoShuiLvWeiXiangBiaoZhun2": "11",
  "XiDiSuoShuiLvWeiXiang": "1",
  "BuHeGeChuLi": "1"
}
""")
