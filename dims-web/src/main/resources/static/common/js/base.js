Ext.MessageBox.buttonText.yes = '是';
Ext.MessageBox.buttonText.no = '否';
Ext.MessageBox.buttonText.ok = '确认';
Ext.MessageBox.buttonText.cancel = '取消';

Ext.override(Ext.layout.BorderLayout, {
  onLayout: function (ct, target) {
    var collapsed;
    if (!this.rendered) {
      target.position();
      target.addClass('x-border-layout-ct');
      var items = ct.items.items;
      collapsed = [];
      for (var i = 0, len = items.length; i < len; i++) {
        var c = items[i];
        var pos = c.region;
        if (c.collapsed) {
          collapsed.push(c);
        }
        c.collapsed = false;
        if (!c.rendered) {
          c.cls = c.cls ? c.cls + ' x-border-panel' : 'x-border-panel';
          c.render(target, i);
        }
        this[pos] = pos != 'center' && c.split ?
          new Ext.layout.BorderLayout.SplitRegion(this, c.initialConfig, pos) :
          new Ext.layout.BorderLayout.Region(this, c.initialConfig, pos);
        this[pos].render(target, c);
      }
      this.rendered = true;
    }

    var size = target.getViewSize();

    if (size.width < this.minWidth) {
      target.setStyle('width', this.minWidth + 'px');
      size.width = this.minWidth;
      target.up('').setStyle('overflow', 'auto');
    } else {
      target.setStyle('width', '');
    }

    //test minHeight


    if (this.minHeight !== undefined) {
      //alert(size.height + '---' + this.minHeight);
      if (size.height < this.minHeight) {
        //alert('1 --- ' + size.height + '---' + this.minHeight);
        target.setStyle('height', this.minHeight + 'px');
        size.height = this.minHeight;
        target.up('').setStyle('overflow', 'auto');
      } else {
        target.setStyle('height', '');
      }
    }

    if (size.width < 20 || size.height < 20) { // display none?
      if (collapsed) {
        this.restoreCollapsed = collapsed;
      }
      return;
    } else if (this.restoreCollapsed) {
      collapsed = this.restoreCollapsed;
      delete this.restoreCollapsed;
    }

    var w = size.width,
      h = size.height;
    var centerW = w,
      centerH = h,
      centerY = 0,
      centerX = 0;

    var n = this.north,
      s = this.south,
      west = this.west,
      e = this.east,
      c = this.center;
    if (!c) {
      throw 'No center region defined in BorderLayout ' + ct.id;
    }

    if (n && n.isVisible()) {
      var b = n.getSize();
      var m = n.getMargins();
      b.width = w - (m.left + m.right);
      b.x = m.left;
      b.y = m.top;
      centerY = b.height + b.y + m.bottom;
      centerH -= centerY;
      n.applyLayout(b);
    }
    if (s && s.isVisible()) {
      var b = s.getSize();
      var m = s.getMargins();
      b.width = w - (m.left + m.right);
      b.x = m.left;
      var totalHeight = (b.height + m.top + m.bottom);
      b.y = h - totalHeight + m.top;
      centerH -= totalHeight;
      s.applyLayout(b);
    }
    if (west && west.isVisible()) {
      var b = west.getSize();
      var m = west.getMargins();
      b.height = centerH - (m.top + m.bottom);
      b.x = m.left;
      b.y = centerY + m.top;
      var totalWidth = (b.width + m.left + m.right);
      centerX += totalWidth;
      centerW -= totalWidth;
      west.applyLayout(b);
    }
    if (e && e.isVisible()) {
      var b = e.getSize();
      var m = e.getMargins();
      b.height = centerH - (m.top + m.bottom);
      var totalWidth = (b.width + m.left + m.right);
      b.x = w - totalWidth + m.left;
      b.y = centerY + m.top;
      centerW -= totalWidth;
      e.applyLayout(b);
    }

    var m = c.getMargins();
    var centerBox = {
      x: centerX + m.left,
      y: centerY + m.top,
      width: centerW - (m.left + m.right),
      height: centerH - (m.top + m.bottom)
    };
    c.applyLayout(centerBox);

    if (collapsed) {
      for (var i = 0, len = collapsed.length; i < len; i++) {
        collapsed[i].collapse(false);
      }
    }

    if (Ext.isIE && Ext.isStrict) { // workaround IE strict repainting issue
      target.repaint();
    }
  }
});

