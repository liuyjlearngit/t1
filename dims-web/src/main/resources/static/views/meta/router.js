var metaView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  tabs.setActiveTab(0);
});
var entityTypeView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-cube" aria-hidden="true"></i> 查看元数据', function (tabId) {
    return new EntityTypeCompositePanel({
      border: false,
      region: 'center',
      entityTypeId: ctx.params.entityTypeId,
      loadCallback: function (f, a) {
        if (a.result && a.result.data && a.result.data.field_name) {
          Ext.getCmp(tabId).setTitle('<i class="fa fa-cube" aria-hidden="true"></i> 查看' + a.result.data.field_name);
        }
      }
    });
  }, true);
});

var indexListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-diamond" aria-hidden="true"></i> 指标定义管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/index',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '指标名称',
          fieldName: 'field_name'
        }, {
          fieldType: 'string',
          fieldTitle: '指标编码',
          fieldName: 'field_code'
        }, {
          fieldType: 'string',
          fieldTitle: '专业类型',
          fieldName: 'field_specialityName'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'indexId', fieldName: 'field_indexId', primaryKey: true},
          {dataName: 'name', fieldTitle: '指标名称', fieldName: 'field_name', fieldWidth: 160},
          {dataName: 'code', fieldTitle: '指标编码', fieldName: 'field_code', fieldWidth: 160},
          {dataName: 'entityTypeName', fieldTitle: '实体类型', fieldName: 'field_entityTypeName', fieldWidth: 120},
          {dataName: 'specialityName', fieldTitle: '专业类型', fieldName: 'field_specialityName', fieldWidth: 120},
          {
            dataName: 'type',
            fieldTitle: '指标类型',
            fieldName: 'field_type',
            fieldWidth: 80,
            renderer: function (value) {
              if (value === 1) {
                return '存储过程定制';
              } else if (value === 2) {
                return '扩展表关联性指标';
              } else if (value === 3) {
                return '指标集合';
              } else if (value === 4) {
                return '字典准确性指标';
              } else if (value === 5) {
                return '必填性分类指标';
              } else {
                return '';
              }
            }
          },
          {
            dataName: 'enable',
            fieldTitle: '是否启用',
            fieldName: 'field_enable',
            fieldWidth: 80,
            renderer: function (value) {
              if (value) {
                return '是';
              } else {
                return '否';
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
        return new IndexToolbarHandler(grid, criteria);
      }
    });
  }, true);
});

var indexViewView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-user" aria-hidden="true"></i> 查看指标', function (tabId) {
    return new DefaultEditPanel({
      entityId: ctx.params.indexId,
      readOnly: true,
      datasource: {
        url: WEB_ROOT + '/app/v1/index',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'number', dataName: 'indexId', fieldName: 'field_indexId', primaryKey: true},
            {fieldType: 'string', dataName: 'name', fieldTitle: '指标名称', fieldName: 'field_name'},
            {fieldType: 'string', dataName: 'code', fieldTitle: '指标编码', fieldName: 'field_code'},
            {fieldType: 'string', dataName: 'entityTypeName', fieldTitle: '实体类型', fieldName: 'field_entityTypeName'},
            {fieldType: 'string', dataName: 'specialityName', fieldTitle: '专业类型', fieldName: 'field_specialityName'},
            {fieldType: 'string', dataName: 'type', fieldTitle: '指标类型', fieldName: 'field_type'},
            {fieldType: 'string', dataName: 'enable', fieldTitle: '是否启用', fieldName: 'field_enable'}
          ]
        }
      },
      listeners: {
        'render': function (c) {
          c.load(function (f, a) {
            if (a.result && a.result.data && a.result.data.field_name) {
              Ext.getCmp(tabId).setTitle('<i class="fa fa-user" aria-hidden="true"></i> 编辑' + a.result.data.field_name);
            }
          });
        }
      }
    });
  }, true);
});

var folderView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-globe" aria-hidden="true"></i> 指标导航', function (tabId) {
    return new FolderCompositePanel({
      listeners: {
        'render': function (c) {
          c.getRootNode().expand(false, true, function (n) {
            cascadeExpand(n);
          });
        }
      }
    });
  }, true);
});

function cascadeExpand(n) {
  if (n.childNodes) {
    for (var i = 0, len = n.childNodes.length; i < len; i++) {
      var cn = n.childNodes[i];
      if (cn.getDepth() < 3) {
        cn.expand(false, true, cascadeExpand);
      }
    }
  }
}

var router = function () {
  page(WEB_ROOT + '/meta', metaView);
  page(WEB_ROOT + '/meta/entitytype/:entityTypeId', entityTypeView);
  page(WEB_ROOT + '/meta/index', indexListView);
  page(WEB_ROOT + '/meta/index/:indexId', indexViewView);
  page(WEB_ROOT + '/meta/folder', folderView);
  page({
    dispatch: true
  })
};