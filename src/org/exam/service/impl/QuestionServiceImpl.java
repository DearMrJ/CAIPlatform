package org.exam.service.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.exam.enmus.ResponseStatus;
import org.exam.entity.Question;
import org.exam.mapper.QuestionMapper;
import org.exam.service.QuestionService;
import org.exam.util.ResultUtil;
import org.exam.vo.QuestionConditionVo;
import org.exam.vo.base.ResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.exam.exception.ExcelException;

import com.github.pagehelper.util.StringUtil;

@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class QuestionServiceImpl extends BaseServiceImpl<Question> implements QuestionService {
	
	private final static String XLS = "xls";
	private final static String XLSX = "xlsx";
	
	@Autowired
	private QuestionMapper questionMapper;
	
	@Override
	public List<Question> findByCondition(QuestionConditionVo vo) {
		List<Question> list = questionMapper.findByCondition(vo);
		return list;
	}
	
	@Override
	public Question selectById(Integer id) {
		return questionMapper.selectById(id);
	}

	@Override
	public Question insertQuestion(Question question) {
		Date date = new Date();
		question.setCreateTime(date);
		question.setUpdateTime(date);
		questionMapper.insertSelective(question);
		return question;
	}

	@Override
	public int deleteBatch(Integer[] ids) {
		return questionMapper.deleteBatch(ids);
	}

	@Override
	public int totalNum() {
		int totalNum = questionMapper.countNum();
		return totalNum;
	}

	@Override
	public ResponseVo importExcel(MultipartFile file) {
		List<Question> questions = new ArrayList<>();
		Workbook workbook = null;
		//获取文件名
		String fileName = file.getOriginalFilename();
		if(fileName.endsWith(XLS)) {
			try {
				workbook = new HSSFWorkbook(file.getInputStream()); //2003版本
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(fileName.endsWith(XLSX)) {
			try {
				workbook = new XSSFWorkbook(file.getInputStream()); //2007版本
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			new ExcelException(ResponseStatus.FILE_IS_NOT_EXCEL); //文件不是Excel文件
		}
		
		Sheet sheet = workbook.getSheet("sheet1");
		int rows = sheet.getLastRowNum();
		if(rows == 0) {
			new ExcelException(ResponseStatus.DATA_IS_NULL); //数据为空，请填写数据
		}
		
		for(int i = 1; i <= rows+1; i++) {
			Row row = sheet.getRow(i);
			if(row != null) {
				Question question = new Question();
				//题目标题
				String title = getCellValue(row.getCell(0));
				question.setTitle(title);
				//题目内容
				String content = getCellValue(row.getCell(1));
				question.setContent(content);
				//题目类型
				String questionType = getCellValue(row.getCell(2));
				if(!StringUtil.isEmpty(questionType)) {
					Integer new_type = Integer.parseInt(questionType);
					question.setType(new_type);
				}
				//选项A
				String option_a = getCellValue(row.getCell(3));
				question.setOptionA(option_a);
				//选项B
				String option_b = getCellValue(row.getCell(4));
				question.setOptionB(option_b);
				//选项C
				String option_c = getCellValue(row.getCell(5));
				question.setOptionC(option_c);
				//选项D
				String option_d = getCellValue(row.getCell(6));
				question.setOptionD(option_d);
				//答案
				String answer = getCellValue(row.getCell(7));
				question.setAnswer(answer);
				//解析
				String parse = getCellValue(row.getCell(8));
				question.setParse(parse);
				//分值
				String score = getCellValue(row.getCell(9));
				if(!StringUtil.isEmpty(score)) {
					Integer new_score = Integer.parseInt(score);
					question.setScore(new_score);
				}
				//题目难度
				String difficulty = getCellValue(row.getCell(10));
				if(!StringUtil.isEmpty(difficulty)) {
					Integer new_difficulty = Integer.parseInt(difficulty);
					question.setDifficulty(new_difficulty);
				}
				//课程ID
				String subject_id = getCellValue(row.getCell(11));
				if(!StringUtil.isEmpty(subject_id)) {
					Integer new_subject_id = Integer.parseInt(subject_id);
					question.setSubjectId(new_subject_id);
				}
				//状态
				String status = getCellValue(row.getCell(12));
				if(!StringUtil.isEmpty(status)) {
					Integer new_status = Integer.parseInt(status);
					question.setStatus(new_status);
				}
				questions.add(question);
			}
		}
		int i = questionMapper.batchInsert(questions); //批量插入
		if(i > 0) {
			return ResultUtil.success("成功导入"+ rows + "道题目");
		}else {
			return ResultUtil.error("导入失败");
		}
	}
	
	public String getCellValue(Cell cell) {
        String value = "";
        if (cell != null) {
            switch(cell.getCellType()){
                case HSSFCell.CELL_TYPE_NUMERIC:// 数字
                     value = cell.getNumericCellValue()+ " ";
                    if(HSSFDateUtil.isCellDateFormatted(cell)){
                        Date date = cell.getDateCellValue();
                        if(date != null){
                            value = new SimpleDateFormat("yyyy-MM-dd").format(date); //  日期格式化
                        }else{
                           value = "";
                        }
                    }else {
                        //  解析cell时候 数字类型默认是double类型的 但是想要获取整数类型 需要格式化
                        value = new DecimalFormat("0").format(cell.getNumericCellValue());
                    }
                    break;
                case HSSFCell.CELL_TYPE_STRING: //  字符串
                    value = cell.getStringCellValue();
                    break;
                case HSSFCell.CELL_TYPE_BOOLEAN:   //  Boolean类型
                    value = cell.getBooleanCellValue()+"";
                    break;
                case HSSFCell.CELL_TYPE_BLANK:   // 空值
                    value = "";
                    break;
                case HSSFCell.CELL_TYPE_ERROR: // 错误类型
                    value ="非法字符";
                    break;
                default:
                    value = "未知类型";
                    break;
            }
 
        }
        return value.trim();
    }

	@Override
	public int countBySubjectId(Integer subjectId) {
		return questionMapper.countBySubjectId(subjectId);
	}
}
