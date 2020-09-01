var MetadataUploadFormPanel = Ext.extend(Ext.form.FormPanel, {
  constructor: function (config) {
    var self = this;

    var allItems = [{
      xtype: 'fileuploadfield',
      emptyText: "请选择元数据EXCEL",
      fieldLabel: "请选择元数据EXCEL",
      name: 'metadataFile',
      buttonText: '&nbsp;<i class="fa fa-file-excel-o" aria-hidden="true"></i>&nbsp;'
    }];
    config = Ext.apply({
      layout: 'tableform',
      fileUpload: true,
      autoScroll: true,
      frame: true,
      labelWidth: 150,
      labelAlign: 'right',
      defaults: {
        anchor: '90%',
        xtype: 'textfield'
      },
      layoutConfig: {
        columns: 1
      },
      items: allItems
    }, config);
    MetadataUploadFormPanel.superclass.constructor.call(this, config);
  }
});