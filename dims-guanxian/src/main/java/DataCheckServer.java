import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DataCheckServer {

	private static Connection getConnection() throws Exception {
//		String url = "jdbc:postgresql://127.0.0.1:5432/pipeline1";
		String url = "jdbc:postgresql://192.168.137.130:5432/dims-420000-gx";
		String user = "postgres";
		String password = "postgres";
		Class.forName("org.postgresql.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url, user, password);
		connection.setAutoCommit(false);

		return connection;
	}

	public static void startCheck(int taskId) throws Exception {
		Connection conn = null;
		try {
			conn = getConnection();
			CallableStatement st = null;
			String idxsql;
			ResultSet idxset;
			
			//先删除旧的指标结果
			idxsql = "delete from dims_tm_taskItem_index where task_id=?";
			st = conn.prepareCall(idxsql);
			st.setInt(1, taskId);
			st.execute();
			conn.commit();
			st.close();
			
			/**
			 * 定制存过的指标：必填性指标、规范性指标、关联性指标、业务分类指标等等
			 * 每个指标都有自己的存过，存过名称记录在dims_idx_index.name上
			 * 存过参数p_taskId integer,p_indexCode varchar
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
	/*		idxsql = "select name,code,memo from dims_idx_index where type=1 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				String idxName = idxset.getString("NAME");
				String idxCode = idxset.getString("CODE");
				String procName = idxset.getString("MEMO");
				st = conn.prepareCall("{call " + procName + "(?,?)}");
				st.setInt(1, taskId);
				st.setString(2, idxCode);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			*/
			/**
			 * 扩展表关联性指标
			 * 单个存过proc_checkOneExtTableAssocIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			/*idxsql = "select id,name From dims_idx_index where type=2 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneExtTableAssocIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();*/
			
			/**
			 * 字典准确性指标
			 * 单个存过proc_checkOneDictAccuracyIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			//idxsql = "select id,name From dims_idx_index where type=4 and isenable=1 order by orderby";
			idxsql = "select id,name From dims_idx_index where type=4 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneDictAccuracyIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 必填性分析类指标
			 * 单个存过proc_checkOneMandatoryClassifiedIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=5 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneMandatoryClassifiedIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 关键组成部分指标(非空性要求)
			 * 单个存过proc_checkOneCriticalNotNullIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=6 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneCriticalNotNullIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 区域规范性指标
			 * 单个存过proc_checkOneCriticalAreaCodeIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=7 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneCriticalAreaCodeIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 经纬度核查指标
			 * 单个存过proc_checkOneCoordinateIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=8 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneCoordinateIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			
			/**
			 * 重复性指标
			 * 单个存过proc_checkOneRepeatabilityIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=9 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneRepeatabilityIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 关联关系KEY指标
			 * 单个存过proc_checkOneRelationKeyIndex
			 * 存过参数p_taskId integer,p_indexId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 * 6,关键组成部分指标(非空性要求)
	 	     * 7,区域规范性指标
	         * 8,经纬度核查指标
	         * 9,重复性指标
	         * 10,关联关系KEY指标
			 */
			idxsql = "select id,name From dims_idx_index where type=10 and isenable=1 order by orderby";
			idxset = conn.createStatement().executeQuery(idxsql);
			while (idxset.next()) {
				long start = System.currentTimeMillis();
				int idxId = idxset.getInt("ID");
				String idxName = idxset.getString("NAME");
				st = conn.prepareCall("{call proc_checkOneRelationKeyIndex(?,?)}");
				st.setInt(1, taskId);
				st.setInt(2, idxId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}
			idxset.close();
			
			/**
			 * 指标集合
			 * 只计算下挂指标的算术平均，不标记业务数据，速度很快
			 * 计算全部指标集合的存过proc_checkIndexSet
			 * 存过参数p_taskId integer
			 * dims_idx_index.type:
			 * 1,存储过程定制;
			 * 2,扩展表关联性指标;
			 * 3,指标集合;
			 * 4,字典准确性指标;
			 * 5,必填性分类指标
			 */
			{
				String idxName = "指标集合";
				long start = System.currentTimeMillis();
				st = conn.prepareCall("{call proc_checkIndexSet(?)}");
				st.setInt(1, taskId);

				System.out.println("正在计算指标：" + idxName);
				st.execute();
				conn.commit();
				st.close();
				long end = System.currentTimeMillis();
				long costs = (end - start) / 1000;
				System.out.println("指标计算完成：" + idxName + ",耗时秒:" + costs);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeConnection(conn);
		}
	}
	
	private static void closeConnection(Connection _connection) {
		try {
			if (_connection != null)
				_connection.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		try {
			long start = System.currentTimeMillis();
			
			DataCheckServer.startCheck(1);
			
			long end = System.currentTimeMillis();
			long costs = (end - start) / 1000;
			System.out.println("全部指标计算完毕，耗时秒:" + costs);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