Ext.apply(Ext.grid.GridPanel.prototype, {
  autoSizeColumns: function () {
    for (var i = 0; i < this.colModel.getColumnCount(); i++) {
      this.autoSizeColumn(i);
    }
  },
  autoSizeColumn: function (c) {
    var headerCell = this.view.getHeaderCell(c);
    var w = headerCell.firstChild.scrollWidth;
    var rowSizeControl = 10;
    if (this.store.getCount() < 10) {
      rowSizeControl = this.store.getCount()
    }
    for (var i = 0, l = rowSizeControl; i < l; i++) {
      if (!Ext.isEmpty(this.view.getCell(i, c)) && !Ext.isEmpty(this.view.getCell(i, c).firstChild)) {
        w = Math.max(w, this.view.getCell(i, c).firstChild.scrollWidth);
      }
    }
    var minWidth = this.colModel.getColumnById(this.colModel.getColumnId(c)).minWidth;

    if ((minWidth) && (w < minWidth)) {
      w = minWidth;
    }
    this.colModel.setColumnWidth(c, w + 2);
    return w;
  }
});


var LoadMask = function () {
  return {
    show: function () {
      Ext.MessageBox.show({
        title: '请稍候',
        msg: '<img src="' + WEB_ROOT + '/static/extjs/3.4.1/resources/images/default/grid/loading.gif" style="width:16px;height:16px;" align="absmiddle"> 请稍候',
        width: 240,
        closable: false
      });
    },
    hide: function () {
      Ext.MessageBox.hide();
    },
  }
}();

function TabManager() {

}

TabManager.openNewTab = function (tabId, tabTitle, url, closable) {
  if (window.parent !== undefined && window.parent.navigationHandler != undefined) {
    window.parent.navigationHandler.addTab(tabId, tabTitle, url, closable);
  } else if (window.parent.parent !== undefined && window.parent.parent.navigationHandler != undefined) {
    window.parent.parent.navigationHandler.addTab(tabId, tabTitle, url, closable);
  } else if (window.parent.parent.parent !== undefined && window.parent.parent.parent.navigationHandler != undefined) {
    window.parent.parent.parent.navigationHandler.addTab(tabId, tabTitle, url, closable);
  } else {
    alert('unsupported !!!');
  }
}
TabManager.openWindow = function (tabId, tabTitle, url, callback) {
  var features = "dialogWidth:1000px;dialogHeight:570px;scrollbars:yes;status:no;help:no;resizable:1;";
  var href = url + '&title=' + tabTitle
  var rtn = openModalDialogWindow(href, window, features, function (rtnc) {
    if (null != rtnc && typeof callback === 'function') {
      callback(rtnc[0]);
      return rtnc.length;
    }
  });
  if (null != rtn && typeof callback === 'function') {
    callback(rtn[0]);
    return rtn.length;
  }
}


function openModalDialogWindow(URL, winObj, features, callback) {
  if (null == features) {
    features = "dialogWidth:1050px;dialogHeight:530px;scrollbars:yes;status:no;help:no;resizable:1;";
  }
  var userAgent = window.navigator.userAgent.toLowerCase();
  if (Ext.isIE || userAgent.indexOf("firefox") >= 1) {
    var a = window.showModalDialog(URL, winObj, features);
    return returnValueRemoveNbsp(a);
  } else if (userAgent.indexOf("chrome") >= 1) {
    var w = window.open(URL, winObj, features);
    if (typeof(callback) != undefined && callback != null) {
      var t1 = setInterval(function () {
        if (w.closed == true) {
          callback(getChromeReturnValue());
          window.clearInterval(t1);
        }
      }, 500);
    }
    return null; //防止意外出错
  }
}

function getChromeReturnValue() {
  return returnValueRemoveNbsp(window.returnValue);
}

function windowReturnValue(value) {
  var userAgent = window.navigator.userAgent.toLowerCase();
  if (Ext.isIE || userAgent.indexOf("firefox") >= 1) {
    window.returnValue = value;
  } else if (userAgent.indexOf("chrome") >= 1) {
    window.opener.returnValue = value;
  }
}

