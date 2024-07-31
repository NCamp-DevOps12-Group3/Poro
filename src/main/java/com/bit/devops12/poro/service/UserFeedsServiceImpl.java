package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dao.UserFeedsDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import com.bit.devops12.poro.dto.RecruitmentDto;
import com.fasterxml.jackson.databind.ObjectMapper;
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
        return userFeedsDao.getUserInfo(id);
    }

    public List<PortfolioDto> getUserPortfolio(int id,Criteria criteria) {
        criteria.setStartNum((criteria.getPageNum()-1)*criteria.getAmount());
        Map<String,Object> map=new HashMap<>();
        map.put("userid",id);
        map.put("criteria",criteria);
        List<PortfolioDto> portfolioDtos = userFeedsDao.getUserPortfolio(map);
        portfolioDtos.forEach(portfolioDto -> {
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
//        String merged_content = "&lt!DOCTYPE html&gt\n" +
//                "&lt;html lang=\"en\"&gt;\n" +
//                "&lt;head&gt;\n" +
//                "    &lt;meta charset=\"UTF-8\"&gt;\n" +
//                "    &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"&gt;\n" +
//                "    &lt;title&gtMerged HTML&lt;/title&gt;\n" +
//                "&lt;style&gt;\n" +
//                merged_cssContent + "\n" +
//                "&lt;/style&gt;\n" +
//                "&lt;/head&gt;\n" +
//                "&lt;body&gt;\n" +
//                merged_htmlContent + "\n" +
//                "&lt;script&gt;\n" +
//                merged_jsContent + "\n" +
//                "&lt;/script&gt;\n" +
//                "&lt;/body&gt;\n" +
//                "&lt;/html&gt;";

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

    public void deletePortfolio(String deleteList) {
        if (!deleteList.equals("")&&!(deleteList == null)){
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
        return userFeedsDao.getUserBookmarkCoperation(map);
    }

    public List<PortfolioDto> getUserBookmarkPortfolio(int id, Criteria criteria) {
        criteria.setStartNum((criteria.getPageNum()-1)*criteria.getAmount());
        Map<String,Object> map=new HashMap<>();
        map.put("userid",id);
        map.put("criteria",criteria);
        return userFeedsDao.getUserBookmarkPortfolio(map);
    }

    public void deleteCoperationBookmark(String deleteList) {
        if (!deleteList.equals("")&&!(deleteList == null)){
            return;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
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
        if (!deleteList.equals("")&&!(deleteList == null)){
            return;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
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
