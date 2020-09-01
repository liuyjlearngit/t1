function UserToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

UserToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return [{
    text: '&nbsp;<i class="fa fa-plus" aria-hidden="true"></i>  新  增&nbsp;',
    itemCls: 'required',
    handler: function () {
      self.create();
    }
  }, {
    text: '&nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i>  修  改&nbsp;',
    handler: function () {
      self.edit();
    }
  }, {
    text: '&nbsp;<i class="fa fa-file-text-o" aria-hidden="true"></i>  查  看&nbsp;',
    handler: function () {
      self.view();
    }
  }, {
    text: '&nbsp;<i class="fa fa-trash-o" aria-hidden="true"></i>  删  除&nbsp;',
    handler: function () {
      self.delete();
    }
  }, {
    text: '&nbsp;<i class="fa fa-power-off" aria-hidden="true"></i>  重置密码&nbsp;',
    handler: function () {
      self.resetPassword();
    }
  }, '->', {
    text: '&nbsp;<i class="fa fa-search" aria-hidden="true"></i>  查  询&nbsp;',
    handler: function () {
      self.query();
    }
  }, {
    text: '&nbsp;<i class="fa fa-eraser" aria-hidden="true"></i>  重  置&nbsp;',
    handler: function () {
      self.reset();
    }
  }];
};

UserToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

UserToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

UserToolbarHandler.prototype.create = function () {
  page(WEB_ROOT + '/system/user/create');
};

UserToolbarHandler.prototype.view = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择！');
    return;
  }
  var id = selected.get('field_userId');
  page(WEB_ROOT + '/system/user/' + id);
};

UserToolbarHandler.prototype.edit = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择！');
    return;
  }
  var id = selected.get('field_userId');
  page(WEB_ROOT + '/system/user/' + id + '/edit');
};

UserToolbarHandler.prototype._doDelete = function (userId) {
  var self = this;
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/user/' + userId,
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'delete',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '数据删除成功', function () {
          self._grid.getStore().load();
        });
      } else {
        processDataError(data);
      }
    },
    error: function (response) {
      LoadMask.hide();
      processResponseError(response);
    }
  });
};

UserToolbarHandler.prototype.delete = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要删除的用户！');
    return;
  }
  var userId = selected.get('field_userId');
  Ext.MessageBox.confirm('提示信息', '确认删除?删除的内容将无法恢复', function (opt) {
    if (opt === 'yes') {
      self._doDelete(userId);
    }
  });
};

UserToolbarHandler.prototype._doResetPassword = function (userId) {
  var self = this;
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/user/' + userId + '/reset',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'post',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '密码重置成功');
      } else {
        Ext.Msg.alert('错误', data.message);
      }
    },
    error: function (response) {
      LoadMask.hide();
      if (response.responseJSON && response.responseJSON.message && response.responseJSON.status) {
        Ext.Msg.alert('错误', response.responseJSON.message);
      } else {
        Ext.Msg.alert('错误', '系统异常');
      }
    }
  });
};

UserToolbarHandler.prototype.resetPassword = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要重置密码的用户！');
    return;
  }
  var userId = selected.get('field_userId');
  Ext.MessageBox.confirm('提示信息', '请确认是否重置当前选择用户的密码？', function (opt) {
    if (opt === 'yes') {
      self._doResetPassword(userId);
    }
  });
};


function PermissionToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

PermissionToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return ['->', {
    text: '&nbsp;<i class="fa fa-search" aria-hidden="true"></i>  查  询&nbsp;',
    handler: function () {
      self.query();
    }
  }, {
    text: '&nbsp;<i class="fa fa-eraser" aria-hidden="true"></i>  重  置&nbsp;',
    handler: function () {
      self.reset();
    }
  }];
};
PermissionToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

PermissionToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};


function RoleToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

RoleToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return ['->', {
    text: '&nbsp;<i class="fa fa-search" aria-hidden="true"></i>  查  询&nbsp;',
    handler: function () {
      self.query();
    }
  }, {
    text: '&nbsp;<i class="fa fa-eraser" aria-hidden="true"></i>  重  置&nbsp;',
    handler: function () {
      self.reset();
    }
  }];
};
RoleToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

RoleToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

