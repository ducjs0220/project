package com.study.project.article.controller;

import com.study.project.article.domain.ArticleVO;
import com.study.project.article.service.ArticleService;
import com.study.project.commons.paging.Criteria;
import com.study.project.commons.paging.PageDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

@Controller
@RequestMapping("/article/*")
public class ArticleController {

    private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

    private final ArticleService articleService;

    @Inject
    public ArticleController(ArticleService articleService) {
        this.articleService = articleService;
    }

//    // 목록 페이지 이동(페이징 처리 전)
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public String list(Model model) throws Exception {
//        logger.info("list ...");
//        model.addAttribute("articles", articleService.listAll());
//        return "/article/list";
//    }

    // 목록 페이지 이동(페이징 처리)
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
        logger.info("paging list ...");
        model.addAttribute("articles", articleService.listAll(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, articleService.getTotal(cri)));
        return "/article/list";
    }

    // 등록 페이지 이동
    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String writeGET() {
        logger.info("write GET...");
        return "/article/register";
    }

    // 등록 처리
    @RequestMapping(value = "/write", method = RequestMethod.POST)
    public String writePOST(ArticleVO articleVO,
                            RedirectAttributes redirectAttributes) throws Exception {
        logger.info("write POST...");
        logger.info(articleVO.toString());
        int articleNo = articleService.create(articleVO);
        redirectAttributes.addFlashAttribute("result", articleNo);
        return "redirect:/article/list";
    }

    // 조회 페이지 이동
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public String read(@RequestParam("articleNo") int articleNo,
                       @ModelAttribute("cri") Criteria cri,
                       Model model) throws Exception {

        logger.info("read ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/get";
    }

    // 수정 페이지 이동
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyGET(@RequestParam("articleNo") int articleNo,
                            @ModelAttribute("cri") Criteria cri,
                            Model model) throws Exception {

        logger.info("modifyGet ...");
        model.addAttribute("article", articleService.read(articleNo));

        return "/article/modify";
    }

    // 수정 처리
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(ArticleVO articleVO,
                             @ModelAttribute("cri") Criteria cri,
                             RedirectAttributes redirectAttributes) throws Exception {

        logger.info("modifyPOST ...");
        int count = articleService.update(articleVO);

        if(count == 1) {
            redirectAttributes.addFlashAttribute("result", "success");
        }

        redirectAttributes.addAttribute("pageNum", cri.getPageNum());
        redirectAttributes.addAttribute("amount", cri.getAmount());
        redirectAttributes.addAttribute("type", cri.getType());
        redirectAttributes.addAttribute("keyword", cri.getKeyword());

        return "redirect:/article/list";
    }

    // 삭제 처리
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("articleNo") int articleNo,
                         @ModelAttribute("cri") Criteria cri,
                         RedirectAttributes redirectAttributes) throws Exception {

        logger.info("remove ...");
        int count = articleService.delete(articleNo);

        if(count == 1) {
            redirectAttributes.addFlashAttribute("result" , "success");
        }

        redirectAttributes.addAttribute("pageNum", cri.getPageNum());
        redirectAttributes.addAttribute("amount", cri.getAmount());
        redirectAttributes.addAttribute("type", cri.getType());
        redirectAttributes.addAttribute("keyword", cri.getKeyword());

        return "redirect:/article/list";
    }

}