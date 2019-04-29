package com.vladooha.controller;

import com.vladooha.data.entities.courses.Course;
import com.vladooha.data.entities.courses.CoursePage;
import com.vladooha.data.entities.courses.CourseTextPage;
import com.vladooha.service.CourseService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CourseConstructController {
    private static final Logger logger = LogManager.getLogger(CourseConstructController.class);

    @Autowired
    private CourseService courseService;

    /// Simple requests
    @GetMapping("/constructor/course_create")
    public String getCourseConstructor(Map<String, Object> model) {
        model.put("categories", courseService.getCategories());

        return "/constructor/course_create";
    }

    /// AJAX
    @GetMapping("/ajax/course_create")
    public @ResponseBody
    String create(
            @RequestParam int categoryNum,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam String[] tags,
            @RequestParam boolean isPrivate,
            Principal principal
    ) {
        logger.debug("ajax: course_create");
        logger.debug("Category number - " + categoryNum);
        logger.debug("Name - " + name);
        logger.debug("Description - " + description);
        logger.debug("isPrivate - " + isPrivate);

        // TODO: Tags realization
//        List<String> tags = new ArrayList<>();
//        tags.add("test_tag1");
//        tags.add("test_tag2");
        Long course_id = courseService.createCourse(categoryNum, name, description, tags, isPrivate);

        if (course_id != -1L) {
            return String.valueOf(course_id);
        } else {
            return "";
        }
    }

    @GetMapping("/ajax/course_struct")
    public @ResponseBody
    String setStruct(
            @RequestParam long course_id,
            @RequestParam String type_list
    ) {
        logger.debug("ajax: course_struct");
        logger.debug("Id - " + course_id);
        logger.debug("Types - " + type_list);

//        Gson converter = new Gson();
//
//        Type jsonType = new TypeToken<List<String>>(){}.getType();
//        List<String> typeList =  converter.fromJson(type_list, jsonType);
        String[] types = type_list.split("\\,");
        List<String> typeList = new ArrayList<>();


        logger.debug("Types:");
        for (String type : types) {
            logger.debug(type);
            typeList.add(type);
        }

        try {
            Long[] pageIds = courseService.setCourseStruct(course_id, typeList);
//            Type ansJsonType = new TypeToken<Long[]>(){}.getType();
//            String answer = converter.toJson(pageIds, ansJsonType);

            StringBuilder idString = new StringBuilder();
            for (Long pageId : pageIds) {
                idString.append(pageId);
                idString.append(",");
            }
            idString.replace(idString.length() - 1, idString.length(), "");

            return idString.toString();
        } catch (Exception e) {
            logger.error("ajax: course_struct error: ", e);

            return "";
        }
    }

    @GetMapping("/ajax/course_page_text")
    public @ResponseBody
    String setTextPage(
            @RequestParam long course_id,
            @RequestParam long page_id,
            @RequestParam String title,
            @RequestParam String text
    ) {
        logger.debug("ajax: course_page_text");
        logger.debug("Course id - " + course_id);
        logger.debug("Page id - " + page_id);
        logger.debug("Title - " + title);
        logger.debug("Text - " + text);

        return courseService.fillTextPage(course_id, page_id, title, text);
    }

    @GetMapping("/ajax/course_page_test")
    public @ResponseBody
    String setTestPage(
            @RequestParam long course_id,
            @RequestParam int page_id,
            @RequestParam String title,
            @RequestParam String question,
            @RequestParam int score,
            @RequestParam String ans,
            @RequestParam String rightAns,
            @RequestParam String type
    ) {
        logger.debug("ajax: course_page_test");
        logger.debug("Course id - " + course_id);
        logger.debug("Page id - " + page_id);
        logger.debug("Title - " + title);
        logger.debug("Question - " + question);
        logger.debug("Answers - " + ans);
        logger.debug("Right answers - " + rightAns);

        return courseService.fillTestPage(course_id, page_id, title, question, score, ans, rightAns, type);
    }

    // TODO: Return a new page
}