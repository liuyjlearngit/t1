function IndicatorNavTreeHandler() {

}

IndicatorNavTreeHandler.prototype.selectionChangeHandler = function (sm, n) {
  if (!n) {
    page(WEB_ROOT + '/indicator');
  } else if (n.attributes.type === 'INDICATOR_FOLDER') {
    page(WEB_ROOT + '/indicator/folder/' + n.attributes.folderId + '#' + n.text);
  } else if (n.attributes.type === 'INDICATOR_INDEX') {
    page(WEB_ROOT + '/indicator/folder/' + n.attributes.folderId + '/index/' + n.attributes.indexId + '#' + n.text)
  }
};

function IndicatorDataListHandler(grid, tree) {
  this._grid = grid;
  this._tree = tree;
}

IndicatorDataListHandler.prototype.toolbar = function () {
  var self = this;
  var taskComboStore = new Ext.data.Store({
    proxy: new Ext.data.HttpProxy({
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      url: WEB_ROOT + '/app/v1/task/latest/15',
      method: 'GET'
    }),
    reader: new Ext.data.JsonReader({
      root: 'data',
      fields: [
        {name: 'taskId', type: 'number'},
        {name: 'name', type: 'string'}
      ]
    })
  });
  var taskCombo = new Ext.form.ComboBox({
    id: 'taskItemIndex_taskId',
    name: 'taskId',
    store: taskComboStore,
    valueField: 'taskId',
    displayField: 'name',
    width: 300,
    triggerAction: 'all',
    listeners: {
      'select': function () {
        self._grid.getStore().load();
      }
    }
  });
  return [{
    text: '&nbsp;&nbsp;采集任务&nbsp;&nbsp;',
    disabled: true
  }, taskCombo, '->', {
    text: '&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i>  导  出&nbsp;',
    handler: function () {
      self.export();
    }
  }, {
    text: '&nbsp;<i class="fa fa-refresh" aria-hidden="true"></i>  刷  新&nbsp;',
    handler: function () {
      self.query();
    }
  }];
};

IndicatorDataListHandler.prototype.query = function () {
  this._grid.getStore().load();
};

IndicatorDataListHandler.prototype.export = function () {
  var params = {};
  var n = this._tree.getSelectionModel().getSelectedNode();
  if (n) {
    if (n.attributes.type === 'INDICATOR_FOLDER') {
      params['folderId'] = n.attributes.folderId;
    } else if (n.attributes.type === 'INDICATOR_INDEX') {
      params['folderId'] = n.attributes.folderId;
      params['indexId'] = n.attributes.indexId;
    }
  }
  var combo = Ext.getCmp('taskItemIndex_taskId');
  if (combo) {
    params['taskId'] = combo.getValue();
  }
  window.open(WEB_ROOT + '/app/v1/indicator/data/export?' + $.param(params), '_blank');
};