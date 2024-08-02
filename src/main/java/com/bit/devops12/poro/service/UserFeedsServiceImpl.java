package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dao.UserFeedsDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
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
            portfolioDto.setHtmlCode(readFiles(Arrays.stream(portfolioDto.getHtmlurl().split(",")).toList()));
            portfolioDto.setCssCode(readFiles(Arrays.stream(portfolioDto.getCssurl().split(",")).toList()));
            portfolioDto.setJsCode(readFiles(Arrays.stream(portfolioDto.getJsurl().split(",")).toList()));
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

        String merged_content = "&lt!DOCTYPE html&gt\n" +
                "&lt;html lang=\"en\"&gt;\n" +
                "&lt;head&gt;\n" +
                "    &lt;meta charset=\"UTF-8\"&gt;\n" +
                "    &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"&gt;\n" +
                "    &lt;title&gtMerged HTML&lt;/title&gt;\n" +
                "    &lt;style&gt;\n" +
                merged_cssContent + "\n" +
                "    &lt;/style&gt;\n" +
                "&lt;/head&gt;\n" +
                "&lt;body&gt;\n" +
                merged_htmlContent + "\n" +
                "    &lt;script&gt;\n" +
                merged_jsContent + "\n" +
                "    &lt;/script&gt;\n" +
                "&lt;/body&gt;\n" +
                "&lt;/html&gt;";
        return merged_content;
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
        System.out.println(deleteList);
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

}
