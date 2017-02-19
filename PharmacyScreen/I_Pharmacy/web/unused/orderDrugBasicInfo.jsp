<%-- 
    Document   : orderDrugBasicInfo
    Created on : Feb 13, 2017, 11:20:06 AM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4>Basic Info</h4>
    <hr/>
    <form class="form-horizontal" name="myForm2" id="myForm2">
        <div class="row">
            <div class="col-md-4">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="pmino" name="pmino" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="pname" name="pname" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-8">
                        <input id="pnic" name="pnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-8">
                        <input id="pbtype" name="pbtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Old IC No.</label>
                    <div class="col-md-8">
                        <input id="poic" name="poic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Birthday Date</label>
                    <div class="col-md-8">
                        <input id="pbdate" name="pbdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>
        </div>
    </form>
</div>