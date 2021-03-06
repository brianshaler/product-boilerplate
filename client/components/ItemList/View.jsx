/** @jsx React.DOM */
define(function(require){
  var cx = React.addons.classSet;

  var ItemList = React.createClass({
    getDefaultProps: function () {
      return {
        perRow: 'three',
        stackable: true
      };
    },

    render: function() {
      var classes = cx({
        ui: true,
        items: true,
        stackable: this.props.stackable,
        connected: this.props.connected
      });
      classes += ' ' + this.props.perRow;

      return this.transferPropsTo(
        <div className={classes}>
          {this.props.children}
        </div>
      );
    }
  });

  return ItemList;
});