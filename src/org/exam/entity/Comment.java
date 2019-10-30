package org.exam.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Transient;

@SuppressWarnings("serial")
public class Comment implements Serializable{
	@Id
    private Integer id;

    private String userId;			//评论人的ID
    private Integer sid;			//被评论的文章或者页面的ID(-1:留言板)
    private Integer pid;			//父级评论的id
    private String username;		//评论人的账号
    private String nickname;		//评论人的昵称
    private String avatar;			//评论人的头像地址
    private String email;			//评论人的邮箱地址
    private String url;				//评论人的网站地址
    private Integer status;			//评论的状态
    private String ip;				//评论时的ip
    private String lng;				//经度
    private String lat;				//纬度
    private String address;			//评论时的地址
    private String os;				//评论时的系统类型
    private String osShortName;		//评论时的系统的简称
    private String browser;			//评论时的浏览器类型
    private String browserShortName;//评论时的浏览器的简称
    private String content;			//评论的内容
    private String remark;			//备注（审核不通过时添加）
    private Integer support;		//支持（赞）
    private Integer oppose;			//反对（踩）
    private Date createTime;		//添加时间
    private Date updateTime;		//更新时间
    
    @Transient
    private Integer loveCount;
    @Transient
    Comment parent;
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
		this.userId = userId;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar==null?null:avatar.trim();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url==null?null:url.trim();
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getOsShortName() {
		return osShortName;
	}
	public void setOsShortName(String osShortName) {
		this.osShortName = osShortName;
	}
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	public String getBrowserShortName() {
		return browserShortName;
	}
	public void setBrowserShortName(String browserShortName) {
		this.browserShortName = browserShortName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getSupport() {
		return support;
	}
	public void setSupport(Integer support) {
		this.support = support;
	}
	public Integer getOppose() {
		return oppose;
	}
	public void setOppose(Integer oppose) {
		this.oppose = oppose;
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
	
	
	
	
	public Integer getLoveCount() {
		return loveCount;
	}
	public void setLoveCount(Integer loveCount) {
		this.loveCount = loveCount;
	}
	public Comment getParent() {
		return parent;
	}
	public void setParent(Comment parent) {
		this.parent = parent;
	}
    

}

