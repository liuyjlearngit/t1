var MetadataHierarchyTreePanel = Ext.extend(Ext.tree.TreePanel, {
  constructor: function (config) {
    var self = this;
    var dataModelTreeLoader = new Ext.tree.TreeLoader({
      paramOrder: ['node', 'type', 'entityTypeId'],
      directFn: function (node, type, entityTypeId, processDirectResponse) {
        $.ajax({
          url: WEB_ROOT + '/app/v1/metadata/hierarchy',
          headers: {
            'Authorization': 'Bearer ' + getToken()
          },
          data: {
            entityTypeId: entityTypeId
          },
          method: 'GET',
          cache: false,
          success: function (data) {
            if (data.status === 200) {
              var result = [];
              for (var i = 0, len = data.data.length; i < len; i++) {
                result.push({
                  type: 'ENTITY_TYPE',
                  text: data.data[i].name,
                  codeTable: data.data[i].coreTable,
                  extensionTable: data.data[i].extensionTable,
                  entityTypeId: data.data[i].entityTypeId,
                  leaf: !!data.data[i].coreTable,
                  iconCls: !data.data[i].coreTable ? 'fa fa-cubes' : 'fa fa-cube'
                })
              }
              processDirectResponse(result, data);
            }
          },
          error: function (response) {
            processResponseError(response);
          }
        });
      },
      listeners: {
        'beforeload': function (loader, n, callback) {
          loader.baseParams = {
            'entityTypeId': n.attributes.entityTypeId,
            'type': n.attributes.type
          };
        }
      }
    });
    var rootNode = new Ext.tree.AsyncTreeNode({
      expanded: true,
      text: '元数据管理',
      type: 'ROOT',
      children: [{
        text: '指标模型',
        iconCls: 'fa fa-tachometer',
        type: 'INDEX_MODEL',
        expanded: true,
        children: [{
          text: '指标导航',
          iconCls: 'fa fa-globe',
          type: 'INDEX_NAVIGATION',
          leaf: true
        }, {
          text: '指标定义',
          iconCls: 'fa fa-diamond',
          type: 'INDEX_DEFINITION',
          leaf: true
        }]
      }, {
        text: '数据模型',
        iconCls: 'fa fa-database',
        type: 'DATA_MODEL',
        expanded: true,
        loader: dataModelTreeLoader
      }]
    });
    config = Ext.apply({
      root: rootNode,
      rootVisible: false
    }, config);
    MetadataHierarchyTreePanel.superclass.constructor.call(this, config);
  }
});

