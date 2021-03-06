package dbbeans;

import DAO.ProgramDAO;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by timothysmith on 2017-03-27.
 */
public class ProgramBean implements Serializable {

    private String programName;
    private String programCode;

    public ProgramBean() {

    }

    public String getProgramName() {
        return programName;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    public String getProgramCode() {
        return programCode;
    }

    public void setProgramCode(String programCode) {
        this.programCode = programCode;
    }

    public static ArrayList<ProgramBean> getProgramList() {
        return ProgramDAO.getProgramList();
    }

    public static void executeAction(String action, String id) {
        if (action.equals("delete")) {
            ProgramDAO.deleteProgramById(id);
        }
    }

    public static void addProgramToDb(ProgramBean programBean) {
        ProgramDAO.addProgramToDb(programBean);
    }

    public static void addToOffered(String[] programCodes, int jobId) {
        ProgramDAO.addToOffered(programCodes, jobId);
    }
}