function returnValueRemoveNbsp(returnValue) {
  if (typeof(returnValue) != undefined && returnValue != null) {
    //只对第一次returnvalue做处理
    //只对存量的数组返回做定义
    if (typeof(returnValue) == 'object') {
      if (Ext.isArray(returnValue)) {
        var newArrayValue = [];
        for (var i = 0; i < returnValue.length; i++) {
          if (typeof(returnValue[i]) == 'object') {
            newArrayValue[i] = removeNbspObject(returnValue[i]);
          } else {
            newArrayValue[i] = returnValue[i];
          }
        }
        return newArrayValue;
      } else {
        return removeNbspObject(returnValue);
      }
    }
  }
  return returnValue;
}

function removeNbspObject(returnValue) {
  var parseReturnValue = {};
  for (var a in returnValue) {
    var paramValue = returnValue[a];
    if (typeof(paramValue) == 'string') {
      paramValue = removeNbsp(paramValue);
    }
    parseReturnValue[a] = paramValue;
  }
  return parseReturnValue;
}

function removeNbsp(text) {
  if (text != null)
    text = replaceAll(text, "&nbsp", " ");
  return text;
}

function replaceAll(streng, soeg, erstat) {
  var st = streng;
  if (soeg.length == 0)
    return st;
  var idx = st.indexOf(soeg);
  while (idx >= 0) {
    st = st.substring(0, idx) + erstat + st.substr(idx + soeg.length);
    idx = st.indexOf(soeg);
  }
  return st;
}

function processDataError(data) {
  if (data.status && data.message) {
    Ext.Msg.alert('业务异常: ' + data.status, data.message);
  }
}

function processResponseError(response) {
  var result;
  if (response.responseText) {
    try {
      result = Ext.util.JSON.decode(response.responseText);
    } catch (e) {
    }
  }
  result = result || {};
  if (response.status === 403) {
    Ext.Msg.alert('系统异常: ' + response.status, result.message + '; 请重新登录!', function () {
      window.location.href = WEB_ROOT + "/login";
    });
  } else {
    if (result.message) {
      Ext.Msg.alert('系统异常: ' + response.status, result.message);
    } else {
      Ext.Msg.alert('系统异常: ' + response.status, response.statusText);
    }
  }
}

$(window).resize(function () {
  if (this.resizeTO) clearTimeout(this.resizeTO);
  this.resizeTO = setTimeout(function () {
    $(this).trigger('resized');
  }, 500);
});

/**
 * tabs handler
 */
var tabchange = function (from, to) {
  var id = to.getId();
  var href = id.substr(7).replace(/_/g, '/');
  var current_href = window.location.pathname.substr(WEB_ROOT.length);
  if (current_href !== href) {
    page.show(WEB_ROOT + href, undefined, false, true);
  }
};

var wrapper = function (fn) {
  return function () {
    var tabs = Ext.getCmp('ext-content-tab');
    tabs.un('tabchange', tabchange);
    fn.apply(this, arguments);
    tabs.on('tabchange', tabchange);
  }
};

