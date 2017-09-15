/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
//=============fncJsBtnPlus====================================fncJsBtnPlus====================
function fncJsBtnPlus()
{
    if(document.getElementById("txtSNo").value==="")
    {
        var rowCount = document.getElementById("tblDet").rows.length;
        var row= document.getElementById("tblDet").insertRow();
        var tr = rowCount+1;
        function fncJsRowClicked()
        {
            var rowId=tr;
            document.getElementById("txtSNo").value = document.getElementById("txtSNo"+rowId).value;
            document.getElementById("txtName").value = document.getElementById("txtName"+rowId).value;
            document.getElementById("txtMobile").value = document.getElementById("txtMobile"+rowId).value;
        }
        
        var cell1= row.insertCell(0);
        var td1 = document.createElement("input");
        td1.type="text";
        td1.id="txtSNo"+tr;
        td1.value=tr;
        td1.style.width="60px";
        cell1.appendChild(td1).onclick=fncJsRowClicked;

        var cell2= row.insertCell(1);
        var td2 = document.createElement("input");
        td2.type="text";
        td2.id="txtName"+tr;
        td2.value=document.getElementById("txtName").value;
        td2.style.width="100px";
        cell2.appendChild(td2).onclick=fncJsRowClicked;

        var cell3= row.insertCell(2);
        var td3 = document.createElement("input");
        td3.type="text";
        td3.id="txtMobile"+tr;
        td3.value= document.getElementById("txtMobile").value;
        td3.style.width="100px";
        cell3.appendChild(td3).onclick=fncJsRowClicked;

        
    }
    else
    {
        tr= document.getElementById("txtSNo").value;
        document.getElementById("txtName"+tr).value=document.getElementById("txtName").value;
        document.getElementById("txtMobile"+tr).value=document.getElementById("txtMobile").value;
    }
    fncBtnPlus()
    document.getElementById("txtSNo").value="";
    document.getElementById("txtName").value="";
    document.getElementById("txtMobile").value="";
    document.getElementById("txtName").focus();
    
}
//========End=====fncJsBtnPlus=============================End=======fncJsBtnPlus====================

function fncJsRowClickedA(i)
{
    var rowId=i;
    document.getElementById("txtSNo").value = document.getElementById("txtSNo"+rowId).value;
    document.getElementById("txtName").value = document.getElementById("txtName"+rowId).value;
    document.getElementById("txtMobile").value = document.getElementById("txtMobile"+rowId).value;

}
function fncJsRowClickedB(i)
{
    var rowId=i;
    document.getElementById("txtSNo").value = document.getElementById("txtSNo"+rowId).value;
    document.getElementById("txtName").value = document.getElementById("txtName"+rowId).value;
    document.getElementById("txtMobile").value = document.getElementById("txtMobile"+rowId).value;

}
//========================fncJsBtnMinus============================fncJsBtnMinus====================
function fncJsBtnMinus()
{
    var intSNo = document.getElementById("txtSNo").value;
    if(intSNo!=="" || intSNo!=="0")
    {
        document.getElementById("tblDet").deleteRow(intSNo-1);
        var Det = document.getElementById("tblDet");
        var RowCount = Det.rows.length;
        var tr = RowCount;
        var strData="";
        var strData1="";
        var strData2="";
        
        for(var i=1;i<intSNo;i++)
        {
            var strName = document.getElementById("txtName"+i).value;
            var strMobile = document.getElementById("txtMobile"+i).value;
            
            strData= "<tr>"
                          +"<td><input type=text id=txtSNo"+i+" value="+i+" "
                          +"style=width:60px onfocus=fncJsRowClickedA("+i+") readOnly=true/></td>" 
                          +"<td><input type=text id=txtName"+i+" value='"+strName+"' "
                          +"style=width:100px onfocus=fncJsRowClickedA("+i+") readOnly=true/></td>"         
                          +"<td><input type=text  id=txtMobile"+i+" value='"+strMobile+"' "
                          +"style=width:100px onfocus=fncJsRowClickedA("+i+") readOnly=true/></td>"         
                          +"</tr>";
                    strData1=strData1+strData;  
        }
        
        for(i=intSNo-(-1);i<=RowCount-(-1); i++)
        {
            strName = document.getElementById("txtName"+i).value;
            strMobile = document.getElementById("txtMobile"+i).value;
            
            strData= "<tr>"
                          +"<td><input type=text id=txtSNo"+(i-1)+" value="+(i-1)+" "
                          +"style=width:60px onfocus=fncJsRowClickedB("+(i-1)+") readOnly=true/></td>" 
                          +"<td><input type=text id=txtName"+(i-1)+" value='"+strName+"' "
                          +"style=width:100px onfocus=fncJsRowClickedB("+(i-1)+") readOnly=true/></td>"         
                          +"<td><input type=text id=txtMobile"+(i-1)+" value='"+strMobile+"' "
                          +"style=width:100px onfocus=fncJsRowClickedB("+(i-1)+") readOnly=true/></td>"         
                          +"</tr>";
            strData2=strData2+strData;  
        }
        
        var strDivdata = "<table border=0px align=left id=tblDet>"+strData1+strData2+"</table>";
        document.getElementById("div1").innerHTML=strDivdata;
        fncBtnMinus()
        document.getElementById("txtSNo").value="";
        document.getElementById("txtName").value="";
        document.getElementById("txtMobile").value="";
        document.getElementById("txtName").focus();
    }
    
}



