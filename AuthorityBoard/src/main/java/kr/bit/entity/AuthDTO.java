package kr.bit.entity;

import lombok.Data;

@Data
public class AuthDTO {
	private int authIdx; // pk
	private int authNum; // 권한 번호(1, 2, 3)
	private String authType; // 권한 타입(3가지 : ROLE_USER, ROLE_MANAGER, ROLE_ADMIN)
	
//	private int memIdx; // 회원 일련번호, FK -> Member와 OneToMany -> Insert시 번거롭다. -> HashMap사용
}