var addPanelTab = function (tabPanel, href, tabTitle, panel_initializer, closable) {
  var id = href.replace(/\//g, '_');
  var tabId = 'ext_tab' + id;
  if (!Ext.isEmpty(tabId)) {
    var items = tabPanel.items;
    if (!Ext.isEmpty(items)) {
      var itemsLength = tabPanel.items.length;
      for (var a = 0; a < itemsLength; a++) {
        var item = tabPanel.items.item(a);
        if (item.getId() == tabId) {
          tabPanel.setActiveTab(tabId);
          return;
        }
      }
    }
  }
  var p = panel_initializer(tabId);
  tabPanel.add({
    id: tabId,
    title: tabTitle,
    closable: closable === undefined ? true : closable,
    layout: 'border',
    items: [p]
  }).show();
};


var DefaultGridPanel = Ext.extend(Ext.grid.GridPanel, {
  constructor: function (config) {
    var self = this;
    this._datasource = config.datasource;
    this._selectionChange = config.selectionChange;

    var selectionModel = new Ext.grid.CheckboxSelectionModel({
      listeners: {
        'selectionchange': function (sm) {
          if (typeof self._selectionChange === 'function') {
            self._selectionChange(sm);
          }
        }
      }
    });
    var column_items = [
      new Ext.grid.RowNumberer({header: '#', width: 35}),
      selectionModel
    ];
    var reader_fields = [];
    for (var i = 0; i < this._datasource.response.columns.length; i++) {
      var column = this._datasource.response.columns[i];
      if (column.primaryKey) {
        self._primaryKey = column.fieldName;
      } else if (column.foreignKey) {

      } else {
        var column_item = {};
        if (column.fieldTitle) {
          column_item['header'] = column.fieldTitle;
        }
        if (column.fieldName) {
          column_item['dataIndex'] = column.fieldName;
        }
        if (column.fieldWidth) {
          column_item['width'] = column.fieldWidth;
        }
        if (typeof column.renderer === 'function') {
          column_item['renderer'] = column.renderer;
        }
        if (column.align) {
          column_item['align'] = column.align;
        }
        column_items.push(column_item)
      }
      reader_fields.push({
        name: column.fieldName,
        mapping: column.dataName
      });
    }
    var autoLoad = true;
    if (config.autoLoad !== undefined) {
      autoLoad = config.autoLoad;
    }
    var ds = new Ext.data.Store({
      proxy: new Ext.data.HttpProxy({
        headers: {
          'Authorization': 'Bearer ' + getToken()
        },
        url: self._datasource.url,
        method: self._datasource.method
      }),
      reader: new Ext.data.JsonReader({
        idProperty: self._primaryKey,
        root: self._datasource.response.rootField,
        totalProperty: self._datasource.response.totalField,
        fields: reader_fields
      }),
      autoLoad: autoLoad,
      listeners: {
        beforeload: function (store, options) {
          if (typeof self.storeBeforeLoad === 'function') {
            self.storeBeforeLoad(store, options);
          }
        },
        load: function () {
          if (self.rendered)
            self.autoSizeColumns();
        },
        exception: function (proxy, type, action, options, response) {
          processResponseError(response);
        }
      }
    });

    var cm = new Ext.grid.ColumnModel({
      columns: column_items,
      defaults: {
        sortable: true
      }
    });
    this.storeBeforeLoad = config.storeBeforeLoad;
    var bbar;
    if (self._datasource.response.pageable) {
      var pageSize = config.pageSize || 20;
      bbar = new Ext.PagingToolbar({
        pageSize: pageSize,
        store: ds,
        displayInfo: true,
        displayMsg: '显示 {0} - {1} of {2}',
        emptyMsg: "没有数据"
      });
    }
    config = Ext.apply({
      border: false,
      ds: ds,
      cm: cm,
      sm: selectionModel,
      autoScroll: true,
      stripeRows: true,
      loadMask: true,
      bbar: bbar
    }, config);

    DefaultGridPanel.superclass.constructor.call(this, config);
  },
  selected: function () {
    return this.getSelectionModel().getSelected();
  },
  selection: function () {
    return this.getSelectionModel().getSelections();
  },
  reload: function () {
    this.getStore().reload();
  },
  primaryKey: function () {
    return this._primaryKey;
  }
});

var DefaultCriteriaFormPanel = Ext.extend(Ext.form.FormPanel, {
  constructor: function (config) {
    this._criteria = config.criteria;
    var items = [];
    for (var i = 0; i < this._criteria.length; i++) {
      var ci = this._criteria[i];
      if (typeof ci.renderer === 'function') {
        var item = ci.renderer(self);
        if (item) {
          items.push(item);
        }
      } else if (ci.fieldType === 'string') {
        items.push({
          xtype: 'textfield',
          fieldLabel: ci.fieldTitle,
          name: ci.fieldName
        })
      }
    }
    var height = 4 + 36 * parseInt((items.length + 2) / 3);
    if (height > 112) {
      height = 112;
    }
    config = Ext.apply({
      layout: 'tableform',
      autoScroll: true,
      border: false,
      frame: true,
      split: true,
      margins: '1 1 1 1',
      collapseMode: 'mini',
      height: height,
      minSize: height,
      maxSize: 400,
      labelWidth: 100,
      labelAlign: 'right',
      defaults: {
        anchor: '90%',
        xtype: 'textfield'
      },
      layoutConfig: {
        columns: 3
      },
      items: items,
    }, config);
    DefaultCriteriaFormPanel.superclass.constructor.call(this, config);
  },
  getFieldValues: function (dirtyOnly) {
    var o = {},
      self = this,
      n,
      val;
    this.getForm().items.each(function (f) {
      if (!f.disabled && (dirtyOnly !== true || f.isDirty())) {
        n = f.getName();
        if (n.indexOf('field_') === 0) {
          n = n.substr(6);
        }
        val = f.getValue();
        if (f.getXType() === 'datefield' && Ext.isDate(val)) {
          val = val.dateFormat(f.format);
          self.appendValue(o, n, val);
        } else if (f.getXType() === 'compositefield') {
          if (f.fieldType === 'number_between') {
            var begin = f.items.get(0),
              end = f.items.get(2),
              geN = n + '_Ge',
              geVal = begin.getValue(),
              leN = n + '_Le',
              leVal = end.getValue();
            if (geVal !== '') {
              self.appendValue(o, geN, geVal);
            }
            if (leVal !== '') {
              self.appendValue(o, leN, leVal);
            }
          } else if (f.fieldType === 'date_between') {
            var begin = f.items.get(0),
              end = f.items.get(2),
              geN = n + '_Ge',
              geVal = begin.getValue(),
              leN = n + '_Le',
              leVal = end.getValue();
            if (Ext.isDate(geVal)) {
              geVal = geVal.dateFormat(begin.format);
            }
            if (Ext.isDate(leVal)) {
              leVal = leVal.dateFormat(end.format);
            }
            if (geVal)
              self.appendValue(o, geN, geVal);
            if (leVal)
              self.appendValue(o, leN, leVal);
          } else if (f.fieldType === 'text_like') {
            var text = f.items.get(0),
              textVal = text.getValue(),
              textN = n,
              btn = Ext.getCmp(n + '_Like');
            if (btn && btn.getText() === '模糊') {
              textN += '_Like';
            }
            self.appendValue(o, textN, textVal);
          }
        } else {
          self.appendValue(o, n, val);
        }

      }
    });
    return o;
  },
  appendValue: function (o, n, val) {
    var key = o[n];
    if (Ext.isDefined(key)) {
      if (Ext.isArray(key)) {
        o[n].push(val);
      } else {
        o[n] = [key, val];
      }
    } else {
      o[n] = val;
    }
  }
});

var DefaultListViewPanel = Ext.extend(Ext.Panel, {
  constructor: function (config) {
    var self = this;
    this._datasource = config.datasource;
    this._criteriaForm = new DefaultCriteriaFormPanel({
      region: 'north',
      criteria: this._datasource.request.criteria
    });
    this._grid = new DefaultGridPanel({
      region: 'center',
      autoLoad: config.autoLoad,
      pageSize: config.pageSize,
      datasource: {
        url: this._datasource.url,
        method: this._datasource.method,
        response: this._datasource.response
      },
      storeBeforeLoad: function (store, options) {
        var params = self._criteriaForm.getFieldValues();
        if (typeof config.appendCriteriaParam === 'function') {
          config.appendCriteriaParam(params);
        }
        store.baseParams = params;
      }
    });
    var tbar;
    if (typeof config.toolbarHandler === 'function') {
      this._toolbarHandler = config.toolbarHandler(self._grid, self._criteriaForm);
      tbar = this._toolbarHandler.toolbar();
    }
    config = Ext.apply({
      border: false,
      layout: 'border',
      region: 'center',
      tbar: tbar,
      items: [self._grid, self._criteriaForm]
    }, config);
    DefaultListViewPanel.superclass.constructor.call(this, config);
  },
  getGrid: function () {
    return this._grid;
  }
});

var DefaultFormPanel = Ext.extend(Ext.form.FormPanel, {
  constructor: function (config) {
    var self = this;
    var readOnly = !!config.readOnly;
    this._datasource = config.datasource;
    this._btnSave = new Ext.Button({
      text: '&nbsp;<i class="fa fa-floppy-o" aria-hidden="true"></i>  保  存&nbsp;',
      handler: function () {
        self.save();
      }
    });
    this._btnReload = new Ext.Button({
      text: '&nbsp;<i class="fa fa-refresh" aria-hidden="true"></i>  刷  新&nbsp;',
      handler: function () {
        var f = self.getForm().findField(self._primaryKeyField);
        var id = f.getValue();
        if (id) {
          self.load(id);
        }
      }
    });

    var buttons;
    if (!readOnly) {
      buttons = [self._btnSave, self._btnReload];
    }


    var hiddenItems = [];
    var items = [];
    var reader_fields = [];
    for (var i = 0; i < this._datasource.response.columns.length; i++) {
      var column = this._datasource.response.columns[i];
      if (column.primaryKey) {
        self._primaryKey = column.dataName;
        self._primaryKeyField = column.fieldName;
        hiddenItems.push({
          xtype: 'hidden',
          name: column.fieldName
        })
      } else if (typeof column.renderer === 'function') {
        var item = column.renderer(self);
        if (item) {
          items.push(item);
        }
      } else if (column.fieldType === 'string') {
        items.push({
          xtype: 'textfield',
          fieldLabel: column.fieldTitle,
          name: column.fieldName,
          readOnly: column.readOnly || readOnly,
          disabled: column.readOnly || readOnly,
          listeners: {
            'change': function () {
              self.change();
            }
          }
        })
      } else if (column.fieldType === 'hidden') {
        hiddenItems.push({
          xtype: 'hidden',
          name: column.fieldName
        })
      }
      reader_fields.push({
        name: column.fieldName,
        mapping: column.dataName
      });
    }

    var allItems = items.concat(hiddenItems);
    config = Ext.apply({
      layout: 'tableform',
      autoScroll: true,
      frame: true,
      labelWidth: 150,
      labelAlign: 'right',
      defaults: {
        anchor: '90%',
        xtype: 'textfield'
      },
      layoutConfig: {
        columns: 2
      },
      reader: new Ext.data.JsonReader({
        idProperty: self._primaryKey,
        root: self._datasource.response.rootField,
        fields: reader_fields
      }),
      items: allItems,
      buttonAlign: 'center',
      buttons: buttons
    }, config);
    DefaultFormPanel.superclass.constructor.call(this, config);
  },
  getFieldValues: function (dirtyOnly) {
    var o = {},
      n,
      key,
      val;
    this.getForm().items.each(function (f) {
      if (!f.disabled && (dirtyOnly !== true || f.isDirty())) {
        n = f.getName();
        if (n.indexOf('field_') == 0) {
          n = n.substr(6);
        }
        key = o[n];
        val = f.getValue();
        if (f.getXType() == 'datefield' && Ext.isDate(val)) {
          val = val.dateFormat(f.format);
        }

        if (Ext.isDefined(key)) {
          if (Ext.isArray(key)) {
            o[n].push(val);
          } else {
            o[n] = [key, val];
          }
        } else {
          o[n] = val;
        }
      }
    });
    return o;
  },
  load: function (id, callback) {
    var self = this;
    this._btnSave.setDisabled(true);
    var params = {};
    params[self._primaryKey] = id;
    this.getForm().load({
      url: self._datasource.url,
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      method: self._datasource.method,
      params: params,
      waitMsg: 'Loading',
      success: callback,
      failure: function (form, action) {
        processResponseError(action.response);
      }
    });
  },
  change: function () {
    this._btnSave.setDisabled(false);
  },
  reset: function () {
    this._btnSave.setDisabled(false);
    this.getForm().reset();
  },
  save: function () {
    var self = this;
    var param = this.getFieldValues();
    param = Ext.apply(param, csrf_params);
    LoadMask.show();
    $.ajax({
      url: this._datasource.saveUrl,
      headers: {
        'Authorization': 'Bearer ' + getToken()
      },
      data: param,
      cache: false,
      method: 'POST',
      success: function (data) {
        LoadMask.hide();
        if (data.status === 200) {
          if (self.onSave && typeof self.onSave === 'function') {
            self.load(data[self._primaryKey], self.onSave);
          } else if (data.message !== undefined) {
            self.load(data[self._primaryKey], function () {
              Ext.Msg.alert('提示', data.message);
            });
          }
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
  }
});


var DefaultEditPanel = Ext.extend(Ext.Panel, {
  constructor: function (config) {
    var self = this;
    this._userForm = new DefaultFormPanel({
      region: 'center',
      readOnly: config.readOnly,
      datasource: config.datasource
    });

    config = Ext.apply({
      border: false,
      layout: 'border',
      region: 'center',
      margins: '2 2 2 2',
      items: [this._userForm]
    }, config);
    DefaultEditPanel.superclass.constructor.call(this, config);
    this._entityId = config.entityId;
  },
  load: function (callback) {
    if (this._entityId) {
      this._userForm.load(this._entityId, callback);
    }
  }
});