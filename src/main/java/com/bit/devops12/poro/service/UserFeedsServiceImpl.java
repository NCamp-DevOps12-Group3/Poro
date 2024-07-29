package com.bit.devops12.poro.service;

import com.bit.devops12.poro.dao.UserFeedsDao;
import com.bit.devops12.poro.dto.Criteria;
import com.bit.devops12.poro.dto.PortfolioDto;
import com.bit.devops12.poro.dto.ProfileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
            portfolioDto.setMergeCode(mergeFile(portfolioDto.getHtmlList(),portfolioDto.getCssList(),portfolioDto.getJsList()));
        });
        return userFeedsDao.getUserPortfolio(map);
    }
    public String mergeFile(List<String> htmlContentList, List<String> cssContentList, List<String> jsContentList) {
        String merged_cssContent = cssContentList.stream()
                .collect(Collectors.joining("\n"));

        String merged_htmlContent = htmlContentList.stream()
                .collect(Collectors.joining("\n"));

        String merged_jsContent = jsContentList.stream()
                .collect(Collectors.joining("\n"));

        String merged_content = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Merged HTML</title>\n" +
                "    <style>\n" +
                merged_cssContent + "\n" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                merged_htmlContent + "\n" +
                "    <script>\n" +
                merged_jsContent + "\n" +
                "    </script>\n" +
                "</body>\n" +
                "</html>";

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
                            return new String(Files.readAllBytes(Paths.get(path)));
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

    public void deletePortfolio(List<String> deleteList) {
        userFeedsDao.deletePortfolio(deleteList);
    }
    public List<PortfolioDto> getUserPopularPortfolio(int id) {


        List<PortfolioDto> portfolioDtos = userFeedsDao.getUserPopularPortfolio(id);
        portfolioDtos.forEach(portfolioDto -> {
            portfolioDto.setHtmlCode(readFiles(Arrays.stream(portfolioDto.getHtmlurl().split(",")).toList()));
            portfolioDto.setCssCode(readFiles(Arrays.stream(portfolioDto.getCssurl().split(",")).toList()));
            portfolioDto.setJsCode(readFiles(Arrays.stream(portfolioDto.getJsurl().split(",")).toList()));
            portfolioDto.setMergeCode(mergeFile(portfolioDto.getHtmlList(),portfolioDto.getCssList(),portfolioDto.getJsList()));
        });
        return portfolioDtos;
    }

}
