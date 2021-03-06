package com.kh.mixmatch.team.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kh.mixmatch.match.domain.MatchCommand;
import com.kh.mixmatch.team.dao.TeamMapper;
import com.kh.mixmatch.team.domain.TeamCommand;
@Service("teamService")
public class TeamServiceImpl implements TeamService {

	@Resource
	private TeamMapper teamMapper;
	
	
	
	@Override
	public List<TeamCommand> list(Map<String, Object> map) {
		return teamMapper.list(map);
	}

	@Override
	public void insertTeam(TeamCommand team) {
		teamMapper.insertTeam(team);
	}

	@Override
	public int getTeamCount(Map<String, Object> map) {
		return teamMapper.getTeamCount(map);
	}

	@Override
	public TeamCommand selectTeam(String tname) {
		return teamMapper.selectTeam(tname);
	}

	@Override
	public void updateTeam(TeamCommand team){
		teamMapper.updateTeam(team);
	}

	@Override
	public void deleteTeam(String tname) {
		teamMapper.deleteTeam(tname);
	}

	@Override
	public List<TeamCommand> listRank(Map<String, Object> map) {
		return teamMapper.listRank(map);
	}

	@Override
	public List<MatchCommand> listMatch(Map<String, Object> map) {
		return teamMapper.listMatch(map);
	}
	@Override
	public int countHomeMatch(String tname) {
		return teamMapper.countHomeMatch(tname);
	}

	@Override
	public int countAwayMatch(String tname) {
		return teamMapper.countAwayMatch(tname);
	}

	@Override
	public MatchCommand selectMatchDetail(Integer mseq) {
		return teamMapper.selectMatchDetail(mseq);
	}

	@Override
	public List<TeamCommand> listMaster(String id) {
		// TODO Auto-generated method stub
		return teamMapper.listMaster(id);
	}

	@Override
	public int countMasterTeam(String id) {
		// TODO Auto-generated method stub
		return teamMapper.countMasterTeam(id);
	}
	
}
