var systemView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  tabs.setActiveTab(0);
});

var userListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-users" aria-hidden="true"></i> 用户管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/user',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '姓名',
          fieldName: 'field_name'
        }, {
          fieldType: 'string',
          fieldTitle: '用户名',
          fieldName: 'field_username'
        }, {
          fieldType: 'string',
          fieldTitle: '手机',
          fieldName: 'field_mobilePhone'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'userId', fieldName: 'field_userId', primaryKey: true},
          {dataName: 'name', fieldTitle: '姓名', fieldName: 'field_name', fieldWidth: 120},
          {dataName: 'username', fieldTitle: '用户名', fieldName: 'field_username', fieldWidth: 160},
          {dataName: 'email', fieldTitle: '邮箱', fieldName: 'field_email', fieldWidth: 200},
          {dataName: 'mobilePhone', fieldTitle: '手机', fieldName: 'field_mobilePhone', fieldWidth: 80},
          {dataName: 'remark', fieldTitle: '备注', fieldName: 'field_remark', fieldWidth: 300}
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      toolbarHandler: function (grid, criteria) {
        return new UserToolbarHandler(grid, criteria);
      }
    });
  }, true);
});
var userCreateView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-user" aria-hidden="true"></i> 创建用户', function (tabId) {
    return new DefaultEditPanel({
      datasource: {
        url: WEB_ROOT + '/app/v1/user',
        saveUrl: WEB_ROOT + '/app/v1/user',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'string', fieldTitle: '姓名', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '用户名', fieldName: 'field_username', dataName: 'username'},
            {fieldType: 'string', fieldTitle: '邮箱', fieldName: 'field_email', dataName: 'email'},
            {fieldType: 'string', fieldTitle: '电话', fieldName: 'field_mobilePhone', dataName: 'mobilePhone'},
            {fieldType: 'number', fieldName: 'field_userId', dataName: 'userId', primaryKey: true}
          ]
        }
      }
    });
  }, true);
});

var userEditView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-user" aria-hidden="true"></i> 编辑用户', function (tabId) {
    return new DefaultEditPanel({
      entityId: ctx.params.userId,
      datasource: {
        url: WEB_ROOT + '/app/v1/user',
        saveUrl: WEB_ROOT + '/app/v1/user',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'string', fieldTitle: '姓名', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '用户名', fieldName: 'field_username', dataName: 'username'},
            {fieldType: 'string', fieldTitle: '邮箱', fieldName: 'field_email', dataName: 'email'},
            {fieldType: 'string', fieldTitle: '电话', fieldName: 'field_mobilePhone', dataName: 'mobilePhone'},
            {fieldType: 'number', fieldName: 'field_userId', dataName: 'userId', primaryKey: true}
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

var userViewView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-user" aria-hidden="true"></i> 查看用户', function (tabId) {
    return new DefaultEditPanel({
      entityId: ctx.params.userId,
      readOnly: true,
      datasource: {
        url: WEB_ROOT + '/app/v1/user',
        method: 'GET',
        response: {
          rootField: 'data',
          columns: [
            {fieldType: 'string', fieldTitle: '姓名', fieldName: 'field_name', dataName: 'name'},
            {fieldType: 'string', fieldTitle: '用户名', fieldName: 'field_username', dataName: 'username'},
            {fieldType: 'string', fieldTitle: '邮箱', fieldName: 'field_email', dataName: 'email'},
            {fieldType: 'string', fieldTitle: '电话', fieldName: 'field_mobilePhone', dataName: 'mobilePhone'},
            {fieldType: 'number', fieldName: 'field_userId', dataName: 'userId', primaryKey: true}
          ]
        }
      },
      listeners: {
        'render': function (c) {
          c.load(function (f, a) {
            if (a.result && a.result.data && a.result.data.field_name) {
              Ext.getCmp(tabId).setTitle('<i class="fa fa-user" aria-hidden="true"></i> 查看' + a.result.data.field_name);
            }
          });
        }
      }
    });
  }, true);
});

var permissionListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-shield" aria-hidden="true"></i> 权限管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/permission',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '权限名称',
          fieldName: 'field_name'
        }, {
          fieldType: 'string',
          fieldTitle: '权限编码',
          fieldName: 'field_code'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'permissionId', fieldName: 'field_permissionId', primaryKey: true},
          {dataName: 'name', fieldTitle: '权限名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'code', fieldTitle: '权限编码', fieldName: 'field_code', fieldWidth: 200}
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      toolbarHandler: function (grid, criteria) {
        return new PermissionToolbarHandler(grid, criteria);
      }
    });
  }, true);
});


var roleListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  var href = ctx.path.substr(WEB_ROOT.length);
  addPanelTab(tabs, href, '<i class="fa fa-user-secret" aria-hidden="true"></i> 角色管理', function (tabId) {
    var datasource = {
      url: WEB_ROOT + '/app/v1/role',
      method: 'GET',
      request: {
        criteria: [{
          fieldType: 'string',
          fieldTitle: '角色名称',
          fieldName: 'field_name'
        }, {
          fieldType: 'string',
          fieldTitle: '角色编码',
          fieldName: 'field_code'
        }]
      },
      response: {
        pageable: true,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'roleId', fieldName: 'field_roleId', primaryKey: true},
          {dataName: 'name', fieldTitle: '角色名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'code', fieldTitle: '角色编码', fieldName: 'field_code', fieldWidth: 200}
        ]
      }
    };
    return new DefaultListViewPanel({
      datasource: datasource,
      toolbarHandler: function (grid, criteria) {
        return new RoleToolbarHandler(grid, criteria);
      }
    });
  }, true);
});


var router = function () {
  page(WEB_ROOT + '/system', systemView);
  page(WEB_ROOT + '/system/user', userListView);
  page(WEB_ROOT + '/system/user/create', userCreateView);
  page(WEB_ROOT + '/system/user/:userId', userViewView);
  page(WEB_ROOT + '/system/user/:userId/edit', userEditView);

  page(WEB_ROOT + '/system/permission', permissionListView);

  page(WEB_ROOT + '/system/role', roleListView);
  page({
    dispatch: true
  })
};