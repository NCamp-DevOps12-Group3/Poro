package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dao.UserFeedsDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import com.bit.devops12.poro.dto.RecruitmentDto;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserFeedsServiceImpl {

    private UserFeedsDao userFeedsDao;
    @Autowired
    public UserFeedsServiceImpl(UserFeedsDao userFeedsDao) {
        this.userFeedsDao = userFeedsDao;
    }

    public ProfileDto getUserInfo(int id) {
        ProfileDto profileDto = userFeedsDao.getUserInfo(id);
        if (!existFiles(profileDto.getProfile_image())){
            profileDto.setProfile_image("/static/img/default.png");
        }
        return userFeedsDao.getUserInfo(id);
    }

    public List<PortfolioDto> getUserPortfolio(int id,Criteria criteria) {
        criteria.setStartNum((criteria.getPageNum()-1)*criteria.getAmount());
        Map<String,Object> map=new HashMap<>();
        map.put("userid",id);
        map.put("criteria",criteria);
        List<PortfolioDto> portfolioDtos = userFeedsDao.getUserPortfolio(map);
        portfolioDtos.forEach(portfolioDto -> {
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
        });
        return portfolioDtos;
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

        return escapeHtml(merged_content);
    }
    public String escapeHtml(String input) {
        if (input == null) {
            return null;
        }
        return input.replaceAll("&", "&amp;")
                .replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;")
                .replaceAll("\"", "&quot;")
                .replaceAll("'", "&#39;");
    }
    public int getUserPortfolioTotalCnt(int id) {
        return userFeedsDao.getUserPortfolioTotalCnt(id);
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
    private boolean existFiles(String filePaths) {
        String realPath = "C:/devops12/poro" + filePaths;
        if (Files.exists(Paths.get(realPath))) {
            return true;
        } else {
            return false;
        }
    }


    public void deletePortfolio(String deleteList) {
        if (deleteList.equals("")||(deleteList == null)){
            return;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String[] portfolioIdStrings = objectMapper.readValue(deleteList, String[].class);

            List<Integer> portfolioIds = Arrays.stream(portfolioIdStrings)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            userFeedsDao.deletePortfolio(portfolioIds);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }
    public List<PortfolioDto> getUserPopularPortfolio(int id) {
        List<PortfolioDto> portfolioDtos = userFeedsDao.getUserPopularPortfolio(id);
        portfolioDtos.forEach(portfolioDto -> {
            if (!existFiles(portfolioDto.getThumbnail_url())){
                portfolioDto.setThumbnail_url("/static/img/default.png");
            }

            portfolioDto.setHtmlCode(readFiles(Arrays.stream(portfolioDto.getHtmlurl().split(",")).toList()));
            portfolioDto.setCssCode(readFiles(Arrays.stream(portfolioDto.getCssurl().split(",")).toList()));
            portfolioDto.setJsCode(readFiles(Arrays.stream(portfolioDto.getJsurl().split(",")).toList()));
            portfolioDto.setMergeCode(mergeFile(portfolioDto.getHtmlCode(),portfolioDto.getCssCode(),portfolioDto.getJsCode()));
        });
        return portfolioDtos;
    }

    public List<RecruitmentDto> getUserBookmarkCoperation(int id, Criteria criteria) {
        criteria.setStartNum((criteria.getPageNum()-1)*criteria.getAmount());
        Map<String,Object> map=new HashMap<>();
        map.put("userid",id);
        map.put("criteria",criteria);
        List<RecruitmentDto> recruitmentDtos = userFeedsDao.getUserBookmarkCoperation(map);
        recruitmentDtos.forEach(recruitmentDto -> {
            if (!existFiles(recruitmentDto.getCompany_icon_url())){
                recruitmentDto.setCompany_icon_url("/static/img/default.png");
            }
        });
        return recruitmentDtos;
    }

    public List<PortfolioDto> getUserBookmarkPortfolio(int id, Criteria criteria) {
        criteria.setStartNum((criteria.getPageNum()-1)*criteria.getAmount());
        Map<String,Object> map=new HashMap<>();
        map.put("userid",id);
        map.put("criteria",criteria);
        List<PortfolioDto> PortfolioDtos = userFeedsDao.getUserBookmarkPortfolio(map);
        PortfolioDtos.forEach(PortfolioDto -> {
            if (!existFiles(PortfolioDto.getThumbnail_url())){
                PortfolioDto.setThumbnail_url("/static/img/default.png");
            }
        });
        return PortfolioDtos;
    }

    public void deleteCoperationBookmark(String deleteList) {
        if (deleteList.equals("")||(deleteList == null)){
            return;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
            String[] portfolioIdStrings = objectMapper.readValue(deleteList, String[].class);

            List<Integer> portfolioIds = Arrays.stream(portfolioIdStrings)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            userFeedsDao.deleteCoperationBookmark(portfolioIds);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }

    public void deleteOtherPortfolioBookmark(String deleteList) {
        if (deleteList.equals("")||(deleteList == null)){
            return;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
            String[] portfolioIdStrings = objectMapper.readValue(deleteList, String[].class);

            List<Integer> portfolioIds = Arrays.stream(portfolioIdStrings)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            userFeedsDao.deleteOtherPortfolioBookmark(portfolioIds);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
    }

    public int getUserBookmarkCoperationToltalCnt(int id) {
        return userFeedsDao.getUserBookmarkCoperationToltalCnt(id);
    }

    public int getUserBookmarkPortfolioCnt(int id) {
        return userFeedsDao.getUserBookmarkPortfolioCnt(id);
    }
}
