Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E273BB9F8;
	Mon,  6 Jul 2026 05:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783315671; cv=none; b=NlWEoYmO6Ozk4nGts06GczJeQWksuODhkQG9aDGF8ZE3MGUymMEQkT87Y5hju6+mGKaJPk82FtpaifI8Cm6SXoPH4nz8a1E4VOb9bdHluragJPaB/xFgodG9bbJuaVeh9gquxaq3PTOfrnSsXZQ7eh+6iK7CTUknH9nNZz3Pgs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783315671; c=relaxed/simple;
	bh=DU/1AgaBmfUJXutfLHleq1m7XlshK8UpCIx4xC+iLj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PFRk0fgGB9MqYxuC/WsCvd9HYVHHG1auHFP7sp7KUlxrumDDxxWMXEFObEMMDlIuU68T/Lf30hVVbsF1l6/AV9AjHjZESmnkkZtPK3L5KNyRSrmTyjNA1a/WUv5i+JzwK3wLusubuiFjkcwZWpQ1GTy9Dt5RHLGAnZr7D5/9KXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=o9yoFIOT; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="o9yoFIOT"
Received: from p-si-bellegarde (151.127.95.79.rev.sfr.net [79.95.127.151])
	by adishatz.org (Postfix) with ESMTPSA id 2254A4C019B;
	Mon, 06 Jul 2026 07:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1783315133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bmINFG2vY6U9FFlG3dWawSnCvtEZ5sxZ5EVkoegtJPE=;
	b=o9yoFIOT0eIzuaVl5ANomqS19UzvXOmKvO6tHnGdLdE5aCp4FjRvDWT2KSPXDly0Iwsm6D
	GUIfGBgBn/ekCDqvVAhY//b+BoQLq2xoeDmt1RYryke0GNQvRT2LLZl2Pbowo1+jdqu1R0
	wW34nejiLUHfenL7IYNpuqYp/fr3EbKirKfs+iaQ3TnDfUz0oI8w54v2hzTGF0Gmt8a72y
	5xfwb6tDRYdtdXqVWAOo6xp+exEReRwDtGXHwy8Xp4XWIlpuvK7n4BIgVsdZjxs/4gtVL4
	qZPGzKejOct6b5onOn3AfxZU+c+seiMGd/+aGoqaEeKcOXDoaGQ1xI0so9PD0Q==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Subject: [PATCH] drm/panel: sofef00: Fix DSI transfer errors on backlight update
Date: Mon,  6 Jul 2026 07:18:22 +0200
Message-ID: <20260706051825.78752-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backlight updates via bl_update_status() could be triggered before the
panel was fully initialized, resulting in failed DCS commands during
the atomic commit sequence.

Guard bl_update_status() with a prepared flag to skip backlight updates
when the panel is not yet ready.