var EntityTypeCompositePanel = Ext.extend(Ext.Panel, {
  constructor: function (config) {
    var self = this;
    this._entityTypeId = config.entityTypeId;
    this._loadCallback = config.loadCallback;
    var entityTypeFormDatasource = {
      url: WEB_ROOT + '/app/v1/metadata/entitytype',
      method: 'GET',
      response: {
        rootField: 'data',
        columns: [
          {fieldType: 'string', fieldTitle: '实体名称', fieldName: 'field_name', dataName: 'name'},
          {fieldType: 'string', fieldTitle: '实体编码', fieldName: 'field_code', dataName: 'code'},
          {fieldType: 'string', fieldTitle: '核心表', fieldName: 'field_coreTable', dataName: 'coreTable'},
          {fieldType: 'string', fieldTitle: '扩展表', fieldName: 'field_extensionTable', dataName: 'extensionTable'},
          {fieldType: 'string', fieldTitle: '所属专业', fieldName: 'field_specialityName', dataName: 'specialityName'},
          {fieldType: 'string', fieldTitle: '备注', fieldName: 'field_memo', dataName: 'memo'},
          {fieldType: 'number', fieldName: 'field_entityTypeId', dataName: 'entityTypeId', primaryKey: true}
        ]
      }
    };
    var attributeTypeGridDatasource = {
      url: WEB_ROOT + '/app/v1/metadata/attributetype',
      method: 'GET',
      response: {
        pageable: false,
        rootField: 'data',
        totalField: 'total',
        columns: [
          {dataName: 'attributeTypeId', fieldName: 'field_attributeTypeId', primaryKey: true},
          {dataName: 'name', fieldTitle: '属性名称', fieldName: 'field_name', fieldWidth: 200},
          {dataName: 'code', fieldTitle: '属性编码', fieldName: 'field_code', fieldWidth: 120},
          {dataName: 'tableName', fieldTitle: '表名', fieldName: 'field_tableName', fieldWidth: 120},
          {dataName: 'columnName', fieldTitle: '列名', fieldName: 'field_columnName', fieldWidth: 120},
          {dataName: 'dateType', fieldTitle: '数据类型', fieldName: 'field_dateType', fieldWidth: 80},
          {dataName: 'dictionaryTypeId', fieldName: 'field_dictionaryTypeId', foreignKey: true},
          {dataName: 'dictionaryTypeName', fieldTitle: '数据字典', fieldName: 'field_dictionaryTypeName', fieldWidth: 120},
          {
            dataName: 'dictionaryTypeCode',
            fieldTitle: '数据字典编码',
            fieldName: 'field_dictionaryTypeCode',
            fieldWidth: 120
          },
          {dataName: 'memo', fieldTitle: '备注', fieldName: 'field_memo', fieldWidth: 300}
        ]
      }
    };
    this._etInfoPanel = new DefaultFormPanel({
      region: 'center',
      margins: '2 2 2 2',
      readOnly: true,
      datasource: entityTypeFormDatasource
    });
    this._atGridPanel = new DefaultGridPanel({
      region: 'center',
      border: false,
      datasource: attributeTypeGridDatasource,
      storeBeforeLoad: function (store, options) {
        var params = {
          entityTypeId: self._entityTypeId
        };
        store.baseParams = params;
      },
      selectionChange: function (sm) {
        var selected = sm.getSelected();
        if (selected && selected.get('field_dictionaryTypeId') && selected.get('field_dictionaryTypeId') > 0) {
          self._btViewDict.setDisabled(false);
        } else {
          self._btViewDict.setDisabled(true);
        }
      }
    });
    this._dictWin = undefined;
    this._btViewDict = new Ext.Button({
      text: '&nbsp;<i class="fa fa-book" aria-hidden="true"></i>  字典选项&nbsp;',
      disabled: true,
      handler: function () {
        if (!self._dictWin) {
          var dictDs = new Ext.data.Store({
            proxy: new Ext.data.HttpProxy({
              headers: {
                'Authorization': 'Bearer ' + getToken()
              },
              url: WEB_ROOT + '/app/v1/metadata/dictionary',
              method: 'GET'
            }),
            reader: new Ext.data.JsonReader({
              idProperty: 'dictionaryId',
              root: 'data',
              totalProperty: 'total',
              fields: [
                {name: 'field_dictionaryId', mapping: 'dictionaryId'},
                {name: 'field_dictKey', mapping: 'dictKey'},
                {name: 'field_dictValue', mapping: 'dictValue'}
              ]
            }),
            listeners: {
              beforeload: function (store, options) {
                var params = {
                  dictionaryTypeId: self._atGridPanel.selected().get('field_dictionaryTypeId')
                };
                store.baseParams = params;
              }
            }
          });
          var dictCm = new Ext.grid.ColumnModel({
            columns: [
              {header: '字典名', dataIndex: 'field_dictValue', width: 160},
              {header: '字典值', dataIndex: 'field_dictKey', width: 100}
            ]
          });
          var dictGrid = new Ext.grid.GridPanel({
            region: 'center',
            border: false,
            ds: dictDs,
            cm: dictCm,
            autoScroll: true,
            stripeRows: true,
            loadMask: true
          });
          self._dictWin = new Ext.Window({
            layout: 'border',
            width: 300,
            height: 300,
            closeAction: 'hide',
            closable: false,
            plain: true,
            modal: true,
            items: [dictGrid],
            buttons: [{
              text: 'Close',
              handler: function () {
                self._dictWin.hide();
              }
            }],
            listeners: {
              'show': function () {
                dictDs.load();
              }
            }
          });
        }
        self._dictWin.show();
      }
    });
    config = Ext.apply({
      layout: 'border',
      items: [{
        region: 'north',
        border: false,
        height: 100,
        layout: 'border',
        items: [self._etInfoPanel]
      }, new Ext.TabPanel({
        region: 'center',
        activeTab: 0,
        border: false,
        items: [{
          region: 'center',
          border: false,
          layout: 'border',
          title: '属性信息',
          tbar: [self._btViewDict],
          items: [self._atGridPanel]
        }]
      })]
    }, config);
    EntityTypeCompositePanel.superclass.constructor.call(this, config);
    self._etInfoPanel.load(self._entityTypeId, self._loadCallback);
  }
});

