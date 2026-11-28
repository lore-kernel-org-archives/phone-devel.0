Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795840604;
	b=SPEoFOgFOO59hRa9VGKbtQ6ffLhLXOo2B0WGmSyB/XCCa36rbp3azZ2hNcbP3TMZp8Dn
	 1cFafHMLMMroyf81RRyKgUQW3fqr58CoQJFCCLQ+gdoIVsISaMwoygJYhTa3OV1WhqV0m
	 yxtB2dt2JlO1pA5lj5kepo7x4XX8EYS7/VEp6VBBiU1C9eoUNlwgUhCofMpynpJtEoGmB
	 KeN0mFbM81ZfVKB3PRo8AoVSpGew0uf+pEFBrEPYqCyjYVYWHEWFM+sQPo+m00Ahoj+p+
	 iPXhz8eJFA14qcyAKJN+izPwJuRoydSdmYVrOFg6CjKtV5/6ZNOWRldgiCl7mWFhM+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840604;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=;
	b=fD3heuqup28++Lf/rLUK7C6S/pIidvji0ZHCyJJJ1SCp2OWSdX8AJ90neoB8ZtYuf12T
	 oajCsSyajhWUIHH1w4iZzWDU3UHiPZW26aUsXATNNZ4gU2S5h0xs7PPdNDoMv4Rj9XemK
	 NUl+ancMzEgHqsJZUYjsqPItjgmfd7wa8Zh9gS3p6V/XDmPv8nduSwDMC86tK0XdNzsjV
	 PAnZK2C8g8QtPnelgonmjD2RL+MNTYDGRpK3kl8/7WxBoa5PiSiSfuJJxZggUDfqbG9du
	 0r7GJv2/0BFQ2baWuYRArb5iLT3HTQxURU3n0BVRUTTzo2bR60Ue5nf3DY+9ZadcQ/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgZytO7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7667606A31C;
	Sat, 28 Nov 2026 04:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IgZytO7z
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840603;
	b=qlLjLvaXjUTv721nX0dEHVNIqizxJs0sC3myetgmHLDy4C3BGd8aq1q3y6VYlcGnFB3+
	 C13lQICW62mxmJ8+vatZMnoWq2Q0w1NtjHkypdMe5O99bL6zZmERulHXuOWa71HJMZRcl
	 0TVzaYKHupzmZ3Nj79T8/tgcOoyUNoGFGtpRetoQ5LmNzT7v/t1bnqJv/u79o5px8Uv7q
	 9CnafP2e9ZBjiGDDXxGrWnKkyXyc8EC2FyImXwAYtOBSBPbTXV+KnH2VQGYt+QnnUiHQ5
	 YcKNmeLH0DkJJlAL9b0doyNJSLb24f5g1k2gSUGVLLCRuCDpCiHbf3QiDCWZ6DEevIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840603;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=;
	b=zgmwiOhurhZuXZX9+i26e6TzfxvAh8IsmKooevUnAWpopBqj6C71IP/UsyRvC1mKYHDv
	 Yr3w3iirS14FRSTiuw4GBxGp2wJHl5LzS4RKOsQ8zCg+S8zUz3ZbM7mbwWXrr8UiGH58P
	 whdfmLrbMSFgJlq3pVgKvbdTwr3lMuzZUwJbh73teejFoaXy9Zw4x3BEp5IUkmwQ45+bY
	 +HxlkpQ0oxxid6NFmewsyvzvAVEAigQnsSn9nFIbMrVtc2m7fRaYqUAe7vbGdEr/l1Gc8
	 OdhmmbFy8Z/qng+v+aa8k9dh/OarfW64mfkhcgILSHkz8lABZK8i+r+KKtsP3smX8+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 623A71F00898;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840603;
	bh=1omq5zaZSNAgQ0lIqwWNv6K7+NNYpic02q8zoYZFr/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=IgZytO7zeSjY8JwAvA+dvrxBTBOsdco2VfX/t2VaWZel2Lkw3s30Z7zBbWPfayB3Z
	 xXaSDP2sNYr4kNQiG1viTMofQW0Zq/wq7ja23d4mMJqb5jRosEvNBnnupkXkB2ozoq
	 qMV6m//UGuRkdlIXbHT4AEtxVMaDkn4qMSOcSgVghEcJrTLXx0GBVkbtfvp3/XJTVQ
	 YNOwIvTKu/MGsmVbOY/uuetYwUlXZSBOf2r29kwHwZR6eI9ukGbKGDgiQ/1s2qulBn
	 wLBuch2HZrnqjTUubxYXpSgiU643a5PKUQo+EiL2aV1doKtfZBV7/T6E9e2OJdQbR1
	 v+kuxRqOAt6cA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E17914DFAB;
	Sat, 28 Nov 2026 04:36:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] soc: mediatek: mtk-pmic-pwrap: Skip WDT source and
 init on arbiter SoCs
