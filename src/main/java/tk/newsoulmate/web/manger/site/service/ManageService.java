package tk.newsoulmate.web.manger.site.service;

import tk.newsoulmate.domain.dao.AttachmentDao;
import tk.newsoulmate.domain.dao.GradeUpDao;
import tk.newsoulmate.domain.dao.MemberDao;
import tk.newsoulmate.domain.vo.GradeUp;
import tk.newsoulmate.domain.vo.Member;


import java.sql.Connection;
import java.util.ArrayList;

import static tk.newsoulmate.web.common.JDBCTemplet.*;

public class ManageService {

    private MemberDao memberDao = new MemberDao();


    public ArrayList<Member> selectMemberList() {
        Connection conn = getConnection();
        ArrayList<Member> mList = memberDao.selectMemberList(conn);
        close();
        return mList;
    }

    public ArrayList<Member> selectManageMember() {
        Connection conn = getConnection();
        ArrayList<Member> mList = memberDao.selectManageMember(conn);
        close();
        return mList;
    }

    public ArrayList<GradeUp> selectGradeUp() {
        Connection conn = getConnection();
        ArrayList<GradeUp> gList = new GradeUpDao().selectAllGrade(conn);

        AttachmentDao at = new AttachmentDao();
        //new AttachmentDao().selectGradeUpAttachment(conn,gList);
        at.selectGradeUpAttachment(conn,gList);
        close();
        return gList;
    }

    public int selectCountMember() {
        Connection conn = getConnection();
        int countMember = memberDao.selectCountMember(conn);
        close();
        return countMember;
    }


    public int[] changeStatus(int[] memArr) {
        Connection conn = getConnection();
        int[] result = new GradeUpDao().changeGrade(conn,memArr);

        for(int i =0; i<result.length;i++){
            if(result[i]>0){
                commit();
            }else{
                rollback();
            }
        }
        return result;
    }
}
