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
<<<<<<< HEAD
    private boolean existFiles(String filePaths) {
        String realPath = "C:/devops12/poro" + filePaths;
        if (Files.exists(Paths.get(realPath))) {
            return true;
        } else {
            return false;
        }
    }

    public void deletePortfolio(String deleteList) {

=======

    public void deletePortfolio(String deleteList) {
        System.out.println(deleteList);
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String[] portfolioIdStrings = objectMapper.readValue(deleteList, String[].class);

            List<Integer> portfolioIds = Arrays.stream(portfolioIdStrings)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());
            if (portfolioIds.size() ==0 ){
                return;
            }
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

<<<<<<< HEAD
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
            if (portfolioIds.size() ==0 ){
                return;
            }
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
            if (portfolioIds.size() ==0 ){
                return;
            }
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

    public boolean deleteListIsOwner(int id, String deleteList) {
        if (deleteList.equals("")||(deleteList == null)){
            return false;
        }
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
            String[] portfolioIdStrings = objectMapper.readValue(deleteList, String[].class);

            List<Integer> portfolioIds = Arrays.stream(portfolioIdStrings)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            return userFeedsDao.deleteListIsOwner(id,portfolioIds);
        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리 로직 추가
        }
        return false;
    }

    public boolean getFollowInfo(int userid, int id) {
        return userFeedsDao.getFollowInfo(userid,id);
    }

    public boolean unfollow(Integer userId, int id) {
        Map<String,Object> map=new HashMap<>();
        map.put("userid",userId);
        map.put("id",id);
        return userFeedsDao.unfollow(map);
    }

    public boolean follow(Integer userId, int id) {
        Map<String,Object> map=new HashMap<>();
        map.put("userid",userId);
        map.put("id",id);
        return  userFeedsDao.follow(map);
    }

    public List<Object> getbookmarkInfo(Integer userid, int id) {
        Map<String,Object> map=new HashMap<>();
        map.put("userid",userid);
        map.put("id",id);
        return userFeedsDao.getbookmarkInfo(map);

    }
=======
>>>>>>> e304a2ca27dc06f585b5e38a77df7d643b927e20
}
