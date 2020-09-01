var collectorView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  tabs.setActiveTab(0);
});

var taskItemFileListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-file-zip-o" aria-hidden="true"></i> 文件数据报告', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/taskitemfile',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '采集日期',
          fieldName: 'field_collectionDate'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'taskItemFileId', fieldName: 'field_taskItemFileId', primaryKey: true},
          {dataName: 'collectionDate', fieldTitle: '采集日期', fieldName: 'field_collectionDate', fieldWidth: 80},
          {dataName: 'province', fieldTitle: '省份', fieldName: 'field_province', fieldWidth: 60},
          {dataName: 'name', fieldTitle: '文件名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'destTable', fieldTitle: '目标表', fieldName: 'field_destTable', fieldWidth: 160},
          {dataName: 'fileSize', fieldTitle: '文件大小', fieldName: 'field_remark', fieldWidth: 80, align: 'right'},
          {
            dataName: 'fileGettingCosts',
            fieldTitle: '获取文件时间',
            fieldName: 'field_fileGettingCosts',
            fieldWidth: 100,
            align: 'right'
          },
          {dataName: 'finishTime', fieldTitle: '入库时间', fieldName: 'field_finishTime', fieldWidth: 140},
          {
            dataName: 'success',
            fieldTitle: '是否成功',
            fieldName: 'field_success',
            fieldWidth: 60,
            renderer: function (value) {
              if (value) {
                return '<span style="color: #0F0;">是</span>';
              } else {
                return '<span style="color: #F00;">否</span>';
              }
            }
          }
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      pageSize: 50,
      toolbarHandler: function (grid, criteria) {
        return new TaskItemFileToolbarHandler(grid, criteria);
      }
    });
  }, true);
});

var taskItemBusinessListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-file-text-o" aria-hidden="true"></i> 业务数据报告', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/taskitembusiness',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '采集日期',
          fieldName: 'field_collectionDate'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'taskItemBusinessId', fieldName: 'field_taskItemBusinessId', primaryKey: true},
          {dataName: 'collectionDate', fieldTitle: '采集日期', fieldName: 'field_collectionDate', fieldWidth: 120},
          {dataName: 'province', fieldTitle: '省份', fieldName: 'field_province', fieldWidth: 120},
          {dataName: 'name', fieldTitle: '资源对象名称', fieldName: 'field_name', fieldWidth: 300},
          {dataName: 'amount', fieldTitle: '成功数量', fieldName: 'field_amount', fieldWidth: 160, align: 'right'},
          {
            dataName: 'analysisCosts',
            fieldTitle: '解析时间',
            fieldName: 'field_analysisCosts',
            fieldWidth: 100,
            align: 'right'
          },
          {
            dataName: 'originAmount',
            fieldTitle: '原始数量',
            fieldName: 'field_originAmount',
            fieldWidth: 100,
            align: 'right'
          },
          {
            dataName: 'success',
            fieldTitle: '是否成功',
            fieldName: 'field_success',
            fieldWidth: 60,
            renderer: function (value) {
              if (value) {
                return '<span style="color: #0F0;">是</span>';
              } else {
                return '<span style="color: #F00;">否</span>';
              }
            }
          }
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      pageSize: 50,
      toolbarHandler: function (grid, criteria) {
        return new TaskItemBusinessToolbarHandler(grid, criteria);
      }
    });
  }, true);
});

var taskConfigListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> 任务配置管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/taskconfig',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '配置名称',
          fieldName: 'field_name'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'taskConfigId', fieldName: 'field_taskConfigId', primaryKey: true},
          {dataName: 'name', fieldTitle: '配置名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'code', fieldTitle: '编码', fieldName: 'field_code', fieldWidth: 200},
          {dataName: 'province', fieldTitle: '省份', fieldName: 'field_province', fieldWidth: 200},
          {dataName: 'specialityName', fieldTitle: '专业', fieldName: 'field_specialityName', fieldWidth: 200},
          {dataName: 'includeSpecialities', fieldTitle: '包含专业', fieldName: 'field_includeSpecialities', fieldWidth: 300}
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      pageSize: 100,
      toolbarHandler: function (grid, criteria) {
        return new TaskConfigToolbarHandler(grid, criteria);
      }
    });
  }, true);
});
var taskConfigCreateView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> 创建任务配置', function (tabId) {
    return new DefaultEditPanel({
      datasource: {
        url: WEB_ROOT + '/app/v1/taskconfig',
        saveUrl: WEB_ROOT + '/app/v1/taskconfig',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'string', fieldTitle: '配置名称', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '编码', fieldName: 'field_code', dataName: 'code'},
            {
              fieldType: 'string',
              fieldTitle: '省份',
              fieldName: 'field_province',
              dataName: 'province',
              renderer: function (v) {
                var _dictStore = new Ext.data.Store({
                  proxy: new Ext.data.HttpProxy({
                    headers: {
                      'Authorization': 'Bearer ' + getToken()
                    },
                    url: WEB_ROOT + '/app/v1/taskconfig/province',
                    method: 'GET'
                  }),
                  reader: new Ext.data.JsonReader({
                    root: 'data',
                    fields: [
                      {name: 'value', type: 'string'},
                      {name: 'name', type: 'string'}
                    ]
                  })
                });
                return new Ext.form.ComboBox({
                  name: 'field_province',
                  fieldLabel: '省份',
                  store: _dictStore,
                  valueField: 'value',
                  displayField: 'name',
                  width: 300,
                  triggerAction: 'all',
                  listeners: {
                    'change': function () {
                      v.change();
                      var fp = v.getForm().findField('field_province');
                      var fs = v.getForm().findField('field_specialityName');
                      var fc = v.getForm().findField('field_code');
                      if (fp && fs && fc) {
                        fc.setValue(fp.getValue() + '-' + fs.getValue());
                      }
                    }
                  }
                });
              }
            },
            {
              fieldType: 'string',
              fieldTitle: '专业',
              fieldName: 'field_specialityName',
              dataName: 'specialityName',
              renderer: function (v) {
                var _dictStore = new Ext.data.Store({
                  proxy: new Ext.data.HttpProxy({
                    headers: {
                      'Authorization': 'Bearer ' + getToken()
                    },
                    url: WEB_ROOT + '/app/v1/taskconfig/speciality',
                    method: 'GET'
                  }),
                  reader: new Ext.data.JsonReader({
                    root: 'data',
                    fields: [
                      {name: 'value', type: 'string'},
                      {name: 'name', type: 'string'}
                    ]
                  })
                });
                return new Ext.form.ComboBox({
                  name: 'field_specialityName',
                  fieldLabel: '专业',
                  store: _dictStore,
                  valueField: 'value',
                  displayField: 'name',
                  width: 300,
                  triggerAction: 'all',
                  listeners: {
                    'change': function () {
                      v.change();
                      var fp = v.getForm().findField('field_province');
                      var fs = v.getForm().findField('field_specialityName');
                      var fc = v.getForm().findField('field_code');
                      if (fp && fs && fc) {
                        fc.setValue(fp.getValue() + '-' + fs.getValue());
                      }
                    }
                  }
                });
              }
            },
            {
              fieldType: 'string',
              fieldTitle: '包含专业',
              fieldName: 'field_includeSpecialities',
              dataName: 'includeSpecialities',
              renderer: function (v) {
                var _dictStore = new Ext.data.Store({
                  proxy: new Ext.data.HttpProxy({
                    headers: {
                      'Authorization': 'Bearer ' + getToken()
                    },
                    url: WEB_ROOT + '/app/v1/taskconfig/speciality',
                    method: 'GET'
                  }),
                  reader: new Ext.data.JsonReader({
                    root: 'data',
                    fields: [
                      {name: 'value', type: 'string'},
                      {name: 'name', type: 'string'}
                    ]
                  })
                });
                return new Ext.ux.form.LovCombo({
                  name: 'field_includeSpecialities',
                  fieldLabel: '包含专业',
                  store: _dictStore,
                  valueField: 'value',
                  displayField: 'name',
                  width: 300,
                  triggerAction: 'all',
                  listeners: {
                    'change': function () {
                      v.change();
                    }
                  }
                });
              }
            },
            {fieldType: 'number', fieldName: 'field_taskConfigId', dataName: 'taskConfigId', primaryKey: true}
          ]
        }
      }
    });
  }, true);
});

