Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B7280CE0;
	Wed, 18 Mar 2026 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773854235; cv=none; b=rsImcbFZiOYybrltcGXB5mUohwkzTXOkKyckiF0UYxBh1nf9tPP9aVodPKyz1qAFqQbn2jqYG3eo2k1kmCF+UHcL7/0A7SIaNF98BXT0hdbAmJ2F96AiIG76z3UFp+I1L+KPkV6ghDH6XEIP0y0/4GsaaEu0R+EZYclA9TR2REg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773854235; c=relaxed/simple;
	bh=ID6Gn30lagt0qu/a3VSQdpleOirf8ZE9bHTYiRi/yV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h5w3F7dVBZKail+HaoRLgZKnuK3pOjerV2MgoXGiHvbEDnFbPba4rH4MiBftxdjQ9FGBSO7GQeKAisJGCZY5MTdAodsg/MCUj0BUuA3gPJ0gtVfJk2H5pQkaUXRMrW5bJxb2PScgyw4GXYhfCEmfgHoB049j2DA0JDi7S5fqwZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=uHtL/fXI; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="uHtL/fXI"
Received: from p-si-bellegarde (34.33.83.79.rev.sfr.net [79.83.33.34])
	by adishatz.org (Postfix) with ESMTPSA id 1634D4C0389;
	Wed, 18 Mar 2026 18:17:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1773854229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4LY9UfzYIzAn7pMCdrUujOdWjd1Qk9yuxMAzyoMrDE=;
	b=uHtL/fXI4D/vg8REBqeKgn9qEBNfMNNPsTB5SQiguO1H0qqdUaXZDHf04dElUh5B2qMf5p
	NoTbwJ74ItChxOta1thdXjGpt8Y4k+6SmQIV6yTxuFjc/z3/RHou4i4O95HsOAAlcoWPMm
	4+zikVVLwd8CuxMf7RbhAMHQKCogmBSM0n+Y98nzERDxPwsDQhljitSoDIapK+YVBkL1Z7
	2yeDyie6T9p1n/6bP2+MVoTknuivUWk5Kg9ws8dRauJP61eWEY2XXKFx7e+50oWCLgo2Qy
	0BTksF/9B2xbRIzeuGbhkK0aIpG1qx1ufzayraAtvCTPc1N4pQcICSfaoLCXSw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	cedric.bellegarde@adishatz.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
Date: Wed, 18 Mar 2026 18:17:00 +0100
Message-ID: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ubxvfyx4tugfliwffrrlbe2oliep6nhp5dbpjry4vmamldz2ow@qncsubi7heex>
References: <ubxvfyx4tugfliwffrrlbe2oliep6nhp5dbpjry4vmamldz2ow@qncsubi7heex>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
at any time in response to a userspace vblank request, independently
of the atomic commit sequence. If this happens before the encoder's
first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.

Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
values of 134217727 and 31 respectively due to unsigned wraparound
in the (irq_idx - 1) macros, resulting in the confusing error:

  [dpu error]invalid IRQ=[134217727, 31]

Since irq[INTR_IDX_RDPTR] will be properly populated by
atomic_mode_set() and registered by irq_enable() as part of the
normal modeset sequence, silently skip the vblank IRQ registration
when the index has not yet been initialized. This matches the
existing pattern of the master encoder check above it.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 1aa74ecb08be..b583284d8508 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -256,6 +256,12 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		goto end;
 
+	/* IRQ not yet initialized */
+	if (!phys_enc->irq[INTR_IDX_RDPTR]) {
+		ret = -EINVAL;
+		goto end;
+	}
+
 	/* protect against negative */
 	if (!enable && refcount == 0) {
 		ret = -EINVAL;
-- 
2.53.0