[11816.846734] disp_cc_mdss_byte0_clk status stuck at 'on'
[11816.846752] WARNING: CPU: 4 PID: 26399 at drivers/clk/qcom/clk-branch.c:88 clk_branch_toggle+0x128/0x178
[11816.861715] Modules linked in: rfcomm rmnet algif_hash algif_skcipher q6asm_dai q6voice_dai q6routing q6afe_dai q6voice q6adm q6cvp q6afe q6asm q6mvm q6
cvs q6voice_common snd_q6dsp_common q6core bnep gpio_wcd934x snd_soc_wcd934x snd_soc_wcd_mbhc soundwire_qcom snd_soc_wcd_classh venus_enc venus_dec imx371 wcd9
34x regmap_slimbus imx376 lc898217xc videobuf2_dma_contig fastrpc v4l2_cci qrtr_smd rpmsg_ctrl hci_uart btqca btbcm bluetooth ecdh_generic ecc pwrseq_core snd_
soc_max98927 qcom_camss ath10k_snoc videobuf2_dma_sg snd_soc_sdm845 videobuf2_memops venus_core ath10k_core qcom_smbx leds_qcom_flash snd_soc_rt5663 leds_qcom_
lpg ath v4l2_mem2mem snd_soc_qcom_sdw videobuf2_v4l2 v4l2_fwnode videobuf2_common v4l2_async snd_soc_qcom_common bq27xxx_battery_i2c qcom_pbs bq27xxx_battery l
ed_class_multicolor mac80211 snd_soc_rl6231 rtc_pm8xxx libarc4 soundwire_bus videodev qcom_stats qcom_spmi_rradc reset_qcom_pdc i2c_qcom_cci cfg80211 camcc_sdm
845 rfkill mc qcom_rng ipa qcom_q6v5_mss slim_qcom_ngd_ctrl qcom_wdt icc_bwmon qrtr
[11816.861812]  qcom_q6v5_pas qcom_pil_info qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem joydev zram zsmalloc uhid uinput nft_reject_inet nft_reject n
f_reject_ipv6 nf_reject_ipv4 nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables fuse nfnetlink ipv6 qcom_spmi_haptics rmi_i2c rmi_core
[11816.978965] CPU: 4 UID: 0 PID: 26399 Comm: (sd-bright) Tainted: G        W           6.16.7-sdm845 #1000-postmarketos-qcom-sdm845 PREEMPT
[11816.991580] Tainted: [W]=WARN
[11816.994637] Hardware name: OnePlus 6 (DT)
[11816.998735] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[11817.005844] pc : clk_branch_toggle+0x128/0x178
[11817.010384] lr : clk_branch_toggle+0x124/0x178
[11817.014956] sp : ffff8000991f3970
[11817.018358] x29: ffff8000991f3980 x28: ffff0000dad38000 x27: 0000000000000000
[11817.025634] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[11817.032887] x23: 0000000000000000 x22: ffffa63e2af42178 x21: ffffa63e2b56e128
[11817.040169] x20: ffffa63e29da5a90 x19: 0000000000000000 x18: 0000000000000003
[11817.047451] x17: 0000000000000000 x16: 000000000000000c x15: 0000000000000003
[11817.054701] x14: ffffa63e2b2f6a10 x13: 0000000000000003 x12: 0000000000000003
[11817.061982] x11: 00000000ffffefff x10: c0000000ffffefff x9 : e43cc05c4996c100
[11817.069260] x8 : e43cc05c4996c100 x7 : 7461206b63757473 x6 : 0000000000000027
[11817.076511] x5 : ffffa63e2b8726d3 x4 : ffffa63e2ae146c4 x3 : 0000000000000000
[11817.083792] x2 : 0000000000000000 x1 : ffff8000991f3710 x0 : 00000000fffffff0
[11817.091042] Call trace:
[11817.093572]  clk_branch_toggle+0x128/0x178 (P)
[11817.098112]  clk_branch2_disable+0x28/0x40
[11817.102308]  clk_core_disable+0x64/0x1b8
[11817.106358]  clk_core_disable_lock+0x90/0x120
[11817.110810]  clk_disable+0x2c/0x40
[11817.114298]  dsi_link_clk_disable_6g+0x78/0x98
[11817.118871]  msm_dsi_host_xfer_restore+0xf0/0x120
[11817.123667]  msm_dsi_manager_cmd_xfer+0xfc/0x178
[11817.128411]  dsi_host_transfer+0x48/0x110
[11817.132509]  mipi_dsi_dcs_set_display_brightness_large+0x8c/0xd0
[11817.138651]  sofef00_panel_bl_update_status+0x3c/0x60
[11817.143802]  backlight_device_set_brightness+0x88/0x128
[11817.149124]  brightness_store+0x64/0xa8
[11817.153082]  dev_attr_store+0x24/0x40
[11817.156835]  sysfs_kf_write+0x8c/0xb8
[11817.160591]  kernfs_fop_write_iter+0xe4/0x190
[11817.165073]  do_iter_readv_writev+0x168/0x1c8
[11817.169515]  vfs_writev+0x16c/0x378
[11817.173122]  do_writev+0x84/0x130
[11817.176523]  __arm64_sys_writev+0x2c/0x40
[11817.180618]  invoke_syscall+0x48/0x100
[11817.184460]  el0_svc_common+0x88/0xe8
[11817.188217]  do_el0_svc+0x28/0x40
[11817.191621]  el0_svc+0x38/0x88
[11817.194766]  el0t_64_sync_handler+0x78/0x108
[11817.199161]  el0t_64_sync+0x198/0x1a0

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index e00a497a7c96..f07d6533ed69 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -175,9 +175,13 @@ static const struct drm_panel_funcs sofef00_panel_panel_funcs = {
 static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 {
 	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	struct sofef00_panel *ctx = mipi_dsi_get_drvdata(dsi);
 	int err;
 	u16 brightness = (u16)backlight_get_brightness(bl);
 
+	if (!ctx->panel.prepared)
+		return 0;
+
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
 	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
-- 
2.54.0

