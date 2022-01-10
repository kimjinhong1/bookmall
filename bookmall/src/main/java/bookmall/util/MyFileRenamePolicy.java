package bookmall.util;

import java.io.File;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	@Override
	public File rename(File f) {
		// 경로
		String dir = f.getParent();
		// 파일명
		String fileName = f.getName();
		
		String ext = fileName.substring(fileName.lastIndexOf("."));
		fileName = System.currentTimeMillis() + ext;
		return new File(dir+System.getProperty("file.separator")+fileName);
	}
}
