<%-- 
    Document   : testing
    Created on : Jan 16, 2017, 10:38:07 PM
    Author     : Mike Ho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file = "includes/header.html" %>
    <body>
<button id="openAddItem" type="button" class="btn btn-success modal-toggle" data-toggle="modal" data-target="#addItemList">Add Item</button>
    <div class="modal" id="addItemList" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="sd-tabs sd-tab-interaction">
                        <div class="row">
                            <ul class="nav nav-tabs col-md-12 custom-bullet">
                                <li class="active"><a data-toggle="tab" href="#tabMiscItem">Miscellaneous Item</a></li>
                                <li><a data-toggle="tab" href="#tabDrugsItem">Drugs Item</a></li>
                            </ul>
                            <div class="tab-content col-md-12">
                                <form id="tabMiscItem" class="tab-pane active" action="" method="post">
                                    <!-- Misc Item -->
                                    <div id="miscItem" ></div>
                                </form>
                                <!-- Drugs Item -->
                                <form id="tabDrugsItem" class="tab-pane">
                                    <!-- Mileage -->
                                    <div id="drugsItem" ></div>
                                </form>
                                <!-- Mileage -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="addItem" type="button" class="btn btn-success" data-dismiss="modal">Add Item</button>
                </div>
            </div>
        </div>
    </div>
    </body>

                
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#itemList tbody tr").click( function( e ) {
            if ( $(this).hasClass('row_selected') ) {
                $(this).removeClass('row_selected');
            }
            else {
                oTable.$('tr.row_selected').removeClass('row_selected');
                $(this).addClass('row_selected');
            }
        });
        
        $('.modal-toggle').click(function (e) {
            var tab = e.target.hash;
            $('li > a[href="' + tab + '"]').tab("show");
        });         
    });
</script>
</html>