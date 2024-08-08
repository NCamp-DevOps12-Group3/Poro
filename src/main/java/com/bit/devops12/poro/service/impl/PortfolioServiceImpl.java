package com.bit.devops12.poro.service.impl;

import com.bit.devops12.poro.dao.CssDao;
import com.bit.devops12.poro.dao.HtmlDao;
import com.bit.devops12.poro.dao.JavascriptDao;
import com.bit.devops12.poro.dao.PortfolioDao;
import com.bit.devops12.poro.dto.*;
import com.bit.devops12.poro.mapper.PortfolioMapper;
import com.bit.devops12.poro.mapper.SkillTagMapper;
import com.bit.devops12.poro.model.Portfolio;
import com.bit.devops12.poro.model.SkillTag;
import com.bit.devops12.poro.service.PortfolioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class PortfolioServiceImpl implements PortfolioService {

    private PortfolioDao portfolioDao;
    private HtmlDao htmlDao;
    private CssDao cssDao;
    private JavascriptDao javascriptDao;

    private PortfolioMapper portfolioMapper;
    private SkillTagMapper skillTagMapper;

    @Autowired
    public PortfolioServiceImpl(PortfolioDao portfolioDao, HtmlDao htmldao, CssDao cssdao, JavascriptDao javascriptDao, PortfolioMapper portfolioMapper, SkillTagMapper skillTagMapper) {
        this.portfolioDao = portfolioDao;
        this.htmlDao = htmldao;
        this.cssDao = cssdao;
        this.javascriptDao = javascriptDao;
        this.portfolioMapper = portfolioMapper;
        this.skillTagMapper = skillTagMapper;
    }

    @Override
    public List<PortfolioDto> getPortfolioList(MainCriteria mainCri, UserDto loginUser) {
        mainCri.setStartNum((mainCri.getPageNum() - 1) * mainCri.getAmount());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("mainCri", mainCri);
        paramMap.put("loginUser", loginUser);

        System.out.println(paramMap);

        return portfolioDao.getPortfolioList(paramMap);
    }

    @Override
    public List<PortfolioDto> getPortfolioListMini(MiniProjectCriteria miniProjectCri, UserDto loginUser) {
        miniProjectCri.setStartNum((miniProjectCri.getPageNum() - 1) * miniProjectCri.getAmount());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("miniProjectCri", miniProjectCri);
        paramMap.put("loginUser", loginUser);

        System.out.println(paramMap);

        return portfolioDao.getPortfolioListMini(paramMap);
    }

    @Override
    public int getPortfolioTotalCnt() {
        return portfolioDao.getPortfolioTotalCnt();
    }

    @Override
    public PortfolioDto getPortfolioById(int portfolio_id, UserDto loginUser) {

        PortfolioDto portfolioDto = portfolioDao.getPortfolioById(portfolio_id, loginUser);

        if (!existFiles(portfolioDto.getThumbnail_url())){
            portfolioDto.setThumbnail_url("/static/img/default.png");
        }

        List<String> htmlUrls = portfolioDto.getHtmlurl() != null ? Arrays.stream(portfolioDto.getHtmlurl().split(",")).toList() : Collections.emptyList();
        List<String> cssUrls = portfolioDto.getCssurl() != null ? Arrays.stream(portfolioDto.getCssurl().split(",")).toList() : Collections.emptyList();
        List<String> jsUrls = portfolioDto.getJsurl() != null ? Arrays.stream(portfolioDto.getJsurl().split(",")).toList() : Collections.emptyList();

        portfolioDto.setHtmlCode(readFiles(htmlUrls));
        portfolioDto.setCssCode(readFiles(cssUrls));
        portfolioDto.setJsCode(readFiles(jsUrls));
        portfolioDto.setMergeCode(mergeFile(portfolioDto.getHtmlCode(),portfolioDto.getCssCode(),portfolioDto.getJsCode()));

        return portfolioDto;
    }

    @Override
    public void likePortfolio(int portfolio_id, UserDto loginUser) {
        portfolioDao.likePortfolio(portfolio_id, loginUser);
    }

    @Override
    public void unLikePortfolio(int portfolio_id, UserDto loginUser) {
        portfolioDao.unLikePortfolio(portfolio_id, loginUser);
    }

    @Override
    public void deletePortfolio(int portfolio_id) {
        portfolioDao.deletePortfolio(portfolio_id);
    }

    @Override
    public void savePortfolio(Portfolio portfolio) {
        portfolioMapper.insertPortfolio(portfolio);
    }

    @Override
    public void saveSkillTag(SkillTag skillTag) {
        skillTagMapper.insertSkillTag(skillTag);
    }
    private boolean existFiles(String filePaths) {
        String realPath = "C:/devops12/poro" + filePaths;
        if (Files.exists(Paths.get(realPath))) {
            return true;
        } else {
            return false;
        }
    }

    private List<String> readFiles(List<String> filePaths) {
        try {
            return filePaths.stream()
                    .map(path -> {
                        try {
                            String realPath = "C:/devops12/poro"+path;
                            return new String(Files.readAllBytes(Paths.get(realPath)));
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    })
                    .collect(Collectors.toList());
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return List.of();
        }
    }

    public String mergeFile(List<String> htmlContentList, List<String> cssContentList, List<String> jsContentList) {
        String merged_cssContent = cssContentList.stream()
                .collect(Collectors.joining("\n"));

        String merged_htmlContent = htmlContentList.stream()
                .collect(Collectors.joining("\n"));

        String merged_jsContent = jsContentList.stream()
                .collect(Collectors.joining("\n"));
        String htmlContent = merged_htmlContent;

        String cssContent = "<style>\n" + new String(merged_cssContent) + "\n</style>";
        String jsContent = "<script>\n" + new String(merged_jsContent) + "\n</script>";
        // CSS 삽입
        htmlContent = htmlContent.replace("</head>", cssContent + "\n</head>");

        // JS 삽입
        String merged_content = htmlContent.replace("</body>", jsContent + "\n</body>");

        return merged_content;
    }

//    public String escapeHtml(String input) {
//        if (input == null) {
//            return null;
//        }
//        return input.replaceAll("&", "&amp;")
//                .replaceAll("<", "&lt;")
//                .replaceAll(">", "&gt;")
//                .replaceAll("\"", "&quot;")
//                .replaceAll("'", "&#39;");
//    }

    @Override
    public void saveHtml(int portfolio_id, List<String> htmlPath) {
        for(String path : htmlPath){

            HtmlDto htmlDto = new HtmlDto();
            htmlDto.setPortfolio_id(portfolio_id);
            htmlDto.setHtml_url(path);

            htmlDao.insertHtml(htmlDto);
        }
    }

    @Override
    public void saveCss(int portfolio_id, List<String> cssPath) {
        for(String path : cssPath){
            CssDto cssDto = new CssDto();
            cssDto.setPortfolio_id(portfolio_id);
            cssDto.setCss_url(path);
            cssDao.insertCss(cssDto);
        }
    }

    @Override
    public void saveJs(int portfolio_id, List<String> jsPath) {
        for(String path : jsPath){
            JavascriptDto jsDto = new JavascriptDto();
            jsDto.setPortfolio_id(portfolio_id);
            jsDto.setJavascript_url(path);
            javascriptDao.insertJavascript(jsDto);
        }
    }

    @Override
    public PortfolioDto getCurrentPortfolioByUserId(int userId){
        return portfolioDao.getCurrentPortfolioByUserId(userId);
    }
}