var taskConfigEditView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> 编辑任务配置', function (tabId) {
    return new DefaultEditPanel({
      entityId: ctx.params.taskConfigId,
      datasource: {
        url: WEB_ROOT + '/app/v1/taskconfig',
        saveUrl: WEB_ROOT + '/app/v1/taskconfig',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'string', fieldTitle: '配置名称', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '编码', fieldName: 'field_code', dataName: 'code'},
            {fieldType: 'hidden', fieldTitle: '省份', fieldName: 'field_province', dataName: 'province'},
            {fieldType: 'hidden', fieldTitle: '专业', fieldName: 'field_specialityName', dataName: 'specialityName'},
            {fieldType: 'number', fieldName: 'field_taskConfigId', dataName: 'taskConfigId', primaryKey: true}
          ]
        }
      },
      listeners: {
        'render': function (c) {
          c.load(function (f, a) {
            if (a.result && a.result.data && a.result.data.field_name) {
              Ext.getCmp(tabId).setTitle('<i class="fa fa-server" aria-hidden="true"></i> 编辑' + a.result.data.field_name);
            }
          });
        }
      }
    });
  }, true);
});


var fileLocationListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> FTP 配置管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/filelocation',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '配置名称',
          fieldName: 'field_name'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'fileLocationId', fieldName: 'field_fileLocationId', primaryKey: true},
          {dataName: 'name', fieldTitle: '配置名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'province', fieldTitle: '省份', fieldName: 'field_province', fieldWidth: 200},
          {dataName: 'specialityName', fieldTitle: '专业', fieldName: 'field_specialityName', fieldWidth: 200},
          {dataName: 'schema', fieldTitle: '协议', fieldName: 'field_schema', fieldWidth: 80},
          {dataName: 'host', fieldTitle: '主机', fieldName: 'field_host', fieldWidth: 160},
          {dataName: 'port', fieldTitle: '端口', fieldName: 'field_port', fieldWidth: 80},
          {dataName: 'path', fieldTitle: '路径', fieldName: 'field_path', fieldWidth: 200},
          {dataName: 'encoding', fieldTitle: '系统编码', fieldName: 'field_encoding', fieldWidth: 80},
          {dataName: 'fileEncoding', fieldTitle: '文件编码', fieldName: 'field_fileEncoding', fieldWidth: 80},
          {dataName: 'fileDelimiter', fieldTitle: '文件分割符', fieldName: 'field_fileDelimiter', fieldWidth: 80}
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      pageSize: 100,
      toolbarHandler: function (grid, criteria) {
        return new FileLocationToolbarHandler(grid, criteria);
      }
    });
  }, true);
});
var fileLocationCreateView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> 创建FTP 配置', function (tabId) {
    return new DefaultEditPanel({
      datasource: {
        url: WEB_ROOT + '/app/v1/filelocation',
        saveUrl: WEB_ROOT + '/app/v1/filelocation',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {
              fieldType: 'string',
              fieldTitle: '省份',
              fieldName: 'field_province',
              dataName: 'province',
              renderer: function (v) {
                var _dictStore = new Ext.data.Store({
                  proxy: new Ext.data.HttpProxy({
                    headers: {
                      'Authorization': 'Bearer ' + getToken()
                    },
                    url: WEB_ROOT + '/app/v1/taskconfig/province',
                    method: 'GET'
                  }),
                  reader: new Ext.data.JsonReader({
                    root: 'data',
                    fields: [
                      {name: 'value', type: 'string'},
                      {name: 'name', type: 'string'}
                    ]
                  })
                });
                return new Ext.form.ComboBox({
                  name: 'field_province',
                  fieldLabel: '省份',
                  store: _dictStore,
                  valueField: 'value',
                  displayField: 'name',
                  width: 300,
                  triggerAction: 'all',
                  listeners: {
                    'change': function () {
                      v.change();
                    }
                  }
                });
              }
            },
            {
              fieldType: 'string',
              fieldTitle: '专业',
              fieldName: 'field_specialityName',
              dataName: 'specialityName',
              renderer: function (v) {
                var _dictStore = new Ext.data.Store({
                  proxy: new Ext.data.HttpProxy({
                    headers: {
                      'Authorization': 'Bearer ' + getToken()
                    },
                    url: WEB_ROOT + '/app/v1/taskconfig/speciality',
                    method: 'GET'
                  }),
                  reader: new Ext.data.JsonReader({
                    root: 'data',
                    fields: [
                      {name: 'value', type: 'string'},
                      {name: 'name', type: 'string'}
                    ]
                  })
                });
                return new Ext.form.ComboBox({
                  name: 'field_specialityName',
                  fieldLabel: '专业',
                  store: _dictStore,
                  valueField: 'value',
                  displayField: 'name',
                  width: 300,
                  triggerAction: 'all',
                  listeners: {
                    'change': function () {
                      v.change();
                    }
                  }
                });
              }
            },
            {fieldType: 'string', fieldTitle: '配置名称', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '协议', fieldName: 'field_schema', dataName: 'schema'},
            {fieldType: 'string', fieldTitle: '主机', fieldName: 'field_host', dataName: 'host'},
            {fieldType: 'string', fieldTitle: '端口', fieldName: 'field_port', dataName: 'port'},
            {fieldType: 'string', fieldTitle: '路径', fieldName: 'field_path', dataName: 'path'},
            {fieldType: 'string', fieldTitle: '用户', fieldName: 'field_username', dataName: 'username'},
            {fieldType: 'string', fieldTitle: '密码', fieldName: 'field_password', dataName: 'password'},
            {fieldType: 'string', fieldTitle: '系统编码', fieldName: 'field_encoding', dataName: 'encoding'},
            {fieldType: 'string', fieldTitle: '文件编码', fieldName: 'field_fileEncoding', dataName: 'fileEncoding'},
            {fieldType: 'string', fieldTitle: '文件分割符', fieldName: 'field_fileDelimiter', dataName: 'fileDelimiter'},
            {fieldType: 'number', fieldName: 'field_fileLocationId', dataName: 'fileLocationId', primaryKey: true}
          ]
        }
      }
    });
  }, true);
});

