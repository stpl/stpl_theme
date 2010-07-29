function selected_stpl_theme(obj_class_name,obj_id)
 {
    var theme_id = $('stpl_theme_theme_id').getValue();
    if (theme_id != "")
    {
      new Ajax.Request('/stpl_themes', {
          method: 'post',
          parameters: { theme_id: theme_id,themed_object_class_name: obj_class_name , themed_object_id: obj_id},
          onSuccess: function(transport) {
          if (transport.responseText == "Ok"){ window.location.reload();}
          else{ alert(transport.responseText); }
        },
          onFailure: function() {
          alert("There was an error with the connection");
        }
      });
    }
 }