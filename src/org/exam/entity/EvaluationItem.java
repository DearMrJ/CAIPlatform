package org.exam.entity;

import java.io.Serializable;

import javax.persistence.Id;

@SuppressWarnings("serial")
public class EvaluationItem implements Serializable{
	@Id
	private Integer id;
	private Integer evaluationId;
	private Integer itemId;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(Integer evaluationId) {
		this.evaluationId = evaluationId;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	
	
}
