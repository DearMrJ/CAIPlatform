package org.exam.service.impl;

import java.util.List;

import org.exam.entity.Comment;
import org.exam.mapper.CommentMapper;
import org.exam.service.CommentService;
import org.exam.vo.CommentConditionVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {
	
    @Autowired
    private CommentMapper commentMapper;
    
    @Override
    public List<Comment> selectComments(CommentConditionVo vo) {
        return commentMapper.selectComments(vo);
    }

    @Override
    public int deleteBatch(Integer[] ids) {
        return commentMapper.deleteBatch(ids);
    }

	@Override
	public int totalNum(Integer status) {
		return commentMapper.totalNum(status);
	}
}