var FolderCompositePanel = Ext.extend(Ext.Panel, {
  constructor: function (config) {
    var self = this;
    self._rootNode = new Ext.tree.AsyncTreeNode({
      text: '指标导航根节点',
      type: 'ROOT'
    });

    self._treeLoader = new Ext.tree.TreeLoader({
      paramOrder: ['node', 'folderId'],
      directFn: function (node, folderId, processDirectResponse) {
        $.ajax({
          url: WEB_ROOT + '/app/v1/folder',
          headers: {
            'Authorization': 'Bearer ' + getToken()
          },
          data: {
            parentFolderId: folderId
          },
          method: 'GET',
          cache: false,
          success: function (data) {
            if (data.status == 200) {
              var result = [];
              for (var i = 0, len = data.data.length; i < len; i++) {
                result.push({
                  type: 'FOLDER',
                  text: data.data[i].name,
                  folderId: data.data[i].folderId,
                  parentFolderId: data.data[i].parentFolderId,
                  iconCls: 'fa fa-folder'
                })
              }
              processDirectResponse(result, data);
            }
          }
        });
      },
      listeners: {
        'beforeload': function (loader, n, callback) {
          loader.baseParams = {
            'folderId': n.attributes.folderId,
          };
        }
      }
    });
    this._folderTreePanel = new Ext.tree.TreePanel({
      region: 'west',
      border: true,
      width: 350,
      split: true,
      minSize: 160,
      maxSize: 500,
      tbar: [{
        text: '&nbsp;<i class="fa fa-bars" aria-hidden="true"></i>  导航节点&nbsp;',
        disabled: true
      }, '->', {
        text: '&nbsp;<i class="fa fa-plus-circle" aria-hidden="true"></i>  新  建&nbsp;',
        handler: function () {
          self.createFolder();
        }
      }, {
        text: '&nbsp;<i class="fa fa-minus-circle" aria-hidden="true"></i>  删  除&nbsp;',
        handler: function () {
          self.deleteFolder();
        }
      }, {
        text: '&nbsp;<i class="fa fa-retweet" aria-hidden="true"></i>  重命名&nbsp;',
        handler: function () {
          self.renameFolder();
        }
      }],
      autoScroll: true,
      root: self._rootNode,
      loader: this._treeLoader,
      rootVisible: false
    });
    this._folderTreePanel.getSelectionModel().on('selectionchange', function (sm, n) {
      if (n && n.attributes.folderId) {
        self._indexGridPanel.getStore().load();
      } else {
        self._indexGridPanel.getStore().removeAll();
      }
    });
    this._indexGridDatasource = {
      url: WEB_ROOT + '/app/v1/folder/index',
      method: 'GET',
      response: {
        pageable: false,
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
    this._indexGridPanel = new DefaultGridPanel({
      autoLoad: false,
      region: 'center',
      border: true,
      datasource: this._indexGridDatasource,
      storeBeforeLoad: function (store, options) {
        var node = self._folderTreePanel.getSelectionModel().getSelectedNode();
        var params = {
          folderId: node.attributes.folderId
        };
        store.baseParams = params;
      },
      tbar: [{
        text: '&nbsp;<i class="fa fa-bars" aria-hidden="true"></i>  导航节点中的指标&nbsp;',
        disabled: true
      }, '->', {
        text: '&nbsp;<i class="fa fa-sign-in" aria-hidden="true"></i>  添  加&nbsp;',
        handler: function () {
          var node = self._folderTreePanel.getSelectionModel().getSelectedNode();
          if (!node) {
            Ext.Msg.alert('提示', '请选择导航节点');
            return;
          }
          self.addIndex();
        }
      }, {
        text: '&nbsp;<i class="fa fa-sign-out" aria-hidden="true"></i>  移  除&nbsp;',
        handler: function () {
          var selection = self._indexGridPanel.selection();
          if (!selection || selection.length === 0) {
            Ext.Msg.alert('提示', '请选择要移除的指标');
            return;
          }
          var indexIds = [];
          for (var i = 0, len = selection.length; i < len; i++) {
            indexIds.push(selection[i].get('field_indexId'))
          }
          self.removeIndex(indexIds);
        }
      }]
    });
    config = Ext.apply({
      region: 'center',
      border: false,
      layout: 'border',
      margins: '2 2 2 2',
      items: [this._folderTreePanel, this._indexGridPanel]
    }, config);
    FolderCompositePanel.superclass.constructor.call(this, config);
  },
  createFolder: function () {
    var self = this;
    if (!this._createFolderWin) {
      this._createFolderWin = new Ext.Window({
        layout: 'hbox',
        title: '创建导航节点',
        width: 300,
        height: 70,
        closeAction: 'hide',
        modal: true,
        plain: true,
        layoutConfig: {
          padding: '5',
          align: 'middle'
        },
        defaults: {margins: '0 5 0 0'},
        items: [{
          xtype: 'textfield',
          id: 'field_createdFolderName',
          flex: 1
        }, {
          xtype: 'button',
          text: '&nbsp;<i class="fa fa-save" aria-hidden="true"></i>  创  建&nbsp;',
          handler: function () {
            self.doCreateFolder();
          }
        }],
        listeners: {
          'show': function () {
          }
        }
      });
    }
    Ext.getCmp('field_createdFolderName').setValue('');
    this._createFolderWin.show();
  },
  doCreateFolder: function () {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    var parentFolderId = undefined;
    if (node) {
      parentFolderId = node.attributes.folderId;
    }
    var name = Ext.getCmp('field_createdFolderName').getValue();
    LoadMask.show();
    $.ajax({
      url: WEB_ROOT + '/app/v1/folder',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      data: {
        name: name,
        parentFolderId: parentFolderId
      },
      method: 'POST',
      cache: false,
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          Ext.Msg.alert('提示', '创建成功', function () {
            if (node) {
              node.reload(function (n) {
                n.expand();
              });
            } else {
              self._rootNode.reload(function (n) {
                n.expand();
              });
            }
            self._createFolderWin.hide();
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
  },
  renameFolder: function () {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    if (!node) {
      Ext.Msg.alert('提示', '请选择导航节点');
      return;
    }
    if (!this._renameFolderWin) {
      this._renameFolderWin = new Ext.Window({
        layout: 'hbox',
        title: '重命名导航节点',
        width: 300,
        height: 70,
        closeAction: 'hide',
        modal: true,
        plain: true,
        layoutConfig: {
          padding: '5',
          align: 'middle'
        },
        defaults: {margins: '0 5 0 0'},
        items: [{
          xtype: 'textfield',
          id: 'field_renameFolderName',
          flex: 1
        }, {
          xtype: 'button',
          text: '&nbsp;<i class="fa fa-save" aria-hidden="true"></i>  保  存&nbsp;',
          handler: function () {
            self.doRenameFolder();
          }
        }],
        listeners: {
          'show': function () {
          }
        }
      });
    }
    Ext.getCmp('field_renameFolderName').setValue('');
    this._renameFolderWin.show();
  },
  doRenameFolder: function () {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    var folderId = node.attributes.folderId;
    var newName = Ext.getCmp('field_renameFolderName').getValue();
    LoadMask.show();
    $.ajax({
      url: WEB_ROOT + '/app/v1/folder/' + folderId + '/rename',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      data: {
        newName: newName,
      },
      method: 'POST',
      cache: false,
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          Ext.Msg.alert('提示', '创建成功', function () {
            if (node.parentNode) {
              node.parentNode.reload(function (n) {
                n.expand();
              });
            } else {
              self._rootNode.reload(function (n) {
                n.expand();
              });
            }
            self._renameFolderWin.hide();
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
  },
  deleteFolder: function () {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    if (!node) {
      Ext.Msg.alert('提示', '请选择导航节点');
      return;
    }
    var folderId = node.attributes.folderId;
    var parentNode = node.parentNode;
    if (node.isExpanded()) {
      if (node.hasChildNodes()) {
        Ext.Msg.confirm('确认', '是否删除子目录?', function (btn) {
          if (btn === 'yes') {
            self.doDeleteFolder(folderId, true, parentNode);
          } else {
            self.doDeleteFolder(folderId, false, parentNode);
          }
        });
      } else {
        self.doDeleteFolder(folderId, false, parentNode);
      }
    } else {
      node.expand(false, false, function () {
        if (node.hasChildNodes()) {
          Ext.Msg.confirm('确认', '是否删除子目录?', function (btn) {
            if (btn === 'yes') {
              self.doDeleteFolder(folderId, true, parentNode);
            } else {
              self.doDeleteFolder(folderId, false, parentNode);
            }
          });
        } else {
          self.doDeleteFolder(folderId, false, parentNode);
        }
      });
    }
  },
  doDeleteFolder: function (folderId, cascade, parentNode) {
    LoadMask.show();
    $.ajax({
      url: WEB_ROOT + '/app/v1/folder/' + folderId + '?' + $.param({cascade: cascade}),
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      method: 'DELETE',
      cache: false,
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          Ext.Msg.alert('提示', '删除成功', function () {
            if (parentNode) {
              parentNode.reload(function (n) {
                n.expand();
              });
            } else {
              self._rootNode.reload(function (n) {
                n.expand();
              });
            }
            self._createFolderWin.hide();
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
  },
  addIndex: function () {
    var self = this;
    if (!this._indicesGridWin) {
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
      var indexGrid = new DefaultListViewPanel({
        datasource: datasource,
        toolbarHandler: function (grid, criteria) {
          return new IndexWinToolbarHandler(grid, criteria, function () {
            var selection = indexGrid.getGrid().selection();
            if (!selection || selection.length === 0) {
              Ext.Msg.alert('提示', '请选择！');
              return;
            }
            var indexIds = [];
            for (var i = 0, len = selection.length; i < len; i++) {
              indexIds.push(selection[i].get('field_indexId'))
            }
            self.doAddIndex(indexIds);
          }, function () {
            self._indicesGridWin.hide();
          });
        }
      });
      this._indicesGridWin = new Ext.Window({
        layout: 'border',
        title: '查询指标定义',
        width: 600,
        height: 400,
        closeAction: 'hide',
        modal: true,
        plain: true,
        items: [indexGrid],
        listeners: {
          'show': function () {
            indexGrid.getGrid().getStore().reload();
          }
        }
      });
    }
    this._indicesGridWin.show();
  },
  doAddIndex: function (indexIds) {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    var folderId = node.attributes.folderId;
    LoadMask.show();
    $.ajax({
      url: WEB_ROOT + '/app/v1/folder/' + folderId + '/index',
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      data: {
        indexIds: indexIds.join(',')
      },
      method: 'POST',
      cache: false,
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          Ext.Msg.alert('提示', '添加成功', function () {
            self._indexGridPanel.getStore().reload();
            self._indicesGridWin.hide();
          });
        } else {
          processDataError(data)
        }
      },
      error: function (response) {
        LoadMask.hide();
        processResponseError(response);
      }
    });
  },
  removeIndex: function (indexIds) {
    var self = this;
    var node = this._folderTreePanel.getSelectionModel().getSelectedNode();
    var folderId = node.attributes.folderId;
    LoadMask.show();
    $.ajax({
      url: WEB_ROOT + '/app/v1/folder/' + folderId + '/index?' + $.param({indexIds: indexIds.join(',')}),
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      method: 'DELETE',
      cache: false,
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          Ext.Msg.alert('提示', '移除成功', function () {
            self._indexGridPanel.getStore().reload();
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
  },
  getRootNode: function () {
    return this._rootNode;
  }
});