//==================End======fncJsBtnMinus===================End=========fncJsBtnMinus====================



function fncBtnPlus()
{
    function fncRowClicked()
    {
        var numTblRowClickedId = tr;
        document.getElementById("txtSNo").value=document.getElementById("txtSNo"+numTblRowClickedId).value;
        document.getElementById("txtName").value=document.getElementById("txtName"+numTblRowClickedId).value;
        document.getElementById("txtMobile").value=document.getElementById("txtMobile"+numTblRowClickedId).value;
    }
    if(document.getElementById("txtSNo").value==="")
    {
        var rowCount = document.getElementById("tblDet1").rows.length;
//        var row= document.getElementById("tblDet1").insertRow();
        var tr = 1;
         
        if(rowCount ===0)
        {
            var row1 = document.getElementById("tblDet1").insertRow();
            var cell1 = row1.insertCell(0);
            var td1 = document.createElement("input");
            td1.type="text";
            td1.name="txtSNo"+tr;
            td1.id="txtSNo"+tr;
            td1.value=tr;
            td1.readOnly = "true";
            td1.style.height="18px";
            td1.style.width="100px";
            td1.style.textAlign="left";
            td1.style.fontSize="10px";
            cell1.appendChild(td1).onclick = fncRowClicked;

            var row2 = document.getElementById("tblDet1").insertRow();
            var cell2 = row2.insertCell(0);
            var td2 = document.createElement("input");
            td2.type="text";
            td2.name="txtName"+tr;
            td2.id="txtName"+tr;
            td2.value=document.getElementById("txtName").value;
            td2.readOnly = "true";
            td2.style.height="18px";
            td2.style.width="100px";
            td2.style.textAlign="left";
            td2.style.fontSize="10px";
            cell2.appendChild(td2).onclick = fncRowClicked;

            var row3 = document.getElementById("tblDet1").insertRow();
            var cell3 = row3.insertCell(0);
            var td3 = document.createElement("input");
            td3.type="text";
            td3.name="txtMobile"+tr;
            td3.id="txtMobile"+tr;
            td3.value=document.getElementById("txtMobile").value;
            td3.readOnly = "true";
            td3.style.height="18px";
            td3.style.width="100px";
            td3.style.textAlign="left";
            td3.style.fontSize="10px";
            cell3.appendChild(td3).onclick = fncRowClicked;

        }
        else
        {
            var table=document.getElementById("tblDet1");
            tr = document.getElementById("tblDet1").rows[0].cells.length+1;

            var row1 = table.rows[0];
            var cell1 = row1.insertCell(tr-1);
            var td1 =  document.createElement("input");
            td1.type = "text";
            td1.name = "txtSNo"+tr;
            td1.id = "txtSNo"+tr;
            td1.value=tr;
            td1.readOnly = "true";
            td1.style.height="18px";
            td1.style.width="100px";
            td1.style.textAlign="left";
            td1.style.fontSize="10px";
            cell1.appendChild(td1).onclick = fncRowClicked;

            var row2 = table.rows[1];
            var cell2 = row2.insertCell(tr-1);
            var td2 =  document.createElement("input");
            td2.type = "text";
            td2.name = "txtName"+tr;
            td2.id = "txtName"+tr;
            td2.value=document.getElementById("txtName").value;
            td2.readOnly = "true";
            td2.style.height="18px";
            td2.style.width="100px";
            td2.style.textAlign="left";
            td2.style.fontSize="10px";
            cell2.appendChild(td2).onclick = fncRowClicked;

            var row3 = table.rows[2];
            var cell3 = row3.insertCell(tr-1);
            var td3 =  document.createElement("input");
            td3.type = "text";
            td3.name = "txtMobile"+tr;
            td3.id = "txtMobile"+tr;
            td3.value=document.getElementById("txtMobile").value;
            td3.readOnly = "true";
            td3.style.height="18px";
            td3.style.width="100px";
            td3.style.textAlign="left";
            td3.style.fontSize="10px";
            cell3.appendChild(td3).onclick = fncRowClicked;


        }
         
    }
    else
    {
        tr=document.getElementById("txtSNo").value;
        document.getElementById("txtName"+tr).value=document.getElementById("txtName").value;
        document.getElementById("txtMobile"+tr).value=document.getElementById("txtMobile").value;
         
    }
    document.getElementById("txtSNo").value="";
    document.getElementById("txtName").value="";
    document.getElementById("txtMobile").value="";
	
}



