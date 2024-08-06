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
    
    public void setId(int id) {
        this.id = id;
    }
    
    public int getBoard_id() {
        return board_id;
    }
    
    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }
    
    public String getFilename() {
        return filename;
    }
    
    public void setFilename(String filename) {
        this.filename = filename;
    }
    
    public String getFileoriginname() {
        return fileoriginname;
    }
    
    public void setFileoriginname(String fileoriginname) {
        this.fileoriginname = fileoriginname;
    }
    
    public String getFilepath() {
        return filepath;
    }
    
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
    
    public String getFiletype() {
        return filetype;
    }
    
    public void setFiletype(String filetype) {
        this.filetype = filetype;
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
                       ", board_id=" + board_id +
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
