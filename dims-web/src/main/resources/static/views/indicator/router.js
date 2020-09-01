var indicatorListView = wrapper(function (ctx) {
  var tabs = Ext.getCmp('ext-content-tab');
  tabs.setActiveTab(0);

  var indicatorPanel = Ext.getCmp('ext_tab_indicator');
  var title = ctx.hash ? ctx.hash + '指标数据' : '指标数据';
  indicatorPanel.setTitle('<i class="fa fa-tachometer" aria-hidden="true"></i>  ' + title);


  var tree = Ext.getCmp('ext-indicator-nav-tree');
  var indicatorGridPanel = Ext.getCmp('ext-indicator-grid-panel');


  var folderId = ctx.params.folderId;
  var indexId = ctx.params.indexId;
  if (folderId) {
    var selected = tree.getSelectionModel().getSelectedNode();
    if (selected && selected.attributes.folderId === parseInt(folderId)
      && (!indexId || selected.attributes.indexId === parseInt(indexId))) {
      indicatorGridPanel.getGrid().getStore().load();
    } else {
      $.ajax({
        url: WEB_ROOT + '/app/v1/indicator/nav/path/' + folderId,
        headers: {
          'Authorization': 'Bearer ' + getToken()
        },
        method: 'GET',
        cache: false,
        success: function (data) {
          if (data.status == 200) {
            expandToTarget(tree, tree.root, data.data, 0, folderId, indexId);
          }
        }
      });
    }
  } else {
    var selected = tree.getSelectionModel().getSelectedNode();
    if (selected) {
      tree.getSelectionModel().unselect(selected);
    } else {
      indicatorGridPanel.getGrid().getStore().load();
    }
  }
});

function expandToTarget(tree, n, path, level, folderId, indexId) {
  n.expand(false, true, function (n) {
    if (n.childNodes) {
      for (var i = 0, len = n.childNodes.length; i < len; i++) {
        var child = n.childNodes[i];
        if (child.attributes.type === 'INDICATOR_FOLDER' && child.attributes.folderId === parseInt(folderId)) {
          if (indexId) {
            child.expand(false, true, function (c) {
              if (c.childNodes) {
                for (var gi = 0, glen = c.childNodes.length; gi < glen; gi++) {
                  var grandChild = c.childNodes[gi];
                  if (grandChild.attributes.type === 'INDICATOR_INDEX' && grandChild.attributes.indexId === parseInt(indexId)) {
                    tree.getSelectionModel().select(grandChild);
                    return;
                  }
                }
              }
            });
          } else {
            tree.getSelectionModel().select(child);
            return;
          }
        } else if (path.length > level && child.attributes.type === 'INDICATOR_FOLDER' && child.attributes.folderId === path[level]) {
          var newLevel = level + 1;
          expandToTarget(tree, child, path, newLevel, folderId, indexId);
          return;
        }
      }
    }
  })
}


var router = function () {
  page(WEB_ROOT + '/indicator', indicatorListView);
  page(WEB_ROOT + '/indicator/folder/:folderId', indicatorListView);
  page(WEB_ROOT + '/indicator/folder/:folderId/index/:indexId', indicatorListView);
  page({
    dispatch: true
  })
};