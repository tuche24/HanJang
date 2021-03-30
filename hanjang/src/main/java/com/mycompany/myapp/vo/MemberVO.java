package com.mycompany.myapp.vo;

import java.sql.Timestamp;


// �������� ������ ����ϴ� Ŭ���� - DTO
public class MemberVO 
{
	private int userNo; 		// 유저번호
	private String id;			// ���̵�
	private String password; 	// ��й�ȣ
	private String name;		// �̸�
    private String nickname;
	private String gender;		// ����
	private String birthdate;		// ���� - ��

	private String email;	// �̸��� - @ �޺κ�
	private String phone;		// ��ȭ
	private String address;		// �ּ�
	private Timestamp reg;		// ������
	
	public MemberVO() {
		
	}

	public MemberVO(String id, String password) {
		super();
		this.id = id;
		this.password=password;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	
	public String getPassword() {return password;}
	public void setPassword(String password) {this.password = password;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	
	public String getNickname() {return nickname;}
	public void setNickname(String nickname) {this.nickname=nickname;	}
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}
	
	public String getBirthdate() {return birthdate;}
	public void setBirthdate(String birthdate) {this.birthdate = birthdate;}

	
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	
	public Timestamp getReg() {return reg;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
