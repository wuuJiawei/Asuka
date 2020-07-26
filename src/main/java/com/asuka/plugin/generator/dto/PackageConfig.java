package com.asuka.plugin.generator.dto;

/**
 * @author wujiawei0926@yeah.net
 * @see
 * @since 2020/7/7
 */
public class PackageConfig {

    /**
     * 父包名。如果为空，将下面子包名必须写全部， 否则就只需写子包名
     */
    private String parent = "com.asuka";

    /**
     * Entity包名
     */
    private String entity = "entity";
    /**
     * Service包名
     */
    private String service = "service";
    /**
     * Mapper包名
     */
    private String dao = "dao";
    /**
     * sql md包名
     */
    private String daoMd = "sql";
    /**
     * Controller包名
     */
    private String controller = "controller";

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

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
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

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller;
    }
}
