package com.cmdi.dims.jdbctemple.entity;

import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Data
public class ChkresultProvince {


    @Column(name = "province_name")
    private String provinceName;
    @Column(name = "public_total_rate")
    private String publicTotalRate;
    @Column(name = "public_wanzheng_rate")
    private String publicWanzhengRate;
    @Column(name = "public_guifan_rate")
    private String publicGuifanRate;
    @Column(name = "public_guanlian_rate")
    private String publicGuanlianRate;
    @Column(name = "public_hegui_rate")
    private String publicHeguiRate;
    @Column(name = "space_total_rate")
    private String spaceTotalRate;
    @Column(name = "space_wanzheng_rate")
    private String spaceWanzhengRate;
    @Column(name = "space_guifan_rate")
    private String spaceGuifanRate;
    @Column(name = "space_guanlian_rate")
    private String spaceGuanlianRate;
    @Column(name = "space_hegui_rate")
    private String spaceHeguiRate;
    @Column(name = "bear_total_rate")
    private String bearTotalRate;
    @Column(name = "bear_wanzheng_rate")
    private String bearWanzhengRate;
    @Column(name = "bear_guifan_rate")
    private String bearGuifanRate;
    @Column(name = "bear_guanlian_rate")
    private String bearGuanlianRate;
    @Column(name = "bear_hegui_rate")
    private String bearHeguiRate;
    @Column(name = "wireless_total_rate")
    private String wirelessTotalRate;
    @Column(name = "wireless_wanzheng_rate")
    private String wirelessWanzhengRate;
    @Column(name = "wireless_guifan_rate")
    private String wirelessGuifanRate;
    @Column(name = "wireless_guanlian_rate")
    private String wirelessGuanlianRate;
    @Column(name = "wireless_hegui_rate")
    private String wirelessHeguiRate;
    @Column(name = "guanxian_total_rate")
    private String guanxianTotalRate;
    @Column(name = "guanxian_wanzheng_rate")
    private String guanxianWanzhengRate;
    @Column(name = "guanxian_guifan_rate")
    private String guanxianGuifanRate;
    @Column(name = "guanxian_guanlian_rate")
    private String guanxianGuanlianRate;
    @Column(name = "guanxian_hegui_rate")
    private String guanxianHeguiRate;
    @Column(name = "yigan_total_rate")
    private String yiganTotalRate;
    @Column(name = "yigan_wanzheng_rate")
    private String yiganWanzhengRate;
    @Column(name = "yigan_guifan_rate")
    private String yiganGuifanRate;
    @Column(name = "yigan_guanlian_rate")
    private String yiganGuanlianRate;
    @Column(name = "yigan_hegui_rate")
    private String yiganHeguiRate;
    @Column(name = "version")
    private String version;
}
