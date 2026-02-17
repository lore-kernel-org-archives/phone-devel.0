Received: from hamster.birch.relay.mailchannels.net (hamster.birch.relay.mailchannels.net [23.83.209.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB7613B7A3
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319406; cv=pass; b=NvvruJpTxjaRagkpQSKNw0xDqlG01c9JL4nwJtNWpXeZQD1xhSWYb9QpijeA8lWwj8522JfJMqiQWhtQH22j/dVp37bTVKTfekD5VnJ+bPiNwvtJbwcYUsqhCtYx9vtWdMA4Ow9cnPkUjUqQweJkO1oKwd9ySU/8o61Yp/4+hjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319406; c=relaxed/simple;
	bh=ytdaFcXhuf+5NxAoeTA7d4RmXmTdxFv52qRp6D/v5yU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:Date; b=jgKKfMBgFBDjQPceEEOqvhAUKMBwwoya09mTm2sBAqGxj+rEBTS8rsaKmFGtta3Yb99mc+htpc73i1JaRiFPVMkE1uK69TRJXn2NNe8MR/MDM0si2E+14znFxu3kDp6ZWW+lW7ZziyOxJqFRbw5GMQzRxevw34xxjtFXuMhoCQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=BiqxZIRE; arc=pass smtp.client-ip=23.83.209.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="BiqxZIRE"
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6F0744C1FD3;
	Tue, 17 Feb 2026 08:51:43 +0000 (UTC)
Received: from fr-int-smtpout28.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.101.118.127])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3FD104C1EB1;
	Tue, 17 Feb 2026 08:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771318301;
	b=5UGdecW4MKhuOhhnbBWl1extsYwLNi+JL/8v7/jkANgYX4HKjghim2KzPW1tZE4pJM69mG
	6801CAffvTuhIOSSx2burty1p6r4iBhGxTcGFxMF5cmtYVjKCOXsa+lL/MOE7VNacByaeI
	dGuKRQpGGAYFhbD0EkFkavlGKezFEwnjsPn3Z/puYDuWRlC/0G6RyOy4ic7fCwykZVtL87
	lvh9IKQBudPr7ds9m2wZNjH53DAVbkDd9ER+v2caHPGKPoH2OAsmfzOO/CEbUFUDvyUWuQ
	qUrLq6ObPIZo3PNI8hfzbbUXSKRZThzIz3hoVMUidny2fwXgIMtcUrEz/BR8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771318301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=7FkuVidjVTktZo2ZvC/3SVuCp1Q/ersFRxLDkB5YrfE=;
	b=gYjSrdrm2GPmI1Wv0VdNW+IemtGrYT7G0NqAnmeZtn1QHFl25m6fiAepGtap6+zqR1rSLp
	+H5z4ySz3bUWJDv9Dh1mXMdMVR16TCB7mFjtU2If/T2ExaOVaDq1wwDU2mRBkhRk3DTEBX
	k7BrNWrEEJs38I1uH8JaqAgiQXR+HyEfGfHzqqmMBHdu7smUUkIzO/FsxrdNszG0tOut6O
	jD6MHEU8uOBemJBNPCAnW9pvxLq7jiQ1+K4oECMnnqIW6YRXIloltkYvB4xOXLwZ5Vm0Jx
	iIUhA68fw/EXR7Pax2R8Ri8EqFCVej1plYCg+wc+s2z6LzoJmMD8mkVmxfyNqw==
ARC-Authentication-Results: i=1;
	rspamd-845545c4df-qwqgh;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Shoe: 566e0f0f435b9a9c_1771318303228_3592018538
