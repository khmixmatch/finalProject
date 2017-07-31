package com.kh.mixmatch.team.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.kh.mixmatch.team.domain.BaseCommand;
import com.kh.mixmatch.team.domain.BasketCommand;
import com.kh.mixmatch.team.domain.FootCommand;

public interface TotalTypeMapper {

	public void insertBase(BaseCommand base);
	public void insertBasket(BasketCommand basket);
	public void insertFoot(FootCommand foot);
	
	public void deleteBase(Integer b_seq);
	public void deleteBasket(Integer b_seq);
	public void deleteFoot(Integer f_seq);
	
	public BaseCommand updateBase(Integer b_seq);
	public BasketCommand updateBasket(Integer b_seq);
	public FootCommand updateFoot(Integer f_seq);
	
	public BaseCommand selectBase(Integer b_seq);
	public BasketCommand selectBasket(Integer b_seq);
	public FootCommand selectFoot(Integer f_seq);
	
	
	// 개인별 통합랭킹 리스트
	@Select("SELECT * FROM G_MEMBER M, (SELECT id,sum(b_bat) b_bat,sum(b_hit) b_hit,sum(b_rbi) b_rbi,sum(b_score) b_score, sum(b_win) b_win, sum(b_lose) b_lose, sum(b_strike) b_strike, sum(b_ip) b_ip, sum(b_er) b_er FROM g_baseball GROUP BY ROLLUP(id)) B WHERE M.ID=B.ID")
	public List<BaseCommand> listBase();
	@Select("SELECT * FROM G_MEMBER M, (SELECT id,sum(b_3point) AS b_3point,sum(b_assist) b_assist,sum(b_steel) b_steel,sum(b_score) b_score,sum(b_block) b_block,sum(b_rebound) b_rebound FROM g_basketball GROUP BY ROLLUP(id)) B WHERE M.ID=B.ID ORDER BY b_score DESC")
	public List<BasketCommand> listBasket();	
	@Select("SELECT * FROM G_MEMBER M, (SELECT id,sum(f_goal) AS f_goal,sum(f_assist) f_assist,sum(f_shoot) f_shoot,sum(f_attack) f_attack FROM g_football GROUP BY ROLLUP(id)) F WHERE M.ID=F.ID ORDER BY f_attack DESC")
	public List<FootCommand> listFoot();
	
	
	
	
}