//==================================================================

function fncBtnMinus()
{
	
    var intTxtSNo = document.getElementById("txtSNo").value;

    if(intTxtSNo===""||intTxtSNo==="0")
    {
        document.getElementById("txtName").value="";
        document.getElementById("txtMobile").value="";

    }
    else
    {
        var intMaxId= document.getElementById("tblDet1").rows[0].cells.length;
        var i=intTxtSNo;
        for(i;i<intMaxId;i++)
        {
            document.getElementById("txtName"+i).value = document.getElementById("txtName"+(i-(-1))).value;
            document.getElementById("txtMobile"+i).value = document.getElementById("txtMobile"+(i-(-1))).value;
        }

        var intCellIndexDelete = intMaxId-1;
//        var intCellIndexDelete = intTxtSNo-1;
        document.getElementById("tblDet1").rows[0].deleteCell(intCellIndexDelete);
        document.getElementById("tblDet1").rows[1].deleteCell(intCellIndexDelete);
        document.getElementById("tblDet1").rows[2].deleteCell(intCellIndexDelete);
        
        document.getElementById("txtSNo").value="";
        document.getElementById("txtName").value="";
        document.getElementById("txtMobile").value="";
        
        document.getElementById("txtName").focus();
        
    }
}


function fncSave()
{
    var strName=document.getElementById("txtName").value;
    var strMobile=document.getElementById("txtMobile").value;
    if(window.XMLHttpRequest){    
    request=new XMLHttpRequest();//for Chrome, mozilla etc  
    }    
    else if(window.ActiveXObject){    
    request=new ActiveXObject("Microsoft.XMLHTTP");//for IE only  
    }   
    var url="NewClass.do?fncSave";
//    var loginUrl="http://localhost:1994/Uniserve-WebV4/AuthenticateThickClientUser.do?ReqData";
    request.open("GET", url, true);  
    request.onreadystatechange  = fncAjBtnSave;
    function fncAjBtnSave()
    {  
      if (request.readyState == 4  )  
      {  
          var Response=request.responseText;
        
      }  
   }  
   
   request.send();  
}





/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


