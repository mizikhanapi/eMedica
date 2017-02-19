<%-- 
    Document   : CIS020002
    Created on : Jan 31, 2017, 10:00:06 AM
    Author     : -D-
--%>

<%

    String column = "physical_exam_cd, physical_exam_name, status";
    String table = "cis_physical_exam_system";
    String sqlpe0 = "SELECT " + column + " FROM " + table + " ";
    ArrayList<ArrayList<String>> datape0 = Conn.getData(sqlpe0);

    String column1 = "pe_1_cd, pe_1_name, physical_exam_cd, status";
    String table1 = "cis_pe_1";
    String sqlpe1 = "SELECT " + column1 + " FROM " + table1 + " ";
    ArrayList<ArrayList<String>> datape1 = Conn.getData(sqlpe1);

    String column2 = "pe_2_cd, pe_2_name, pe_1_cd, status";
    String table2 = "cis_pe_2";
    String sqlpe2 = "SELECT " + column2 + " FROM " + table2 + " ";
    ArrayList<ArrayList<String>> datape2 = Conn.getData(sqlpe2);

    String column3 = "pe_3_cd, pe_3_name, pe_2_cd, status";
    String table3 = "cis_pe_3";
    String sqlpe3 = "SELECT " + column3 + " FROM " + table3 + " ";
    ArrayList<ArrayList<String>> datape3 = Conn.getData(sqlpe3);

    String column4 = "pe_4_cd, pe_4_name, pe_3_cd, status";
    String table4 = "cis_pe_4";
    String sqlpe4 = "SELECT " + column4 + " FROM " + table4 + " ";
    ArrayList<ArrayList<String>> datape4 = Conn.getData(sqlpe4);

    String column5 = "pe_5_cd, pe_5_name, pe_4_cd, status";
    String table5 = "cis_pe_5";
    String sqlpe5 = "SELECT " + column5 + " FROM " + table5 + " ";
    ArrayList<ArrayList<String>> datape5 = Conn.getData(sqlpe5);

    String column6 = "pe_6_cd, pe_6_name, pe_5_cd, status";
    String table6 = "cis_pe_6";
    String sqlpe6 = "SELECT " + column6 + " FROM " + table6 + " ";
    ArrayList<ArrayList<String>> datape6 = Conn.getData(sqlpe6);

    String column7 = "pe_7_cd, pe_7_name, pe_6_cd, status";
    String table7 = "cis_pe_7";
    String sqlpe7 = "SELECT " + column7 + " FROM " + table7 + " ";
    ArrayList<ArrayList<String>> datape7 = Conn.getData(sqlpe7);

    String column8 = "pe_8_cd, pe_8_name, pe_7_cd, status";
    String table8 = "cis_pe_8";
    String sqlpe8 = "SELECT " + column8 + " FROM " + table8 + " ";
    ArrayList<ArrayList<String>> datape8 = Conn.getData(sqlpe8);


%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">



