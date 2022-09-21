package com.kh.bbang.faq.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.bbang.faq.domain.Faq;
import com.kh.bbang.faq.store.FaqStore;

@Repository
public class FaqStoreLogic implements FaqStore {

	@Override
	public int insertFaq(SqlSession session, Faq faq) {
		int result = session.insert("FaqMapper.insertFaq", faq);
		return result;
	}

	@Override
	public List<Faq> selectAllFaq(SqlSession session, int currentPage, int limit) {
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Faq> faqList = session.selectList("FaqMapper.selectAllFaq", null, rowBounds);
		return faqList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("FaqMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public Faq selectOneByNo(SqlSession session, Integer faqNo) {
		Faq faq = session.selectOne("faqMapper.selectOneByNo", faqNo);
		return faq;
	}

	@Override
	public int deleteOneByNo(SqlSession session, int faqNo) {
		int result = session.delete("faqMapper.deleteOneByNo", faqNo);
		return result;
	}

	@Override
	public List<Faq> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage,
			int faqLimit) {
		int offset = (currentPage - 1) * faqLimit;
		RowBounds rowBounds = new RowBounds(offset, faqLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<Faq> bList = session.selectList("faqMapper.selectAllByValue", paramMap, rowBounds);
		return bList;
	}

	@Override
	public int updateFaq(SqlSession session, Faq faq) {
		int result = session.update("faqMapper.updatefaq", faq);
		return result;
	}

	@Override
	public void faqViewCount(SqlSession session, int faqNo) {
		// TODO Auto-generated method stub
		//ㅁㄴㅇㄻㄴㅇㄹ
	}

}
