package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {
	public BoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(+) from board";
		if (map.get("SearchWord") != null) {
			query += "where " + map.get("searchField") + "like '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}
		return 0;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<>();

		String query = "select count * from board";
		if (map.get("SearchWord") != null) {
			query += "where " + map.get("searchField") + "like '%" + map.get("searchWord") + "%'";
		}
		query += "order by num desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("Postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("Visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("게시물 조회중 오류");
			e.printStackTrace();
		}
		return bbs;
	}

}
