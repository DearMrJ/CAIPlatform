package org.exam.service;

import java.util.List;

import org.exam.entity.Comment;
import org.exam.vo.CommentConditionVo;

public interface CommentService extends BaseService<Comment> {
	
    List<Comment> selectComments(CommentConditionVo vo);

    int deleteBatch(Integer[]ids);

	int totalNum(Integer status);

}
