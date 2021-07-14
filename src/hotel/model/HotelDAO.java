package hotel.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.Close;
import util.DBconnection;

public class HotelDAO {
	public int getNextNum() {
		String SQL = "SELECT hotelNum FROM hotel ORDER BY hotelNum DESC";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}else {
				return 1;
			}
		}catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}finally {
			try {
				Close.close(conn, pstmt, rs);
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	}
	
	
}
