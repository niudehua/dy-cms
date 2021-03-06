package com.fh.service.system.statistics;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 说明：  访问统计接口
 * 
 * 
 */
public interface StatisticsManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> grlist(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**pv流量
	 * @param pd
	 * @throws Exception
	 */
	public PageData pvCharts(PageData pd)throws Exception;
	
	/**独立IP访客
	 * @param pd
	 * @throws Exception
	 */
	public PageData ipCharts(PageData pd)throws Exception;
	
	/**地区统计
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> areaCharts(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

