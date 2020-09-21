package com.cmdi.dims.task.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "dims_tm_res_statistics")
@EntityListeners(AuditingEntityListener.class)
public class ResStatistics {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "resindex")
    private Long resIndex;

    @Column(name = "taskcode")
    private String taskCode;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @Column(name = "collectiondate")
    private Date collectionDate;

    @Column(name = "province")
    private String province;

    @Column(name = "prefecture")
    private String prefecture;

    @Column(name = "county")
    private String county;

    @Column(name = "provincecode")
    private String provinceCode;

    @Column(name = "prefecturecode")
    private String prefectureCode;

    @Column(name = "countycode")
    private String countyCode;

    @Column(name = "regiontype")
    private Integer regionType;

    @Column(name = "specialityname")
    private String specialityName;

    @Column(name = "amount")
    private Integer amount;

    @Column(name = "unit")
    private String unit;

    @Column(name = "resname")
    private String resName;

    @Column(name = "restype")
    private String resType;

    @Column(name = "memo")
    private String memo;
}
