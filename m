Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795375218;
	b=K3yL2V3ynG10D0qN+1P8iDJWPR+iDY5c9PfCVy7tMimuBmChi7oE6TQzOuKCSECD8Tes
	 O//aC9+wS3c1fV3f2zk4JUvRzer2FJTYWOoPxwW5Dzw4ZKkULiUO7YCa2YfLRJJbsOd9/
	 LRUIlMN1/hy3yatWy4lQTMSJvVtiWdZp6BBpdzXN1YPVA1W0FOrYdXmZLhVP3lwJI6sES
	 oCXBnVPhAK/enIRqRy4TquRev6tBr4ftflMe6CuuokC/EL/iZceqGx8swmFc7IdrFcvVO
	 wFGdnDWtyFbhy0TYEW7ADtvpXF95Ti8MV7caJpwOBcW7A47vbZWpd4sHjKQFaFuKJ/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375218;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Si3OJKwVD2rRuCbK85puFr5Z7sJkJ1E9434T+ZSpUHI=;
	b=s5H0jG6rqWjsKiPgFCUbAwhTfVA9h4IvBnMRkfDYgtK4UZIHwylNwIR0Oe+bLWRq1MJM
	 xuxuI4SDma/C5n8doEG6csPnVXtxIOAQT5QWQHlvqp+LaHEuTvwsT8wiWYtGsJhVveEUv
	 skbK64qCuG5TyMBtZoSROilQjRCIB/hHVc4y0FsRo33yp7JpkfY0+v1Tlxw23MQSKzViB
	 Sp9PUk3bke2BE+GwZB/XLUHwTrRUQIe1Rouc0F7zVNrMKNcwLrJjO6XOKpPlVWiwWqIsO
	 tSRMtYqGU6G8XEXD6FpTIy8PCBkadm5CcwAzonigSmRQE12GzQYZRFOfDfEb6AEFsMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nut4ooX9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC61606A31E;
	Sun, 22 Nov 2026 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nut4ooX9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795375217;
	b=pA4uxZI9eOGF6UvRNUeO4u6LJuc4TzOcBhVzZDLG8js1urGqP5eDLeIn1jwzx/w/I/JZ
	 X9kfS//Kk/8D5yJcPlr9XqCkP1Nl3GqdNnEMQhgUUlzDWpKmAJg6/Adtig7ka9cQpmS39
	 pAvRsX5U13vYA9HgwUIV5I94Fy9TrPIaKidUZXudhn8id+7TRqqgLtRHpF5pec1fuqp9c
	 b623fhsvQdwLpYuR/wQCo3S9yIfvx3+ha/LcfuRCxv6Xz4xE8vYxq1x5WaHkoiYG8mAMA
	 Hp0khaLVnmzjVQadLWUHOKmh5iqyuKXbMisTduT4pn7zumzV2vF71MSXse0CxZlCccQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795375217;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Si3OJKwVD2rRuCbK85puFr5Z7sJkJ1E9434T+ZSpUHI=;
	b=cnyIcqjeoQ4BdoIfwNzt/pPTpIZ71N743HQK52CaIDv6D5ifFvkM7o3EJrhCyWIdT5r/
	 Nzjeo5QjjQcRg8yIeaEpB7qYk9uB8LF6x9u18IJ4F6kBh7xfrAD5iQpenW06RPvEcLZ9C
	 /CMhstkMMR539n1fb97ikLDWiGWfyf18Xk2ONrSBSp368ThecX4ty6Xt5qXdiNB8uIOBx
	 klF8v2jR+6Kaj/W4iGmilKFG0taMX5apPa3bV6zjLmDGvZelipPnBZdq1sdmFOhcYX9rU
	 aWfihSrY945wz59QdBcHGscNgpRr33eCTSQ+xrqnjr9QIrr5+NR9LRJkK2I3Z/VrfUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C25501F000CA;
	Sun, 22 Nov 2026 19:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375217;
	bh=Si3OJKwVD2rRuCbK85puFr5Z7sJkJ1E9434T+ZSpUHI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=nut4ooX97IKOqbiaMesqWOuiL7Eoamkl26LYBjrqB41HJqYENkgpM09jLmBI9U8x1
	 MStvWKyI/Td6WGAgI7iVrcFOTl6SjkFa3GlWcdljTrl+WjmFk2COPJfHJU36HHmjOY
	 OMuq65FE6JIl8rQ5YtmD+IKj6cOKMavXMUAUafT2C1EZCJ+F2dbKt0cFWimoFJ1Z8E
	 65XowsCM1VkJCMOZeSy1++8qNU36XZqaPUYEXZ+EoIAVRAlWHT3T/3nloXmWdNJK+9
	 aWMyabAV62nvitPuxwjxazsk4ATQWK0s0Wydy8HsS5M18YQZHYo16mZxpuUIJNow0w
	 Pvimr+OlbiHKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 52E614C1C1;
	Sun, 22 Nov 2026 19:20:07 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:50:07 +0530