var fileLocationEditView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-server" aria-hidden="true"></i> 编辑FTP 配置', function (tabId) {
    return new DefaultEditPanel({
      entityId: ctx.params.fileLocationId,
      datasource: {
        url: WEB_ROOT + '/app/v1/filelocation',
        saveUrl: WEB_ROOT + '/app/v1/filelocation',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'hidden', fieldTitle: '所属配置', fieldName: 'field_taskConfigId', dataName: 'taskConfigId'},
            {fieldType: 'hidden', fieldTitle: '专业', fieldName: 'field_specialityName', dataName: 'specialityName'},
            {fieldType: 'hidden', fieldTitle: '省份', fieldName: 'field_province', dataName: 'province'},
            {fieldType: 'string', fieldTitle: '配置名称', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '协议', fieldName: 'field_schema', dataName: 'schema'},
            {fieldType: 'string', fieldTitle: '主机', fieldName: 'field_host', dataName: 'host'},
            {fieldType: 'string', fieldTitle: '端口', fieldName: 'field_port', dataName: 'port'},
            {fieldType: 'string', fieldTitle: '用户', fieldName: 'field_username', dataName: 'username'},
            {fieldType: 'string', fieldTitle: '密码', fieldName: 'field_password', dataName: 'password'},
            {fieldType: 'string', fieldTitle: '路径', fieldName: 'field_path', dataName: 'path'},
            {fieldType: 'string', fieldTitle: '系统编码', fieldName: 'field_encoding', dataName: 'encoding'},
            {fieldType: 'string', fieldTitle: '文件编码', fieldName: 'field_fileEncoding', dataName: 'fileEncoding'},
            {fieldType: 'string', fieldTitle: '文件分割符', fieldName: 'field_fileDelimiter', dataName: 'fileDelimiter'},
            {fieldType: 'number', fieldName: 'field_fileLocationId', dataName: 'fileLocationId', primaryKey: true}
          ]
        }
      },
      listeners: {
        'render': function (c) {
          c.load(function (f, a) {
            if (a.result && a.result.data && a.result.data.field_name) {
              Ext.getCmp(tabId).setTitle('<i class="fa fa-server" aria-hidden="true"></i> 编辑' + a.result.data.field_name);
            }
          });
        }
      }
    });
  }, true);
});


var taskListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-tasks" aria-hidden="true"></i> 采集任务', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/task',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '任务名称',
          fieldName: 'field_name'
        }, {
          fieldType: 'string',
          fieldTitle: '状态',
          fieldName: 'field_status',
          renderer: function (form) {
            var stStore = new Ext.data.ArrayStore({
              fields: ['name', 'value'],
              data: [
                ['任务初始化', '0'],
                ['文件传输成功', '1'],
                ['文件传输失败', '2'],
                ['数据入库成功', '3'],
                ['数据入库失败', '4'],
                ['数据核查成功', '5'],
                ['数据核查失败', '6'],
                ['文件比对成功', '7'],
                ['文件比对失败', '8'],
                ['核查结果上传成功', '9'],
                ['核查结果上传失败', '10']
              ]
            });
            return new Ext.form.ComboBox({
              name: 'field_status',
              fieldLabel: '状态',
              store: stStore,
              valueField: 'value',
              displayField: 'name',
              typeAhead: true,
              mode: 'local',
              forceSelection: true,
              triggerAction: 'all',
              selectOnFocus: true
            });
          }
        }, {
          fieldType: 'string',
          fieldTitle: '最新成功任务',
          fieldName: 'field_latest',
          renderer: function (form) {
            var ynStore = new Ext.data.ArrayStore({
              fields: ['name', 'value'],
              data: [
                ['是', 'true'],
                ['否', 'false']
              ]
            });
            return new Ext.form.ComboBox({
              name: 'field_latest',
              fieldLabel: '最新成功任务',
              store: ynStore,
              valueField: 'value',
              displayField: 'name',
              typeAhead: true,
              mode: 'local',
              forceSelection: true,
              triggerAction: 'all',
              selectOnFocus: true
            });
          }
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'taskId', fieldName: 'field_taskId', primaryKey: true},
          {dataName: 'name', fieldTitle: '任务名称', fieldName: 'field_name', fieldWidth: 300},
          {dataName: 'startTime', fieldTitle: '开始时间', fieldName: 'field_startTime', fieldWidth: 120},
          {dataName: 'endTime', fieldTitle: '结束时间', fieldName: 'field_endTime', fieldWidth: 120},
          {
            dataName: 'status',
            fieldTitle: '状态',
            fieldName: 'field_status',
            fieldWidth: 80,
            renderer: function (value) {
              if (value === 0) {
                return '任务初始化';
              } else if (value === 1) {
                return '<span style="color: #0F0;">文件传输成功</span>';
              } else if (value === 2) {
                return '<span style="color: #F00;">文件传输失败</span>';
              } else if (value === 3) {
                return '<span style="color: #0F0;">数据入库成功</span>';
              } else if (value === 4) {
                return '<span style="color: #F00;">数据入库失败</span>';
              } else if (value === 5) {
                return '<span style="color: #0F0;">数据核查成功</span>';
              } else if (value === 6) {
                return '<span style="color: #F00;">数据核查失败</span>';
              } else if (value === 7) {
                return '<span style="color: #0F0;">文件比对成功</span>';
              } else if (value === 8) {
                return '<span style="color: #F00;">文件比对失败</span>';
              } else if (value === 9) {
                return '<span style="color: #0F0;">核查结果上传成功</span>';
              } else if (value === 10) {
                return '<span style="color: #F00;">核查结果上传失败</span>';
              } else {
                return '<span style="color: #F00;">未知异常</span>';
              }
            }
          }
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      pageSize: 50,
      toolbarHandler: function (grid, criteria) {
        return new TaskToolbarHandler(grid, criteria);
      }
    });
  }, true);
});


var router = function () {
  page(WEB_ROOT + '/collector', collectorView);
  page(WEB_ROOT + '/collector/taskitemfile', taskItemFileListView);
  page(WEB_ROOT + '/collector/taskitembusiness', taskItemBusinessListView);
  page(WEB_ROOT + '/collector/filelocation', fileLocationListView);
  page(WEB_ROOT + '/collector/filelocation/create', fileLocationCreateView);
  page(WEB_ROOT + '/collector/filelocation/:fileLocationId/edit', fileLocationEditView);
  page(WEB_ROOT + '/collector/task', taskListView);
  page(WEB_ROOT + '/collector/taskconfig', taskConfigListView);
  page(WEB_ROOT + '/collector/taskconfig/create', taskConfigCreateView);
  page(WEB_ROOT + '/collector/taskconfig/:taskConfigId/edit', taskConfigEditView);
  page({
    dispatch: true
  })
};