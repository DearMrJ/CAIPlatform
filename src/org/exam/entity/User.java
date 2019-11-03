package org.exam.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.exam.util.CoreConst;

@Table(name = CoreConst.USER_TABLE)//整合通用mapper，实体类名与数据库表名不一致时候使用 @Table
@SuppressWarnings("serial")
public class User implements Serializable{
	@Id
	private Integer id;	
	private String userId;
	private Integer classId;	//班级标识符
	private String username;	//姓名
	private String password;	//密码（密文）
	private String salt;		//盐值
	private String nickname;	//昵称
	private String img;			//头像URL
	private Integer sex;		//性别（1男0女）
	private Integer age;		//年龄
	private Integer status;		//用户状态
	private String description;	//个性签名，个人简介
	private String email;		//email，可选做考试通知和密码修改通知
	private String tel;			//手机号，可选作短信通知
	private String grade;		//年级
	private Date createTime;	//创建记录时间
	private Date updateTime;	//最后一次修改时间
	private Date lastLoginTime;	//最后一次登录时间
	private Integer totalTime;	//在线总时长（毫秒计数）
	
    @Transient	//@Transient表示该属性并非一个到数据库表的字段的映射,ORM框架将忽略该属性
    private String loginIpAddress;
    @Transient
    private List<Role> roles;
    @Transient
    private Faculty faculty;
    @Transient
    private Classes classes;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId == null ? null : userId.trim();
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String name) {
		this.username = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 重写获取盐值方法，用于shiro盐值加密
	 * @return
	 */
	public String getCredentialsSalt() {
		return "exam"+username+salt;
	}
	
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel == null ? null : tel.trim();
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getLastLogonTime() {
		return lastLoginTime;
	}
	public void setLastLogonTime(Date lastLogonTime) {
		this.lastLoginTime = lastLogonTime;
	}
	public Integer getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(Integer totalTime) {
		this.totalTime = totalTime;
	}
	
	
	
	
	
	
	
	
	
	
	public String getLoginIpAddress() {
		return loginIpAddress;
	}
	public void setLoginIpAddress(String loginIpAddress) {
		this.loginIpAddress = loginIpAddress;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	public Classes getClasses() {
		return classes;
	}
	public void setClasses(Classes classes) {
		this.classes = classes;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
//	@Override
//	public String toString() {
//		return "\nUser [id=" + id + ", userId=" + userId + ", classId=" + classId + ", username=" + username + ", password="
//				+ password + ", salt=" + salt + ", nickname=" + nickname + ", img=" + img + ", sex=" + sex + ", age="
//				+ age + ", status=" + status + ", description=" + description + ", email=" + email + ", tel=" + tel
//				+ ", grade=" + grade + ", createTime=" + createTime + ", updateTime=" + updateTime + ", lastLoginTime="
//				+ lastLoginTime + ", totalTime=" + totalTime + ", loginIpAddress=" + loginIpAddress + ", roles=" + roles
//				+ ", faculty=" + faculty + ", classes=" + classes + "]";
//	}
//	
}