Subject: [PATCH v2] drm/msm/a6xx: Fall back to MX when GMxC has no levels
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-msm-gmxc-fallback-v2-1-5dccc6a2ce34@yahoo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbY3TxCquvIdhMW0HqFJqWmwgh
 LsLuHf5kvffnyFxdJzgVswQObvkQr+CPBRgWuobFs6uDPIkFSIq4ZMXjR+NqKnrNJmX0OdS81W
 yMtLCuntHrt24Nx/Vj9NHP9kMW2gzWpeGEKf9NOPm/etnFCiotET2goqQ7xO1IRxN8FAty/IFD
 UHZzMQAAAA=
X-Change-ID: 20261116-msm-gmxc-fallback-b59be82e6c2d
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795375206; l=2880;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=74LSQlZzTqbucHJa48m+yacr8Q6+5YkDPUtVvz3s7XI=;
 b=aEtKP5ytT/G03Oi/XzEJJ2yuRfncR5R23fxPdUIQoJgbniRN+eFd3+1vRKQ0DlpKmsIGJZok4
 4V81jjzLMIGBeSuYsDPNh73cWkMC4ITk2dVMlnAuFM+uIci8c1Bo8MR
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The command DB of Molokai (SM8845) lists the gmxc.lvl resource without
any level. Since a6xx_gmu_rpmh_read_arc() trims the trailing zero
levels, reading it now fails with -EINVAL, so the GX votes are never
built and the GMU of the Adreno 829 hangs on the first GX vote:

  Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 8 timed out waiting for response
  Timeout waiting for GMU OOB set GPU_SET: 0x4
  gpu hw init failed: -110

Before, the empty list made the GX votes use the lowest GMxC corner and
the GPU worked. Read gmxc.lvl the same way when choosing the secondary
rail, so that a GMxC without levels is treated like a missing one and
the GX votes use MX.

Fixes: b5269bf0e1ad ("drm/msm/a6xx: Factor out RPMh arc-vote helpers")
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
Found while bringing up the Adreno 829 of the Motorola Signature
(Qualcomm Molokai, SM8845) on next-20261113: the GMU firmware loads but
never answers the first GX vote. Bisecting the arc vote rework points at
commit b5269bf0e1ad: the Molokai command DB lists gmxc.lvl without any
level, which the new helper rejects, so the GX votes are never built.

Tested on the Motorola Signature: the GMU answers, the GPU comes up and
Phosh renders on it.

I used an LLM (Claude) to help write this patch and its commit message.
I reviewed it, bisected the regression on the device and tested the
result there.
---
Changes in v2:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter.
- Link to v1: https://patch.msgid.link/20261116-msm-gmxc-fallback-v1-1-a9daad716a1e@yahoo.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..914434b49eed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1889,13 +1889,17 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	const char *sec_id;
 	const u16 *gmxc;
+	size_t gmxc_count;
 	int ret;
 
-	gmxc = cmd_db_read_aux_data("gmxc.lvl", NULL);
+	gmxc = a6xx_gmu_rpmh_read_arc("gmxc.lvl", &gmxc_count);
 	if (gmxc == ERR_PTR(-EPROBE_DEFER))
 		return -EPROBE_DEFER;
 
-	/* If GMxC is present, prefer that as secondary rail for GX votes */
+	/*
+	 * If GMxC is present, prefer that as secondary rail for GX votes. Some
+	 * SoCs list it in the command DB without any level, use MX there.
+	 */
 	sec_id = IS_ERR_OR_NULL(gmxc) ? "mx.lvl" : "gmxc.lvl";
 
 	/* Build the GX votes */

---
base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
change-id: 20261116-msm-gmxc-fallback-b59be82e6c2d

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>


