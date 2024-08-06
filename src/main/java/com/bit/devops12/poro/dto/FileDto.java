package com.bit.devops12.poro.dto;

public class FileDto {
    private int id;
    private int board_id;
    private String filename;
    private String fileoriginname;
    private String filepath;
    private String filetype;
    private String filestatus;
    private String newfilename;
    private String user_email;
    
    public int getId() {
        return id;
    }

    public String getFilestatus() {
        return filestatus;
    }

    public void setFilestatus(String filestatus) {
        this.filestatus = filestatus;
    }

    public String getNewfilename() {
        return newfilename;
    }

    public void setNewfilename(String newfilename) {
        this.newfilename = newfilename;
    }
    
    public String getUser_email() {
        return user_email;
    }
    
    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
    
    @Override
    public String toString() {
        return "FileDto{" +
                       "id=" + id +
                       ", user_id=" + user_id +
                       ", filename='" + filename + '\'' +
                       ", fileoriginname='" + fileoriginname + '\'' +
                       ", filepath='" + filepath + '\'' +
                       ", filetype='" + filetype + '\'' +
                       ", filestatus='" + filestatus + '\'' +
                       ", newfilename='" + newfilename + '\'' +
                       ", user_email='" + user_email + '\'' +
                       '}';
    }
}
