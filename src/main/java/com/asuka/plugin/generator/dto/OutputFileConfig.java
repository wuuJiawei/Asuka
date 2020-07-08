package com.asuka.plugin.generator.dto;

/**
 * 输出文件配置
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/8
 */
public class OutputFileConfig {

    public OutputFileConfig(){}

    private FileType name;

    private FileType path;

    private FileType packages;

    public FileType getName() {
        return name;
    }

    public void setName(FileType name) {
        this.name = name;
    }

    public FileType getPath() {
        return path;
    }

    public void setPath(FileType path) {
        this.path = path;
    }

    public FileType getPackages() {
        return packages;
    }

    public void setPackages(FileType packages) {
        this.packages = packages;
    }

    public static class FileType {
        private String parent;
        private String entity = "entity";
        private String dao = "dao";
        private String daoMd = "daoMd";
        private String service = "service";
        private String controller = "controller";
        private String html = "html";
        private String sql = "sql";

        public String getParent() {
            return parent;
        }

        public void setParent(String parent) {
            this.parent = parent;
        }

        public String getEntity() {
            return entity;
        }

        public void setEntity(String entity) {
            this.entity = entity;
        }

        public String getDao() {
            return dao;
        }

        public void setDao(String dao) {
            this.dao = dao;
        }

        public String getDaoMd() {
            return daoMd;
        }

        public void setDaoMd(String daoMd) {
            this.daoMd = daoMd;
        }

        public String getService() {
            return service;
        }

        public void setService(String service) {
            this.service = service;
        }

        public String getController() {
            return controller;
        }

        public void setController(String controller) {
            this.controller = controller;
        }

        public String getHtml() {
            return html;
        }

        public void setHtml(String html) {
            this.html = html;
        }

        public String getSql() {
            return sql;
        }

        public void setSql(String sql) {
            this.sql = sql;
        }
    }

}
