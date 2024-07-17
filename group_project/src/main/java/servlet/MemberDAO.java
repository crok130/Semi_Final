package servlet;

import java.sql.*;

public class MemberDAO {
	// MemberVO 객체를 DB에 저장함
	public void insertMember(MemberVO member) {
        String sql = "INSERT INTO member (memberName, memberId, memberEmail, memberPassword, memberPhone, memberAddr, memberGender, memberType) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getId());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, member.getPassword());
            pstmt.setString(5, member.getPhone());
            pstmt.setString(6, member.getAddr());
            pstmt.setString(7, member.getGender());
            pstmt.setInt(8, member.getSeller());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	// 아이디로 회원 조회
	public MemberVO getMember(String memberId) {
        MemberVO member = null;
        String sql = "SELECT * FROM member WHERE memberId = ?";
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
        	conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                member = new MemberVO();
                member.setName(rs.getString("memberName"));
                member.setId(rs.getString("memberId"));
                member.setEmail(rs.getString("memberEmail"));
                member.setPassword(rs.getString("memberPassword"));
                member.setPhone(rs.getString("memberPhone"));
                member.setAddr(rs.getString("memberAddr"));
                member.setGender(rs.getString("memberGender"));
                member.setSeller(rs.getInt("memberType"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, pstmt, rs);
        }

        return member;
    }
}