<!-- Modal -->
<div class="modal fade" id="CIS020009" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">—</span><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Physical Exam</h3>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <select name="pe0" id="pe0" class="form-control input-lg">
                        <option value="">-Select Physical Examination-</option>
                        <%                                for (int i = 0; i < datape0.size(); i++) {
                        %>
                        <option value="<%out.print(datape0.get(i).get(0));%>"><%out.print(datape0.get(i).get(1));%></option>
                        <%
                            }
                        %>

                    </select>
                </div>
                <div class="form-group">
                    <div id="divpe1"></div>
                </div>
                <div class="form-group">
                    <input type="text" name="pe1" id="pe1" class="form-control input-lg" placeholder="" tabindex="4">
                </div>

                <div class="form-group">
                    <input type="text" name="pe2" id="pe2" class="form-control input-lg" placeholder="" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="text" name="pe3" id="pe3" class="form-control input-lg" placeholder="" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="text" name="pe4" id="pe4" class="form-control input-lg" placeholder="" tabindex="4">
                </div>

                <div class="form-group">
                    <input type="text" name="pe5" id="pe5" class="form-control input-lg" placeholder="" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="text" name="pe6" id="pe6" class="form-control input-lg" placeholder="" tabindex="4">
                </div>

                <div class="form-group">
                    <input type="text" name="pe7" id="pe7" class="form-control input-lg" placeholder="" tabindex="4">
                </div>
                <div class="form-group">
                    <input type="text" name="pe8" id="pe8" class="form-control input-lg" placeholder="" tabindex="4">
                </div>



                <div class="form-group">
                    <input type="hidden"  id="idPE" class="form-control input-lg" placeholder="Comment." tabindex="3">
                </div>

                <div class="form-group">
                    <textarea type="text" name="display_name" id="PEComment" class="form-control input-lg" placeholder="Comment." tabindex="3"></textarea>
                </div>

            </div>
            <div class="modal-footer" id="updatePE">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg"  id="updatePEBtn" role="button">Update</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer" id="actionPE">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg"  id="accpetPEBtn" role="button">Accept</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-danger btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {


        function pe1() {
            $('#pe2').val("");
            $.ajax({
                url: 'CIS02/CIS020009_2.jsp',
                timeout: 10000,
                data: {input2: Pe2Cd[itemIDpe2]},
                success: function (result) {
                    console.log(result);
                    if (result.trim() === "none") {

                        Pe4Cd = [];
                        Pe5Cd = [];
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];


                        Pe4Desc = [];
                        Pe5Desc = [];
                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe2').hide();
                        $('#pe3').hide();
                        $('#pe4').hide();
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        
                      $('#pe2').val('');
                        $('#pe3').val('');
                        $('#pe4').val('');
                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');

                    } else {
                        $('#pe2').show();
                        result = result.split("!");
                        var code = result[1];
                        Pe3Cd = code.split('|');
                        var desc = result[0];
                        Pe3Desc = desc.split('|');
                        console.log(Pe3Cd);
                        console.log(Pe3Desc);
                        $("#pe2").autocomplete('option', 'source', Pe3Desc);
                        Pe4Cd = [];
                        Pe5Cd = [];
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];


                        Pe4Desc = [];
                        Pe5Desc = [];
                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe3').hide();
                        $('#pe4').hide();
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        
                                                $('#pe3').val('');
                        $('#pe4').val('');
                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    }
                }
            });

        }


        function pe2() {
            $('#pe3').val("");
            $.ajax({
                url: 'CIS02/CIS020009_3.jsp',
                timeout: 10000,
                data: {input3: Pe3Cd[itemIDpe3]},
                success: function (result) {
                    if (result.trim() === "none") {

                        Pe5Cd = [];
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe5Desc = [];
                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];


                        $('#pe3').hide();
                        $('#pe4').hide();
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        
                                                $('#pe3').val('');
                        $('#pe4').val('');
                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    } else {
                        $('#pe3').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe4Cd = code.split('|');
                        var desc = result[0];
                        Pe4Desc = desc.split('|');
                        console.log(Pe4Cd);
                        console.log(Pe4Desc);
                        $("#pe3").autocomplete('option', 'source', Pe4Desc);

                        Pe5Cd = [];
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];



                        Pe5Desc = [];
                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe4').hide();
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        
         
                        $('#pe4').val('');
                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    }
                }
            });
        }

        function pe3() {
            $('#pe4').val('');
            $.ajax({
                url: 'CIS02/CIS020009_4.jsp',
                timeout: 10000,
                data: {input4: Pe4Cd[itemIDpe4]},
                success: function (result) {
                    if (result.trim() === "none") {
                        Pe5Cd = [];
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe5Desc = [];
                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];



                        $('#pe4').hide();
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        
                              
                        $('#pe4').val('');
                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    } else {
                        console.log(result);
                        $('#pe4').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe5Cd = code.split('|');
                        var desc = result[0];
                        Pe5Desc = desc.split('|');
                        console.log(Pe5Cd);
                        console.log(Pe5Desc);
                        $("#pe4").autocomplete('option', 'source', Pe5Desc);

                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];
                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        

                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    }
                }
            });

        }

        function pe4() {
            $('#pe5').val('');
            $.ajax({
                url: 'CIS02/CIS020009_5.jsp',
                timeout: 10000,
                data: {input5: Pe5Cd[itemIDpe5]},
                success: function (result) {

                    if (result.trim() === "none") {
                        Pe6Cd = [];
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe6Desc = [];
                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe5').hide();
                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();

                        $('#pe5').val('');
                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    } else {
                        $('#pe5').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe6Cd = code.split('|');
                        var desc = result[0];
                        Pe6Desc = desc.split('|');
                        console.log(Pe6Cd);
                        console.log(Pe6Desc);
                        $("#pe5").autocomplete('option', 'source', Pe6Desc);

                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        

                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    }
                }
            });
        }

        function pe5() {
            $('#pe6').val('');
            $.ajax({
                url: 'CIS02/CIS020009_6.jsp',
                timeout: 10000,
                data: {input: Pe6Cd[itemIDpe6]},
                success: function (result) {
                    if (result.trim() === "none") {
                        Pe7Cd = [];
                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe7Desc = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe6').hide();
                        $('#pe7').hide();
                        $('#pe8').hide();
                        

                        $('#pe6').val('');
                        $('#pe7').val('');
                        $('#pe8').hide('');
                    } else {
                        $('#pe6').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe7Cd = code.split('|');
                        var desc = result[0];
                        Pe7Desc = desc.split('|');
                        console.log(Pe7Cd);
                        console.log(Pe7Desc);
                        $("#pe6").autocomplete('option', 'source', Pe7Desc);

                        Pe8Cd = [];
                        Pe9Cd = [];

                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#divpe7').hide();
                        $('#divpe8').hide();
                        

                        $('#pe7').val('');
                        $('#pe8').hide('');
                    }

                }

            });
        }

        function pe6() {
            $('#pe7').val('');
            $.ajax({
                url: 'CIS02/CIS020009_7.jsp',
                timeout: 10000,
                data: {input: Pe7Cd[itemIDpe7]},
                success: function (result) {

                    if (result.trim() === "none") {
                        Pe8Cd = [];
                        Pe9Cd = [];
                        Pe8Desc = [];
                        Pe9Desc = [];

                        $('#pe7').hide();
                        $('#pe8').hide();
                        

                        $('#pe7').val('');
                        $('#pe8').hide('');
                    } else {
                        $('#pe7').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe8Cd = code.split('|');
                        var desc = result[0];
                        Pe8Desc = desc.split('|');
                        console.log(Pe8Cd);
                        console.log(Pe8Desc);
                        $("#pe7").autocomplete('option', 'source', Pe8Desc);
                        Pe9Cd = [];
                        Pe9Desc = [];
                    }
                }
            });
        }

        function pe7() {
            $('#pe8').val('');
            $.ajax({
                url: 'CIS02/CIS020009_8.jsp',
                timeout: 10000,
                data: {input8: Pe8Cd[itemIDpe9]},
                success: function (result) {

                    if (result.trim() === "none") {

                        Pe9Cd = [];

                        Pe9Desc = [];

                    } else {
                        $('#pe8').show();
                        console.log(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe9Cd = code.split('|');
                        var desc = result[0];
                        Pe9Desc = desc.split('|');
                        console.log(Pe9Cd);
                        console.log(Pe9Desc);
                        $("#pe8").autocomplete('option', 'source', Pe9Desc);

                        $('#divpe8').show();
                        $('#divpe8').html(result);
                    }
                }
            });
        }

        $('#pe2').hide();
        $('#pe3').hide();
        $('#pe4').hide();
        $('#pe5').hide();
        $('#pe6').hide();
        $('#pe7').hide();
        $('#pe8').hide();

        var Pe2Cd = [];
        var Pe3Cd = [];
        var Pe4Cd = [];
        var Pe5Cd = [];
        var Pe6Cd = [];
        var Pe7Cd = [];
        var Pe8Cd = [];
        var Pe9Cd = [];

        var Pe2Desc = [];
        var Pe3Desc = [];
        var Pe4Desc = [];
        var Pe5Desc = [];
        var Pe6Desc = [];
        var Pe7Desc = [];
        var Pe8Desc = [];
        var Pe9Desc = [];


        var itemIDpe2 = "";
        var itemIDpe3 = "";
        var itemIDpe4 = "";
        var itemIDpe5 = "";
        var itemIDpe6 = "";
        var itemIDpe7 = "";
        var itemIDpe8 = "";
        var itemIDpe9 = "";

        $('#pe1').autocomplete({source: Pe2Desc, select: function (e, ui) {
                pe1();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe2').autocomplete({source: Pe3Desc, select: function (e, ui) {
                pe2();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe3').autocomplete({source: Pe4Desc, select: function (e, ui) {
                pe3();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe4').autocomplete({source: Pe5Desc, select: function (e, ui) {
                pe4();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe5').autocomplete({source: Pe6Desc, select: function (e, ui) {
                pe5();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe6').autocomplete({source: Pe7Desc, select: function (e, ui) {
                pe6();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe7').autocomplete({source: Pe8Desc, select: function (e, ui) {
                pe7();
            }}, "option", "appendTo", ".eventInsForm");
        $('#pe8').autocomplete({source: Pe9Desc, select: function (e, ui) {
                pe8();
            }}, "option", "appendTo", ".eventInsForm");


        $('#pe1').on('autocompleteselect', function (e, ui) {
            itemIDpe2 = Pe2Desc.indexOf(ui.item.value);
            pitemIDpe1 = Pe2Cd[itemIDpe2];
            console.log(Pe2Cd[itemIDpe2]);
            $('#idPE').val();
        });
        $('#pe2').on('autocompleteselect', function (e, ui) {
            itemIDpe3 = Pe3Desc.indexOf(ui.item.value);
            pitemIDpe2 = Pe3Cd[itemIDpe3];
            console.log(Pe3Cd[itemIDpe3]);
        });
        $('#pe3').on('autocompleteselect', function (e, ui) {
            itemIDpe4 = Pe4Desc.indexOf(ui.item.value);
            pitemIDpe3 = Pe4Cd[itemIDpe4];
            console.log(Pe4Cd[itemIDpe4]);
        });
        $('#pe4').on('autocompleteselect', function (e, ui) {
            itemIDpe5 = Pe5Desc.indexOf(ui.item.value);
            pitemIDpe4 = Pe5Cd[itemIDpe5];
            console.log(Pe5Cd[itemIDpe5]);
        });
        $('#pe5').on('autocompleteselect', function (e, ui) {
            itemIDpe6 = Pe6Desc.indexOf(ui.item.value);
            pitemIDpe5 = Pe6Cd[itemIDpe6];
            console.log(Pe6Cd[itemIDpe6]);
        });
        $('#pe6').on('autocompleteselect', function (e, ui) {
            itemIDpe7 = Pe7Desc.indexOf(ui.item.value);
            pitemIDpe6 = Pe7Cd[itemIDpe7];
            console.log(Pe7Cd[itemIDpe7]);
        });
        $('#pe7').on('autocompleteselect', function (e, ui) {
            itemIDpe8 = Pe8Desc.indexOf(ui.item.value);
            pitemIDpe7 = Pe8Cd[itemIDpe8];
            console.log(Pe8Cd[itemIDpe8]);
        });
        $('#pe8').on('autocompleteselect', function (e, ui) {
            itemIDpe9 = Pe9Desc.indexOf(ui.item.value);
            pitemIDpe7 = Pe9Cd[itemIDpe9];
            console.log(Pe9Cd[itemIDpe9]);
        });
        $('#pe8').on('change keydown', function (e) {
            pe8();
            
        });
        $('#pe7').on('change keydown', function (e) {
            pe7();
        });
        $('#pe6').on('change keydown', function (e) {
            pe6();
        });

        $('#pe5').on('change keydown', function (e) {
            pe5();
        });
        $('#pe4').on('change keydown', function (e) {
            pe4();
        });
        $('#pe3').on('change keydown', function (e) {
            pe3();
        });

        $('#pe2').on('change keydown', function (e) {
            pe2();
            

        });

        $('#pe1').on('change keydown ', function (e) {
            pe1();
        });

        $('#pe0').on('change', function (e) {
            $('#pe1').val("");
            $('#pe2').hide();
            pitemIDpe0 = $('#pe0 option:selected').val();
            $.ajax({
                url: 'CIS02/CIS020009_1.jsp',
                timeout: 10000,
                data: {input: $('#pe0 option:selected').val()},
                success: function (result) {
                    console.log(result);
                    if (result.trim() === "none") {
                        $('#divpe1').hide();
                        $('#divpe2').hide();
                        $('#divpe3').hide();
                        $('#divpe4').hide();
                        $('#divpe5').hide();
                        $('#divpe6').hide();
                        $('#divpe7').hide();
                        $('#divpe8').hide();

                    } else {
                        $('#divpe1').show();
                        //$('#divpe1').html(result);
                        result = result.split("!");
                        var code = result[1];
                        Pe2Cd = code.split('|');
                        var desc = result[0];
                        Pe2Desc = desc.split('|');
                        console.log(Pe2Cd);
                        console.log(Pe2Desc);
                        $("#pe1").autocomplete('option', 'source', Pe2Desc);

                        $('#divpe2').hide();
                        $('#divpe3').hide();
                        $('#divpe4').hide();
                        $('#divpe5').hide();
                        $('#divpe6').hide();
                        $('#divpe7').hide();
                        $('#divpe8').hide();
                    }
                }

            });
        });

        $('#divpe1').on('change', '#pe1', function (e) {
            //alert($('#pe1 option:selected').val());
            $.ajax({
                url: 'CIS02/CIS020009_2.jsp',
                timeout: 10000,
                data: {input2: $('#pe1 option:selected').val()},
                success: function (result) {
                    console.log(result);
                    if (result.trim() === "none") {
                        $('#divpe1').hide();
                        $('#divpe2').hide();
                        $('#divpe3').hide();
                        $('#divpe4').hide();
                        $('#divpe5').hide();
                        $('#divpe6').hide();
                        $('#divpe7').hide();
                        $('#divpe8').hide();

                    } else {
                        $('#divpe2').show();
                        $('#divpe2').html(result);

                        $('#divpe3').hide();
                        $('#divpe4').hide();
                        $('#divpe5').hide();
                        $('#divpe6').hide();
                        $('#divpe7').hide();
                        $('#divpe8').hide();
                    }

                }

            });
        });

    });

</script>