Date: Sat, 28 Nov 2026 04:36:31 +0000
Message-Id: <20261128043629.67417-3-iasnezhkov@gmail.com>
In-Reply-To: <20261128043629.67417-1-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=3153;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=Olk5p4P7Ta5NkxLPdczqkMU6NbZVlJ+bSIfjfAU8K+w=;
 b=09LCe56FcQeyMWpC9kqoszJZEOLPk9XlVF/qbSz6ukumQiMkr0Y4A9RNiVGIlx6hhDQkIRBIv
 NRlGn5H1cqlA4dSzAgFOLZysOjWhpNFq4PsvUAgx2oQ5i4zi59yXXd7
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

Commit 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
added PWRAP_CAP_ARB for PMIF-SPI arbiter SoCs (MT6873, MT8195, and the
upcoming MT6789), where the bootloader already initializes the wrapper
and the watchdog registers (PWRAP_WDT_UNIT, PWRAP_WDT_SRC_EN, and
PWRAP_WDT_SRC_EN_1) are absent from the per-SoC register tables.

However, pwrap_probe() only guarded PWRAP_WDT_UNIT with
!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB), leaving the writes to
PWRAP_WDT_SRC_EN and PWRAP_WDT_SRC_EN_1 unconditional. Because omitted
entries in static const int regs[] default to 0, those writes land at
offset 0x0 (PWRAP_INIT_DONE2) and overwrite it with wdt_src
(0xffffffff) on every probe. Similarly, falling into pwrap_init() on
PWRAP_CAP_ARB SoCs would write legacy non-arbiter registers whose
offsets also default to 0x0.

Extend the !HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) guard in
pwrap_probe() to cover PWRAP_WDT_SRC_EN, PWRAP_WDT_SRC_EN_1, and the
cold pwrap_init() fallback.

Fixes: 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v4:
- Rebased onto linux-next (after dev_err_probe() conversion in
  pwrap_probe()).

Added in v3. Drafted with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 11f6f30..bdc0f90 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2553,7 +2553,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 * The PMIC could already be initialized by the bootloader.
 	 * Skip initialization here in this case.
 	 */
-	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) &&
+	    !pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
 		if (ret)
 			return dev_err_probe(wrp->dev, ret, "init failed\n");
@@ -2571,16 +2572,18 @@ static int pwrap_probe(struct platform_device *pdev)
 				     "initialization isn't finished\n");
 
 	/* Initialize watchdog, may not be done by the bootloader */
-	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
 		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
 
-	/*
-	 * Since STAUPD was not used on mt8173 platform,
-	 * so STAUPD of WDT_SRC which should be turned off
-	 */
-	pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
-	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
-		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
+		/*
+		 * Since STAUPD was not used on mt8173 platform,
+		 * so STAUPD of WDT_SRC which should be turned off
+		 */
+		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
+		if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
+			pwrap_writel(wrp, wrp->master->wdt_src,
+				     PWRAP_WDT_SRC_EN_1);
+	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
 		pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
-- 
2.54.0 (Apple Git-157)



