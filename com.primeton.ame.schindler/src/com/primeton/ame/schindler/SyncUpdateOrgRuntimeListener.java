package com.primeton.ame.schindler;

import cn.hutool.core.lang.Console;
import cn.hutool.cron.CronUtil;
import cn.hutool.cron.task.Task;

import com.eos.runtime.core.IRuntimeListener;
import com.eos.runtime.core.RuntimeEvent;

public class SyncUpdateOrgRuntimeListener implements IRuntimeListener {

	@Override
	public void start(RuntimeEvent arg0) {
		SyncUpdateOrg syncUpdateOrg = new SyncUpdateOrg();
		CronUtil.schedule("syncOaUpdateOrg", "0 2 * * *", new Task() {

			@Override
			public void execute() {
				try {
					syncUpdateOrg.syncUpdateOrg();
				} catch (Exception e) {
					Console.log("(☄⊙ω⊙)☄☄⊙ω⊙)☄ OA同步组织定时任务执行失败 ☄⊙ω⊙)☄☄⊙ω⊙)☄");
					Console.log(e.getMessage());
				}
			}
		});
		CronUtil.start(true);
	}

	@Override
	public void stop(RuntimeEvent arg0) {
		CronUtil.stop();
	}

}
