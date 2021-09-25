package com.khfinal.devstairs.user.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.khfinal.devstairs.user.dto.InviteTeamDto;
import com.khfinal.devstairs.user.dto.UserDto;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="usermapper.";
	private String base_path = "";
	
	//이메일 중복체크 메소드
	public int emailCheck(String email) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace+"emailCheck", email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	// 유저로그인할때 사용 메소드
	public UserDto login(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(namespace+"selectOne",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	// 회원가입 메소드(udpate) -> name, pw 값 변경
	public int regist(UserDto dto) {
		int res = 0;
		
		try {
			res=sqlSession.insert(namespace+"regist",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//네이버 회원가입시키는 메소드
	public int naverRegist(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace+"naverregist",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	
	
	// 유저한명 데려오는메소드
	public UserDto selectOne(UserDto dto) {
		UserDto res = null;
		try {
			res = sqlSession.selectOne(namespace+"selectOne",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int uploadFile(MultipartFile file,String userid,String path) throws IOException {
		String orginalFilename = file.getOriginalFilename();
		System.out.println(orginalFilename);
		long fileSize = file.getSize();
		byte [] data = file.getBytes();
		mkDir(path);
		System.out.println(base_path +"\\"+ orginalFilename);
		FileOutputStream fos = new FileOutputStream(base_path +"\\"+ orginalFilename);
		fos.write(file.getBytes());
		fos.close();
		//db ������Ʈ �κ�
		UserDto dto = new UserDto();
		dto.setImgurl(base_path +"\\"+ orginalFilename);
		dto.setUserid(userid);
		
		int res = sqlSession.update(namespace+"imgupdate",dto);
		return 0;
	}
	
	public void mkDir(String path) throws IOException {
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH) + 1;
		int date = cal.get(cal.DATE);
		
		base_path = path;
		
		base_path += Integer.toString(year);
		base_path += Integer.toString(month);
		base_path += Integer.toString(date);
		
		System.out.println(base_path);
		File folder = new File(base_path);
		
		if(!folder.exists()) {
			folder.mkdir();
			System.out.println("������ �����Ǿ����ϴ�");
		}else {
			System.out.println("�̹� ������ �����մϴ�");
		}
	}
	// 이메일인증을하면 authstate =0 인상태로 임시가입시키는 메소드
	public int testlogin(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace+"testlogin", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	// 링크타고 들어오면 authstate = 1로 바꾸는 메소드
	public int testupdate(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"authstate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}

	public int testDelete(UserDto dto) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"testdelete",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	//비밀번호찾기시 authkey 업데이트하는 메소드
	public int authkeyUpdate(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"authkeyudate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	//유저정보 ( 상태메세지, 이름 바꾸는 메소드)
	public int UserUpdate(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"infoUpdate",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	//정보수정시(유저 이름) admin값
	public int AdminNameUpdate(Map<String,String> map) {
		int res = 0;
		try {
			res= sqlSession.update(namespace+"adminUpdate",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	//초대된 팀 있나 가져오는 메소드
	public List<InviteTeamDto> inviteList(String userid){
		List<InviteTeamDto> list = null;
		
		try {
			list = sqlSession.selectList(namespace+"inviteList",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//회원탈퇴 메소드
	public int secession(String userid) {
		int res = 0;
		
		try {
			res = sqlSession.delete(namespace+"secession",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	//비밀번호 변경메소드
	public int pwUpdate(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"pwUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
