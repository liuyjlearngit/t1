function MetadataHierarchyTreeHandler() {

}

MetadataHierarchyTreeHandler.prototype.treeNodeClick = function (n) {
  if (n.attributes.type === 'ENTITY_TYPE') {
    page(WEB_ROOT + '/meta/entitytype/' + n.attributes.entityTypeId);
  } else if (n.attributes.type === 'INDEX_DEFINITION') {
    page(WEB_ROOT + '/meta/index')
  } else if (n.attributes.type === 'INDEX_NAVIGATION') {
    page(WEB_ROOT + '/meta/folder')
  }
};

function IndexWinToolbarHandler(grid, criteriaForm, confirmFn, cancelFn) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
  this._confimFn = confirmFn;
  this._cancelFn = cancelFn
}

IndexWinToolbarHandler.prototype.toolbar = function () {
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
IndexWinToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

IndexWinToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};


function IndexToolbarHandler(grid, criteriaForm) {
  this._grid = grid;
  this._criteriaForm = criteriaForm;
}

IndexToolbarHandler.prototype.toolbar = function () {
  var self = this;
  return [{
    text: '&nbsp;<i class="fa fa-file-text-o" aria-hidden="true"></i>  查  看&nbsp;',
    handler: function () {
      self.view();
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
IndexToolbarHandler.prototype.reset = function () {
  this._criteriaForm.getForm().reset();
};

IndexToolbarHandler.prototype.query = function () {
  this._grid.getStore().load();
};

IndexToolbarHandler.prototype.view = function () {
  var self = this;
  var selected = self._grid.selected();
  if (!selected) {
    Ext.Msg.alert('提示', '请选择！');
    return;
  }
  var id = selected.get('field_indexId');
  page(WEB_ROOT + '/meta/index/' + id);
};