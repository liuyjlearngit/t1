var percentColors = [
  {pct: 0, color: '#FF0000'},
  {pct: 20, color: '#FF0000'},
  {pct: 40, color: '#FF1100'},
  {pct: 50, color: '#FF2300'},
  {pct: 55, color: '#FF3400'},
  {pct: 60, color: '#FF4600'},
  {pct: 64, color: '#FF5700'},
  {pct: 68, color: '#FF6900'},
  {pct: 71, color: '#FF7B00'},
  {pct: 74, color: '#FF8C00'},
  {pct: 77, color: '#FF9E00'},
  {pct: 80, color: '#FFAF00'},
  {pct: 81, color: '#FFC100'},
  {pct: 82, color: '#FFD300'},
  {pct: 83, color: '#FFE400'},
  {pct: 84, color: '#FFF600'},
  {pct: 85, color: '#F7FF00'},
  {pct: 86, color: '#E5FF00'},
  {pct: 87, color: '#D4FF00'},
  {pct: 89, color: '#C2FF00'},
  {pct: 90, color: '#B0FF00'},
  {pct: 91, color: '#9FFF00'},
  {pct: 92, color: '#8DFF00'},
  {pct: 93, color: '#7CFF00'},
  {pct: 94, color: '#6AFF00'},
  {pct: 95, color: '#58FF00'},
  {pct: 96, color: '#47FF00'},
  {pct: 97, color: '#24FF00'},
  {pct: 98, color: '#12FF00'},
  {pct: 100, color: '#00FF00'}
];

var IndicatorDataGridPanel = Ext.extend(Ext.grid.GridPanel, {
  constructor: function (config) {
    var self = this;
    this.storeBeforeLoad = config.storeBeforeLoad;
    var ds = new Ext.data.Store({
      proxy: new Ext.data.HttpProxy({
        headers: {
          'Authorization': 'Bearer ' + getToken()
        },
        url: WEB_ROOT + '/app/v1/indicator/data',
        method: 'GET'
      }),
      reader: new Ext.data.JsonReader({
        idProperty: 'taskItemIndexId',
        root: 'data',
        totalProperty: 'total',
        fields: [
          {name: 'field_taskItemIndexId', mapping: 'taskItemIndexId'},
          {name: 'field_collectionDate', mapping: 'collectionDate'},
          {name: 'field_province', mapping: 'province'},
          {name: 'field_prefecture', mapping: 'prefecture'},
          {name: 'field_county', mapping: 'county'},
          {name: 'field_code', mapping: 'code'},
          {name: 'field_name', mapping: 'name'},
          {name: 'field_amount', mapping: 'amount'},
          {name: 'field_errorAmount', mapping: 'errorAmount'},
          {name: 'field_indexValue', mapping: 'indexValue'}
        ]
      }),
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
    var sm = new Ext.grid.CheckboxSelectionModel();
    var cm = new Ext.grid.ColumnModel({
      columns: [
        new Ext.grid.RowNumberer({header: '#', width: 35}),
        sm,
        {header: '采集日期', dataIndex: 'field_collectionDate', width: 80},
        {header: '省份', dataIndex: 'field_province', width: 80},
        {header: '地市', dataIndex: 'field_prefecture', width: 80},
        {header: '区县', dataIndex: 'field_county', width: 80},
        {header: '指标编码', dataIndex: 'field_code', width: 120},
        {header: '指标名称', dataIndex: 'field_name', width: 200},
        {header: '总量', dataIndex: 'field_amount', width: 80, align: 'right'},
        {header: '错误量', dataIndex: 'field_errorAmount', width: 80, align: 'right'},
        {
          header: '指标值',
          dataIndex: 'field_indexValue',
          width: 110,
          align: 'right',
          renderer: function (value) {
            var pValue = new Number(value * 100).toFixed(2);
            var pText = pValue + '%';
            var color = '#00FF00';
            for (var i = 0; i < percentColors.length; i++) {
              if (percentColors[i].pct >= pValue) {
                color = percentColors[i].color;
                break;
              }
            }
            return '<div><div style="position:relative;display: inline-block;width: 100px;vertical-align: bottom;border: 1px solid ' + color + ';"><div style="background-color: ' + color + ';height:11px;width:' + pValue + '%"></div></div><div style="position:relative;display: inline-block;top: 0; left: 0;vertical-align: bottom;margin-left: -100px;width:100px;text-align: right">' + pText + '</div></div>';
            // return new Number(value * 100).toFixed(3) + '%';
          }
        }
      ],
      defaults: {
        sortable: true
      }
    });

    config = Ext.apply({
      border: false,
      ds: ds,
      cm: cm,
      sm: sm,
      autoScroll: true,
      stripeRows: true,
      loadMask: true
    }, config);

    IndicatorDataGridPanel.superclass.constructor.call(this, config);
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
    return 'taskItemIndexId';
  }
});

var IndicatorDataListViewPanel = Ext.extend(Ext.Panel, {
  constructor: function (config) {
    var self = this;
    this._grid = new IndicatorDataGridPanel({
      region: 'center',
      storeBeforeLoad: function (store, options) {
        var params = {};
        if (typeof config.appendCriteriaParam === 'function') {
          config.appendCriteriaParam(params);
        }
        store.baseParams = params;
      }
    });
    var tbar;
    if (typeof config.toolbarHandler === 'function') {
      this._toolbarHandler = config.toolbarHandler(self._grid);
      tbar = this._toolbarHandler.toolbar();
    }
    config = Ext.apply({
      border: false,
      layout: 'border',
      region: 'center',
      tbar: tbar,
      items: [self._grid]
    }, config);
    IndicatorDataListViewPanel.superclass.constructor.call(this, config);
  },
  getGrid: function () {
    return this._grid;
  }
});