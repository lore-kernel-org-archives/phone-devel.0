Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795840601;
	b=Ct0WbCyuRwblhkl1Cdon5nLQrv3f3EAFBRUlSsCn79BvT4nkZsSbCK99wXoYYqu1Q41Y
	 AwwoMerGN6bpsAVHGMRs263cYCwGb6ywMVdMYTnPo0Yjh3RLxnFko2VL8cQAWvdBkcqlo
	 hBiOVN8BEl7VvPubyDLNy8pAVdV1eWYSOFZab0PZydSRv+dz6yKB16+wwvI5RVE9XJyu/
	 s28mOT5Hduw41jC96mJ2fG9SSn1ZxxAW5TUROp0jmiJVyqMMJVv/HhoJAY7LoIodiWJfk
	 VrvUOKuSc44Pfr8RtyyXCoARHTiwRHRyR4ILqaatOSrelzMefoWL9vMLz0TG7bhiUvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840601;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=;
	b=KYuBeXV4mpuHaPsQLYnEgMbgdyngEKGeq8qFE9X8xwM0l+hq/LpcTn5V1DeakGDqIXDS
	 dE8sITOjjvVibNBA7So4qqeXgoMhzch4gmdM2H9YWV0w3pB3gkk4ugoHfsp+ni1gZyT0g
	 AM3DhW/+hN22BbfvLBcod+yZOb2wu0P2RYfchByjBh/efAqQdhbsrFjJT7xAvQePhFGnn
	 a1Tct7rqIvMbtIvf0EiDvwUgBohTAxcqyQQYwgITOng4LCnT/MGP33g7hbGea68bh12/g
	 7f/o9KrAtKo4Ajd8wW+ykVsr6OQAAYnxnKd51AhPIqAo22YvxImjbiG12NEBCO3bMLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h/7d7/nH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FE8606A31E;
	Sat, 28 Nov 2026 04:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/7d7/nH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840600;
	b=OJLFQfjNNCanGx5MS4LtMK9nIjme0/0Zfp5kJH5FOrsyGdQ/fJRxKEGlp6wm7GiPzYq4
	 82IuGp6mfMkkoa5s5ffpbkJPnsoXRdZneREzBil1hyHaByMJ1lmT3cxbdxy7csE3pcI+O
	 ncgHwk8zqpT0SR1fT4z5QUDWhC9dLtoFNNac9HNA6R1D6DGcL+STMo1i2UiebKghTVNN/
	 avunHRxRMWh+rKuoMO0s2pzPWI5tkhZeVxqxatJS17r+VbI8sa49fO6bRL5W5o/E/csfj
	 0AF1uzfaAipmwQYcd2hOsAsb5nitJSRY8RXCKcAcHNqN//M/ZcFWXDonCP1wpYpMDeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840600;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=;
	b=FHmrF1NIAfil1mJfgRmozFAQE8NktLgO9kwrM4n30fr8ATYBi4tTDcyvWfRvvrUw78an
	 9ekRK0hMXECvItOrsATfi0EfmtKheZFgw8RApPkgPK9JsCC1YVTkz03RP2+JAuW0NZl0s
	 6ypBJRlX0RgNI5x7Bk/fFgicBvBSrtkl12dvq4J2bT8R06LNfu4oLOb5wZ+TEVsDrJmzV
	 fJ6LrY93ZNwXOX6u4DYp7xLOsqOPThw4HDZn/4mBLvQBZNdpgZRhTE0v6N8jzNcvD+Jeo
	 6TmzTR2WxD5Y5p/uLUTxnuH5mGGFcWpL37MT3S3ezEv9/mHbRkcZQja0X0BOAAM7bbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8138A1F00899;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840600;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=h/7d7/nHps/SidZTBkG6kVWL3e4Gq6IK3Z298t+xf/GgzoJ8KGhQJKjPpkxFYuEDH
	 sKd47o2q15UIGTJhAXfdT+G/fZVxUpF5zosGIOjPDyKONpvFBEVu9m5iBNDhxy1UQa
	 zV35WW8j66FRPv5RwLmDmkb0KJVHs3ghLtznFTcR8H3vArnXZc2KQO0fX4qskOWPGQ
	 qHUrrFyfNcqJoYht1env1vJXdXg9tz3bVRvRX84466DJgAOlOgrOKHatzJ/O82ohSz
	 6NOOHAIaoPNswjX/sfTUD3neFaMom+QkONRwsjJPLROZix0neuxqCbLYblO29vHR+5
	 a0Y3ESORtFJhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E9ED4DFAF;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Date: Sat, 28 Nov 2026 04:36:32 +0000
Message-Id: <20261128043629.67417-4-iasnezhkov@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=3515;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=+pYLSMXwJ9NiQvGwwMRsrRZ23/yXroYxHZhGWwEq/04=;
 b=L0FHebRo+C8oWpE+WDfSYmZh0ikTiJjDWomJelSI/jNBRMdKsuJf28cARtdkOpMhy3ItV0aex
 C4Vrre4bCgxCXWwOjGzWrNUVlQF2+MAMUP0XlcJNRbkFpPZY8BWDCDg
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

From: Arseniy Velikanov <me@adomerle.pw>

Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99/G99+/G100/
G200 and tablet/IoT variant MT8781) SoC.

MT6789 uses the PMIF-SPI arbiter interface with the same register layout
as MT8195/MT6833: bank 3 interrupt registers (INT_EN at 0x450, INT_FLG
at 0x458, INT_CLR at 0x45C, mask 0x180000, matching PMIF_IRQ_*_3 in
drivers/spmi/spmi-mtk-pmif.c) and WACS2 software interface at
0x880..0x8A8. Register offsets and wrapper parameters are verified on
live MT6789 hardware (iKKO MindOne, MT6366 PMIC).

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v4:
- Rebased onto linux-next (after mt6572 additions).
- Clarified PMIF bank 3 INT_FLG (0x458) / INT_CLR (0x45C) provenance
  and MT6789 SoC variants in the commit message.

Changes since v2:
- Added PWRAP_INT_FLG (0x458) and PWRAP_INT_CLR (0x45C) matching bank 3
  PWRAP_INT_EN (0x450).
- Depends on patch 2/3 so probing does not write wdt_src to offset 0x0.
- Updated with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index bdc0f90..a395b96 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -640,6 +640,19 @@ static const int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
+static const int mt6789_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x450,
+	[PWRAP_INT_FLG] =		0x458,
+	[PWRAP_INT_CLR] =		0x45C,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8A4,
+	[PWRAP_WACS2_RDATA] =		0x8A8,
+};
+
 static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1317,6 +1330,7 @@ enum pwrap_type {
 	PWRAP_MT6572,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
+	PWRAP_MT6789,
 	PWRAP_MT6795,
 	PWRAP_MT6797,
 	PWRAP_MT6873,
@@ -1859,6 +1873,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6789:
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 	case PWRAP_MT8195:
@@ -2327,6 +2342,19 @@ static const struct pmic_wrapper_type pwrap_mt6779 = {
 	.init_soc_specific = NULL,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6789 = {
+	.regs = mt6789_regs,
+	.type = PWRAP_MT6789,
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6795 = {
 	.regs = mt6795_regs,
 	.type = PWRAP_MT6795,
@@ -2474,6 +2502,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6789-pwrap", .data = &pwrap_mt6789 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
 	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
-- 
2.54.0 (Apple Git-157)