X-MC-Loop-Signature: 1771318303228:1441002539
X-MC-Ingress-Time: 1771318303227
Received: from fr-int-smtpout28.hostinger.io (fr-int-smtpout28.hostinger.io
 [148.222.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.118.127 (trex/7.1.3);
	Tue, 17 Feb 2026 08:51:43 +0000
Received: from [172.17.0.2] (unknown [125.163.207.118])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fFYKM036Zz31tS;
	Tue, 17 Feb 2026 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1771318297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7FkuVidjVTktZo2ZvC/3SVuCp1Q/ersFRxLDkB5YrfE=;
	b=BiqxZIREObaNqPjb6/k+1ksDle1YF7sVmG20VsaEULM/4/fFBN3EEo180LRwFO3J/RyBls
	orxmhxQ4GtYHKfd59JnBeo5m8+E+HJvC72RTLOQ3l3qjLQAu6IQOnvezi+hzmI0GF5wykC
	tL60MkhDeazfBHPn5AzuFTuFoPrcNkfQXC/JFXPJ+PAQNbaZxgFa4knNf1vUgXN0gznJzk
	4l505/KOqkCzI5atoTbCoff14iIia/r4kLPDhvIdyfyg+6tR7QBbjX5usNzGzwBmkBt1xT
	xq4gOmrK0zvuo1GuLdXtXfz/OzhOdn7zM+T4YTHrLSAHMw0q3BZZ0ZCQDZ+LKA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH] mach-snapdragon: allocate memory for DT overlays
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
X-B4-Tracking: v=1; b=H4sIAL0rlGkC/x3MTQ5AMBBA4as0szaJNiG4ilj0Z8okKK0IEXfXW
 H6L9x5IFJkSdOKBSCcnDmuGLATYSa8jIbtsUKWqSyUr3G1Y0LsDw0lx1jeSrU3jWqe0NJCzLZL
 n61/2w/t+3Nft8WIAAAA=
X-Change-ID: 20260215-qcom-fdt-overlay-ec6b8d9d2a1b
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Day <me@samcday.com>, 
 Sughosh Ganu <sughosh.ganu@arm.com>, George Chan <gchan9527@gmail.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, phone-devel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771318294; l=1547;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=ytdaFcXhuf+5NxAoeTA7d4RmXmTdxFv52qRp6D/v5yU=;
 b=hD4+Xlyborzwra3j1QC2yHdqnDO77+o9uvbZhI7AbeNF01JUAaTWoVih+I2N8LaUe1vZftY0O
 xZmG6F/I55LABY1Zp8wbiuHTXzxcYaxFyQh/wxnLgYpiJrJ87RLdiGZ
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Tue, 17 Feb 2026 08:51:34 +0000 (UTC)
X-CM-Envelope: MS4xfEIqc/vbArbvMdhTvGBmpyE8Qb9xPIeqal4vXcvIkmI4h9h/3hV3b4DkfZX0y/2v1xJVrqQVNEqiG9PFftKP8J+QeSXRw/cMWd9VktYIRJFyhMC64+w5 syv60uPJW6gzRCWEDVUm3U+Gkk5f4xwuyBHyUJjgvuKn2DRxZVilnmqjLjEUgvO+T662MDQXB9SM+ROuA3Evqdh0JcCsnkksQf0us1hztEGlqQK+NOawMSgL 0LqBB+22K+BO4ww4LZ26YkdHG2LHTynBBEzUKbtt1djaqEbw0FChaoHI2ahGJLejzmhPrZTFOA70M5+3H5+3moDM7cGZdbU0ZhUVgLkSi7kaIO+NPV5zg+Rj BPvb+i9mrF0YeUIIVXAtO6Y6j/lLQa8LY7afnMXvupIsm0xXrI4G8dGj6B2MXsuzGWUPiAtweM5dOQjQ5EfDr6k3rEEYpXO1RcA5vHMiOXDt2hem4iuYEohv 814y/R2AOEY9gjxeqeaKdRp9cVIoYMPUHD/e9hJY1W04mJQr89zLov7iYfmOkrNgpW7ihHRlHN5N/FGPIhFlxxkQaMZHcuSpEjk5vA==
X-CM-Analysis: v=2.4 cv=Gq4Q+V1C c=1 sm=1 tr=0 ts=69942c19 a=QVpbo7x4j/ax8PIbKattOw==:117 a=QVpbo7x4j/ax8PIbKattOw==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=5RnlGvqmMMj8mnXUjVkA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-AuthUser: linux@smankusors.com

Allocate a 1 MiB LMB region for fdtoverlay_addr_r when
CONFIG_OF_LIBFDT_OVERLAY is enabled, allowing runtime application of
DT overlays on Snapdragon platforms.

This is useful for Android-based boot flows where the final DT passed
to the kernel must contain modified /firmware/android/fstab entries.
One use case is redirecting system and vendor partitions to microSD
storage instead of internal eMMC without rebuilding the base DTB.

The allocation is conditional on CONFIG_OF_LIBFDT_OVERLAY and has no
effect on boards that do not enable overlay support.

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/mach-snapdragon/board.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
index 5fb3240acc5a6dd23d93515029a596b5f77ebfa3..829a0109ac7807d692e127178f76d8822d5da5e2 100644
--- a/arch/arm/mach-snapdragon/board.c
+++ b/arch/arm/mach-snapdragon/board.c
@@ -555,6 +555,11 @@ int board_late_init(void)
 	fdt_status |= !lmb_alloc(SZ_2M, &addr) ?
 		env_set_hex("fdt_addr_r", addr) : 1;
 
+	if (IS_ENABLED(CONFIG_OF_LIBFDT_OVERLAY)) {
+		status |= !lmb_alloc(SZ_1M, &addr) ?
+			env_set_hex("fdtoverlay_addr_r", addr) : 1;
+	}
+
 	if (status || fdt_status)
 		log_warning("%s: Failed to set run time variables\n", __func__);
 

---
base-commit: f9ffeec4bdcf1da655a0ffea482062adde78fee8
change-id: 20260215-qcom-fdt-overlay-ec6b8d9d2a1b

Best regards,
--
Antony Kurniawan Soemardi <linux@smankusors.com>

