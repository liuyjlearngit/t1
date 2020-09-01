function initContent(contentChart) {
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskitemfile/aggregation',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'GET',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        var option = {
          title: {
            text: '近期数据采集状态'
          },
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross',
              label: {
                backgroundColor: '#6a7985'
              }
            }
          },
          legend: {
            data: ['成功率(%)', '耗时(ms)', '文件大小(MB)']
          },
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: {
            type: 'category',
            silent: false,
            data: data.data.xAxis,
            axisLine: {onZero: true},
            splitLine: {show: false},
            splitArea: {show: false}
          },
          yAxis: [
            {
              type: 'value',
              name: '成功率(%)',
              min: 0,
              max: 100,
              position: 'left',
              axisLine: {
                lineStyle: {}
              }
            }, {
              type: 'value',
              name: '耗时(ms)',
              position: 'right',
              splitLine: {
                show: false
              }
            }, {
              type: 'value',
              name: '文件大小(MB)',
              offset: 70,
              position: 'right',
              splitLine: {
                show: false
              }
            }
          ],
          series: [
            {
              name: '成功率(%)',
              type: 'line',
              data: data.data.successRateValues
            },
            {
              name: '耗时(ms)',
              type: 'line',
              yAxisIndex: 1,
              data: data.data.totalCostValues
            },
            {
              name: '文件大小(MB)',
              type: 'line',
              yAxisIndex: 2,
              data: data.data.totalFileSizeValues
            }
          ]
        };
        contentChart.setOption(option);
      }
    },
    error: function (response) {
      LoadMask.hide();
      processResponseError(response);
    }
  });


}

function CollectorHierarchyTreeHandler() {

}

CollectorHierarchyTreeHandler.prototype.treeNodeClick = function (n) {
  if (n.attributes.type === 'FILE_REPORT') {
    page(WEB_ROOT + '/collector/taskitemfile');
  } else if (n.attributes.type === 'BUSINESS_REPORT') {
    page(WEB_ROOT + '/collector/taskitembusiness')
  } else if (n.attributes.type === 'FTP_CONFIG') {
    page(WEB_ROOT + '/collector/filelocation')
  } else if (n.attributes.type === 'COLLECTOR_TASK') {
    page(WEB_ROOT + '/collector/task')
  } else if (n.attributes.type === 'TASK_CONFIG') {
    page(WEB_ROOT + '/collector/taskconfig')
  }
};

//TaskItemFileToolbarHandler

function TaskItemFileToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

TaskItemFileToolbarHandler.prototype.toolbar = function () {
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
TaskItemFileToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

TaskItemFileToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};


function TaskItemBusinessToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

TaskItemBusinessToolbarHandler.prototype.toolbar = function () {
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
TaskItemBusinessToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

TaskItemBusinessToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};


function FileLocationWinToolbarHandler(grid, criteriaForm, confirmFn, cancelFn) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
  this._confimFn = confirmFn;
  this._cancelFn = cancelFn
}

FileLocationWinToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return [{
    text: '&nbsp;<i class="fa fa-check-circle-o" aria-hidden="true"></i>  确  定&nbsp;',
    handler: function () {
      if (typeof self._confimFn === 'function') {
        self._confimFn();
      }
    }
  }, {
    text: '&nbsp;<i class="fa fa-times-circle-o" aria-hidden="true"></i>  取  消&nbsp;',
    handler: function () {
      if (typeof self._cancelFn === 'function') {
        self._cancelFn();
      }
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
FileLocationWinToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

FileLocationWinToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};


function FileLocationToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

FileLocationToolbarHandler.prototype.toolbar = function () {
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
    text: '&nbsp;<i class="fa fa-trash-o" aria-hidden="true"></i>  删  除&nbsp;',
    handler: function () {
      self.delete();
    }
  }, {
    text: '&nbsp;<i class="fa fa-heartbeat" aria-hidden="true"></i>  测试连接&nbsp;',
    handler: function () {
      self.connectionTest();
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

FileLocationToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

FileLocationToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

FileLocationToolbarHandler.prototype.create = function () {
  page(WEB_ROOT + '/collector/filelocation/create');
};

FileLocationToolbarHandler.prototype.edit = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择！');
    return;
  }
  var id = selected.get('field_fileLocationId');
  page(WEB_ROOT + '/collector/filelocation/' + id + '/edit');
};

FileLocationToolbarHandler.prototype._doDelete = function (fileLocationId) {
  var self = this;
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/filelocation/' + fileLocationId,
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

FileLocationToolbarHandler.prototype.delete = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要删除的配置！');
    return;
  }
  var fileLocationId = selected.get('field_fileLocationId');
  Ext.MessageBox.confirm('提示信息', '确认删除?删除的内容将无法恢复', function (opt) {
    if (opt === 'yes') {
      self._doDelete(fileLocationId);
    }
  });
};

FileLocationToolbarHandler.prototype.connectionTest = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要删除的配置！');
    return;
  }
  var fileLocationId = selected.get('field_fileLocationId');
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/filelocation/' + fileLocationId + '/test',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '测试连接成功！目录文件列表如下：' + data.data.join(';'));
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


function TaskToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}


TaskToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return [/*{
    text: '&nbsp;<i class="fa fa-bolt" aria-hidden="true"></i>  执行计算&nbsp;',
    handler: function () {
      self.calculate();
    }
  }, */{
    text: '&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i>  导出核查结果&nbsp;',
    handler: function () {
      self.exportTaskResult();
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

TaskToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

TaskToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

TaskToolbarHandler.prototype.calculate = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要执行计算的任务！');
    return;
  }
  var taskId = selected.get('field_taskId');
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/task/' + taskId + '/calculate',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '创建计算任务成功');
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

TaskToolbarHandler.prototype.exportTaskResult = function () {

  var self = this;
  var selection = self._grid.selection();
  if (!selection || selection.length === 0) {
    Ext.Msg.alert('提示', '请选择要导出的任务！');
    return;
  }
  var ids = [], i = 0, l = selection.length;
  for (; i < l; i++) {
    ids.push(selection[i].get('field_taskId'));
  }

  window.open(WEB_ROOT + '/app/v1/task/result/export?taskIds=' + ids.join(','), '_blank');
};

function TaskConfigToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

TaskConfigToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return [{
    text: '&nbsp;<i class="fa fa-plus" aria-hidden="true"></i>  新  增&nbsp;',
    itemCls: 'required',
    handler: function () {
      self.create();
    }
  },/* {
    text: '&nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true"></i>  修  改&nbsp;',
    handler: function () {
      self.edit();
    }
  },*/ {
    text: '&nbsp;<i class="fa fa-trash-o" aria-hidden="true"></i>  删  除&nbsp;',
    handler: function () {
      self.delete();
    }
  }, {
    text: '&nbsp;<i class="fa fa-bolt" aria-hidden="true"></i>  立即执行&nbsp;',
    handler: function () {
      self.createTask();
    }
  }, {
    text: '&nbsp;<i class="fa fa-clone" aria-hidden="true"></i>  批量执行&nbsp;',
    handler: function () {
      self.doBatchExecuteTask();
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

TaskConfigToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

TaskConfigToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

TaskConfigToolbarHandler.prototype.create = function () {
  page(WEB_ROOT + '/collector/taskconfig/create');
};

TaskConfigToolbarHandler.prototype.edit = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择！');
    return;
  }
  var id = selected.get('field_taskConfigId');
  page(WEB_ROOT + '/collector/taskconfig/' + id + '/edit');
};

TaskConfigToolbarHandler.prototype._doDelete = function (taskConfigId) {
  var self = this;
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/' + taskConfigId,
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

TaskConfigToolbarHandler.prototype.delete = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要删除的配置！');
    return;
  }
  var taskConfigId = selected.get('field_taskConfigId');
  Ext.MessageBox.confirm('提示信息', '确认删除?删除的内容将无法恢复', function (opt) {
    if (opt === 'yes') {
      self._doDelete(taskConfigId);
    }
  });
};


TaskConfigToolbarHandler.prototype.createTask = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要创建任务的配置！');
    return;
  }
  var taskConfigId = selected.get('field_taskConfigId');
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/' + taskConfigId + '/createtask',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '创建任务成功');
      } else if (data.status === 999 && !collectionDate) {
        Ext.MessageBox.confirm('提示', data.message + ' 是否排队等待？', function (opt) {
          if (opt === 'yes') {
            self._pushTask(taskConfigId);
          }
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

TaskConfigToolbarHandler.prototype._pushTask = function (taskConfigId) {
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/' + taskConfigId + '/pushtask',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '排队成功', function () {
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

TaskConfigToolbarHandler.prototype.validateFile = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择要校验的配置！');
    return;
  }
  var taskConfigId = selected.get('field_taskConfigId');
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/' + taskConfigId + '/validate',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '执行校验成功', function () {
          self._grid.getStore().load();
        });
      } else if (data.status === 999) {
        Ext.MessageBox.confirm('提示', data.message + ' 是否排队等待？', function (opt) {
          if (opt === 'yes') {
            self._pushValidation(taskConfigId);
          }
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

TaskConfigToolbarHandler.prototype._pushValidation = function (taskConfigId) {
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/' + taskConfigId + '/pushvalidation',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '排队成功', function () {
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

TaskConfigToolbarHandler.prototype.doBatchExecuteTask = function () {
  var self = this;
  var selection = self._grid.selection();
  if (!selection || selection.length === 0) {
    Ext.Msg.alert('提示', '请选择要创建任务的配置！');
    return;
  }
  var ids = [], i = 0, l = selection.length;
  for (; i < l; i++) {
    ids.push(selection[i].get('field_taskConfigId'));
  }
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/batchexecutetask',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    data: {
      taskConfigIds: ids.join(',')
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '批量排队成功', function () {
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

TaskConfigToolbarHandler.prototype.exportValidationResult = function () {

  var self = this;
  var selection = self._grid.selection();
  if (!selection || selection.length === 0) {
    Ext.Msg.alert('提示', '请选择要导出校验结果的配置！');
    return;
  }
  var ids = [], i = 0, l = selection.length;
  for (; i < l; i++) {
    ids.push(selection[i].get('field_taskConfigId'));
  }
  var params = {
    taskConfigIds: ids.join(',')
  };
  window.open(WEB_ROOT + '/app/v1/taskconfig/validationresult/export?' + $.param(params), '_blank');
};

TaskConfigToolbarHandler.prototype.doBatchExecuteValidation = function () {
  var self = this;
  var selection = self._grid.selection();
  if (!selection || selection.length === 0) {
    Ext.Msg.alert('提示', '请选择要创建任务的配置！');
    return;
  }
  var ids = [], i = 0, l = selection.length;
  for (; i < l; i++) {
    ids.push(selection[i].get('field_taskConfigId'));
  }
  LoadMask.show();
  $.ajax({
    url: WEB_ROOT + '/app/v1/taskconfig/batchexecutevalidation',
    headers: {
      'Authorization': 'Bearer ' + getToken()
    },
    data: {
      taskConfigIds: ids.join(',')
    },
    method: 'POST',
    cache: false,
    success: function (data) {
      LoadMask.hide();
      if (data.status === 200) {
        Ext.Msg.alert('提示', '批量排队成功', function () {
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