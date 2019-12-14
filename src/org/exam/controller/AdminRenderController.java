package org.exam.controller;

import java.util.List;

import org.exam.entity.Classes;
import org.exam.entity.Examination;
import org.exam.entity.Faculty;
import org.exam.entity.Subject;
import org.exam.service.ClassesService;
import org.exam.service.ExaminationService;
import org.exam.service.FacultyService;
import org.exam.service.SubjectService;
import org.exam.service.UserService;
import org.exam.util.CoreConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class AdminRenderController {
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private ClassesService classesService;
    @Autowired
    private UserService userService;
    @Autowired
    private ExaminationService examService;
    
    /*课程*/
    @GetMapping("/subjects")
    public String subjects() {
    	return "subject/list";
    }

    /*考试*/
    @GetMapping("/exams")
    public String exams(Model model) {
    	Subject subject = new Subject();
    	subject.setStatus(CoreConst.STATUS_INVALID);
    	List<Subject> subjects = subjectService.select(subject);
    	List<Faculty> faculties = facultyService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<String> grades = userService.selectGradeList();
    	model.addAttribute("subjects", subjects);
    	model.addAttribute("faculties", faculties);
    	model.addAttribute("classes", classes);
    	model.addAttribute("grades", grades);
    	return "exam/list";
    }
    
    /*题目*/
    @GetMapping("/questions")
    public String questions(Model model) {
    	Subject subject = new Subject();
    	subject.setStatus(CoreConst.STATUS_INVALID);
    	List<Subject> subjects = subjectService.select(subject);
    	model.addAttribute("subjects", subjects);
    	return "question/list";
    }
    
    /*成绩*/
    @GetMapping("/grades")
    public String Grade(Model model) {
    	List<String> grades = userService.selectGradeList();
    	List<Faculty> faculties = facultyService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<Subject> subjects = subjectService.selectAll();
    	model.addAttribute("grades", grades);
    	model.addAttribute("faculties", faculties);
    	model.addAttribute("classes", classes);
    	model.addAttribute("subjects", subjects);
    	return "grade/list";
    }
    /**
     * 成绩统计
     * @param model
     * @return
     */
    @GetMapping("/datas")
    public String data(Model model) {
    	List<Examination> examList = examService.selectAllByStatus(CoreConst.STATUS_INVALID);
    	List<String> grades = userService.selectGradeList();
    	List<Faculty> faculties = facultyService.selectAll();
    	List<Classes> classes = classesService.selectAll();
    	List<Subject> subjects = subjectService.selectAll();
    	model.addAttribute("exams", examList);
    	model.addAttribute("grades", grades);
    	model.addAttribute("faculties", faculties);
    	model.addAttribute("classes", classes);
    	model.addAttribute("subjects", subjects);
    	return "statistics/list";
    }
    
    /*评论*/
    @GetMapping("/comments")
    public String comments(){
        return "comment/list";
    }

}
