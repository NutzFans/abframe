/**
 * 
 */
package com.primeton.eos.ame_common;

import com.eos.data.xpath.XPathLocator;
import com.eos.foundation.common.utils.StringUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.exception.EOSRuntimeException;
import com.primeton.ext.das.common.DataObjectHelper;
import com.primeton.ext.data.sdo.DataUtil;
import com.primeton.ext.data.sdo.ExtendedDataObject;
import com.primeton.ext.data.sdo.ExtendedProperty;
import com.primeton.ext.data.sdo.ExtendedType;
import com.primeton.ext.data.sdo.helper.ExtendedTypeHelper;
import commonj.sdo.DataObject;
import commonj.sdo.Property;
import commonj.sdo.Type;
import commonj.sdo.helper.DataFactory;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * @author zhuhx
 * @date 2018-08-23 08:52:36
 *
 */
@Bizlet("")
public class ImportExcelToDataObject {

	@Bizlet(value="Use the dataObject's full name to ctreate it", params={@com.eos.system.annotation.BizletParam(index=0, type=com.eos.system.annotation.ParamType.CONSTANT)})
	  public static DataObject createDataObject(String entityName)
	  {
	    if (StringUtil.isBlank(entityName)) {
	      return null;
	    }
	    ExtendedType type = (ExtendedType)ExtendedTypeHelper.eINSTANCE.getType(entityName);

	    if (type == null) {
	      throw new EOSRuntimeException("24000021", new String[] { entityName });
	    }

	    return DataFactory.INSTANCE.create(type);
	  }
 
	
	@Bizlet(value="Import from excel file  to an SDO object", params={@com.eos.system.annotation.BizletParam(index=1, type=com.eos.system.annotation.ParamType.CONSTANT)})
	  public static DataObject[] importExcelToDataObject(String filePath, String entityName, String propertyList, int startLine)
	  {
	    if (StringUtil.isBlank(filePath)) {
	      throw new EOSRuntimeException("24000001", new String[] { "filePath" });
	    }

	    if (StringUtil.isBlank(entityName)) {
	      entityName = "com.primeton.das.datatype.AnyType";
	    }
	    if (StringUtil.isBlank(propertyList)) {
	      return new DataObject[0];
	    }
	    HSSFWorkbook workbook = null;
	    FileInputStream is = null;
	    ArrayList dataList = new ArrayList();
	    try {
	      is = new FileInputStream(filePath);
	      workbook = new HSSFWorkbook(is);

	      if (startLine < 1) {
	        startLine = 1;
	      }

	      String[] properties = propertyList.split("\\,");
	      ArrayList alPty = new ArrayList();
	      ArrayList alColIdx = new ArrayList();
	      int preIdx = 1;
	      for (String property : properties)
	        if (!"".equals(property))
	        {
	          int index = property.indexOf(':');
	          if (index < 0) {
	            alPty.add(property);
	          } else {
	            preIdx = new Integer(property.substring(index + 1)).intValue();

	            alPty.add(property.substring(0, index));
	          }
	          alColIdx.add(Integer.valueOf(preIdx));
	          preIdx++;
	        }
	      XPathLocator locator = XPathLocator.newInstance();
	      for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
	        HSSFSheet sheet = workbook.getSheetAt(i);
	        int rowCount = sheet.getLastRowNum();
	        if (rowCount != 0)
	        {
	          for (int j = startLine - 1; j <= rowCount; j++) {
	            HSSFRow row = sheet.getRow(j);
	            DataObject obj = createDataObject(entityName);
	            if (row != null) {
	              for (int k = 0; k < alPty.size(); k++) {
	                String propertyXpath = (String)alPty.get(k);
	                int cellIdx = ((Integer)alColIdx.get(k)).intValue() - 1;

	                HSSFCell cell = row.getCell((short)cellIdx);
	                if (cell != null) {
	                  int cellType = cell.getCellType();
	                  Object cellValue = null;
	                  switch (cellType) {
	                  case 4:
	                    cellValue = Boolean.valueOf(cell.getBooleanCellValue());
	                    break;
	                  case 0:
	                    short cellDataFormat = cell.getCellStyle().getDataFormat();

	                    if (((cellDataFormat >= 14) && (cellDataFormat <= 22)) || ((cellDataFormat >= 45) && (cellDataFormat <= 47)))
	                    {
	                      cellValue = cell.getDateCellValue();
	                    } else {
	                      double d = cell.getNumericCellValue();
	                      if (d>0 && d - (int)d < 4.9E-324D)
	                        cellValue = Integer.valueOf((int)d);
	                      else if (d<0 && (int)d -d < 4.9E-324D)
		                        cellValue = Integer.valueOf((int)d);
		                  else{
	                        cellValue = Double.valueOf(cell.getNumericCellValue());
	                      }
	                    }

	                    break;
	                  case 5:
	                    cellValue = Byte.valueOf(cell.getErrorCellValue());
	                    break;
	                  default:
	                    cellValue = cell.getRichStringCellValue().getString();
	                  }

	                  locator.setValue(obj, propertyXpath, cellValue);
	                }
	              }
	            }
	            dataList.add(obj);
	          }
	        }
	      }
	    } catch (Exception e) { throw new EOSRuntimeException("24000023", e.getMessage(), e);
	    } finally
	    {
	      try {
	        if (is != null)
	          is.close();
	      } catch (IOException e) {
	      }
	    }
	    return (DataObject[])dataList.toArray(new DataObject[dataList.size()]);
	  }
}
