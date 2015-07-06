/*
 * Criado em 05/02/2004
 *
 */
package br.com.relato.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.relato.pool.PoolFilter;

/**
 * @author administrador
 *
 */
public class SqlHelper {
	/**
	 * Executa uma query simples contra o banco.
	 * Não usar com colunas do tipo date.
	 * Não executar queries que podem retornar muitos registros (>50)
	 * Se somente uma coluna for retornada, o List vai conter o valor dela, caso contrario
	 * vai conter uma lista com os valores das colunas em ordem
	 * */
	public static List execute(String query, Object[] params)
		throws SQLException {
		Connection conn = null;
		conn = PoolFilter.getConnection();
		
		PreparedStatement stmt = null;
		try {
			stmt = conn.prepareStatement(query);
			if (params != null) {
				for (int i = 0; i < params.length; ++i) {
					stmt.setObject(i + 1, params[i]);
				}
			}
			return execute(stmt);
		} finally {
			if (stmt != null)
				stmt.close();
		}
	}

	/**
	 * Executa a query que j? recebeu seus parametros
	 * */
	public static List execute(PreparedStatement stmt) throws SQLException {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery();
			int cols = rs.getMetaData().getColumnCount();
			List lst = new ArrayList();
			while (rs.next()) {
				if (cols == 1)
					lst.add(rs.getString(1));
				else {
					List vals = new ArrayList(cols);
					for (int i = 1; i <= cols; ++i)
						vals.add(rs.getString(i));
					lst.add(vals);
				}
			}
			return lst;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

}