Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6EE248F64
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274618; cv=none; b=WwxxR9+enW/DA2yLUWaZgbbP7Vn04cm5miQ9uu19ran3aJB4suvLT8wG062UsF/KUXOeZpOcHJbDG5yGPu2J1Tq9f0tsirvLdhoPQENdq8lJmSaxgzjbs+xI6VNucHYinJQGbIbrJLur4yP3EoXuYj/wuSnsxQrvsR7fp7wRHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274618; c=relaxed/simple;
	bh=q4XetRZpWDwA/NUIdchOcpPjBPnX8GimF9SrPpwDUXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m42HeCzKlNJvXuDH+fFsKtJl7XFk8rXcjo5fl8SzBtoSM0ajdToovDsNg9dSaVFEgo2JKF9jupZLY75QaI2OMwhmxaqMaiIaKK5NBkUUQNqTHpZhBMihO0lXJgA1xDGlAwZ68tE1M5nYfiHKf85cpGbg1FGS6FUg/+TOyTWHAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSyyZKIM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSyyZKIM"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso5168131a12.2
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 09:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274613; x=1769879413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpcSO6uERmh9kHErfStBG+F1jw3KRf4ioMZexXinqck=;
        b=TSyyZKIMbBnrY4Tt/g8QeWFjn7Bbkzw/EPP74pWj8uOxbWKyq1vqe5bNTr+4orBKNF
         KNjTKnB9P+pBQ0szU4tLH+NEhcZMET5LSDJVq02+TFD9pWN/uwy/D/fftH7jw370tA3E
         ux6ZJUYlnKaEUw2zUmCcA6iicBrkaWDsQxDEElm9eTC9ASQGh6mJHsD9FseTiBwAJLWl
         OpdxW+ix4A/ObZdyvPFZinVsEmIQfwwW6ojb3gpLhAofSBYsrssD3s4NreKmnLjVqF/7
         AIbw1bG30RqSjft87AiwGVEcD+o3PJRBA6bnthjBlCeXcmBk12BAu0I+m0Quxu4c8jNt
         Mznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274613; x=1769879413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpcSO6uERmh9kHErfStBG+F1jw3KRf4ioMZexXinqck=;
        b=RdJiFv6Id7Oje6187NFcfDIa7+4r6hWY0LE2FhZkfU3qd5XRo54Epdf9Q6HXiydGOI
         pDdM2q07xGRihGqZIj3T28oNUcMHxNVs0PtDHxUAUta16YlRAu5m3bRLubVMjvbtuBSs
         rIKB01WzEDJLQdSD+0O/W6ditOu/6FKw+HTPmvknMWJBPqfls9l7rHahzIJ+gZqchPwq
         jDClEcwEsb6mLW+SiqbYFJ1aN3ecOkaDAcaiQgUE1mb+nscvdgFn4ms40kMzQ0TLzMWh
         FR646YU7y3oyLVZvj/wFt3dTflEHMVlfd9i6EE2OpdIKPtg6m3TR/4Q2T603u98KwJCo
         J1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVb8BP34Koz9jbx9JY40flABNqVIKsjxANbrI2ycUG/G1DMEZi4ZBbCGoA2Vx5hqtu7n2sm77zhBWpXMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhn+UF009lOBAYF5XZIjs8XpglR5jrJuFEAntiT+j0AuNvjj/e
	Mv/iOUXG3Hakl1fkqiZiGvXjE9Nvt4N1g9TLOu2oWlhQqYvd5zUZ/29k
X-Gm-Gg: AZuq6aL00KTD1SbYs2//pVGHeHLycP45252MI4XPCAE+JYoFfN8YsI4LzIcu1xeXClj
	75YGxMUze2QtW6aCkEkOqcsoNRtjocufojiqDyDF2kEyfM9MoGIZIHFdMdsoMerI5ue/bQcKp52
	Mq7aJbUaFvwt+ks7tjByZomz6oUBOJw+AA8THoxG1A/dWoIFwNjBKLPLLJ4Di1dBPu/ThNI8M6v
	MNzB03iO+PWkhi+GieUuinTG+5Z/2n9qfKPsk0/q58fL1a0XYcA3LdcP3bUNVVpWUER7IYPCpQX
	Y0Vmzy8XWjhumQsdfe982GsMEVfHc767LhizeBADAGsoXchANwIliURYb4iptEpQHeaAIWTqlAj
	0lTg/4wQExb8m/tq8ld4dmteJ9wyDDE+t0g7Fe7IUT+ptmGC9f1bJUaBpnkcBaBecJVmANC787r
	lH4gVTVn/7AVnL07dBUGkRiehvicp0CA/I4FbAiGYdmKaWcorxVrVoiuA5eL5yyScz4IRQrDe77
	5G3WlC3PlEQFUklMraTUt5/LU7s36z1JHo=
X-Received: by 2002:a17:907:3e26:b0:b86:ef1f:6d19 with SMTP id a640c23a62f3a-b885aea12camr504527666b.59.1769274613142;
        Sat, 24 Jan 2026 09:10:13 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:12 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:06 +0100
Subject: [PATCH RESEND v7 6/7] clk: bcm21664: Add corresponding bus clocks
 for peripheral clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-6-9dffe1bdc08d@gmail.com>
References: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
In-Reply-To: <20260124-kona-bus-clock-v7-0-9dffe1bdc08d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5074;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=q4XetRZpWDwA/NUIdchOcpPjBPnX8GimF9SrPpwDUXw=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzsTZipaB0JvAJssglW+uuqQn6TvPb4zKnfO
 +a711OvaL6JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT87AAKCRCzu/ihE6BR
 aF0GD/9WCEdT2p7uT45LyY3Y2zUgExaXzKNjUZartepNsL20yv9zFA/B56kWfcIBrYdSQqYw2NB
 4WaKyBreyOOC3soUHaZLNwiGUeOhPmlzfFLT7ZFdms+All15mVOoMi/r/tuAgoE1DBpLMnmQOqm
 1jwal0aTMcq+ZpKCbyGKUQyN4fNqqiqDb11LsK8AjjudZnNNdAYdWSZkgv8Qn5YDHvoe0MXf8XO
 FiIoMy32WBYoKncfT6K4Cb8hLn7mWvCFgzgtRxKHT81PIqN/XfKRtnf3bjiAhaVyV/0px/KBweL
 N4QsXE0EtHGRc0dweT9EIIaRLxWW6+e+gN1mrlebgrdBVheHZwyO1bumxOSMM2EY0gSu6Puvk8B
 yLJMDMlzT6iPRTQ1hoFa7HIOBMMa7ttn/Zb4ePFHr3zppzO5hTtFvQ4hnd9eFgPxx+tICiNkKec
 im6SUUi5l8C160jg2LK42YwSD8ueYrPbvuq9YgPUApouo7cTKL1Q7i1Q6zK63hd4HomPyzV0FWy
 m1Y5/Ut17fcJDX6C96wb5659hjR4GXQY9w4+llHEUuouMa7DUBOCNZfHYLcaFJv4jxOMUnavKaS
 MTpwn8Sd/gQzvPYX6runjo1TTJYndkPigWaIQw6JBIVw9M0OB7pxUriutAr7rh1h7f2/BrKsxi3
 lIXOodxiEcs+abA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Now that bus clock support has been implemented into the Broadcom Kona
clock driver, add bus clocks corresponding to HUB_TIMER, SDIO, UART and
BSC, as well as the USB OTG bus clock.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Adapt to CLOCK_COUNT -> CLK_COUNT rename
- Change commit summary to match equivalent BCM281xx commit

Changes in v3:
- Adapt to CLOCK_COUNT defines being moved

Changes in v2:
- Adapt to dropped prereq clocks
---
 drivers/clk/bcm/clk-bcm21664.c | 89 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 14b7db824704..4223ac1c35a2 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -41,7 +41,12 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
-#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+static struct bus_clk_data hub_timer_apb_data = {
+	.gate		= HW_SW_GATE(0x0414, 18, 3, 2),
+	.hyst		= HYST(0x0414, 10, 11),
+};
+
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER_APB + 1)
 
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
@@ -52,6 +57,8 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
+		[BCM21664_AON_CCU_HUB_TIMER_APB] =
+			KONA_CLK(aon, hub_timer_apb, bus),
 		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -126,7 +133,27 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
-#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+static struct bus_clk_data sdio1_ahb_data = {
+	.gate		= HW_SW_GATE(0x0358, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio2_ahb_data = {
+	.gate		= HW_SW_GATE(0x035c, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio3_ahb_data = {
+	.gate		= HW_SW_GATE(0x0364, 16, 0, 1),
+};
+
+static struct bus_clk_data sdio4_ahb_data = {
+	.gate		= HW_SW_GATE(0x0360, 16, 0, 1),
+};
+
+static struct bus_clk_data usb_otg_ahb_data = {
+	.gate		= HW_SW_GATE(0x0348, 16, 0, 1),
+};
+
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_USB_OTG_AHB + 1)
 
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
@@ -151,6 +178,16 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
+		[BCM21664_MASTER_CCU_SDIO1_AHB] =
+			KONA_CLK(master, sdio1_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO2_AHB] =
+			KONA_CLK(master, sdio2_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO3_AHB] =
+			KONA_CLK(master, sdio3_ahb, bus),
+		[BCM21664_MASTER_CCU_SDIO4_AHB] =
+			KONA_CLK(master, sdio4_ahb, bus),
+		[BCM21664_MASTER_CCU_USB_OTG_AHB] =
+			KONA_CLK(master, usb_otg_ahb, bus),
 		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
@@ -231,7 +268,39 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
-#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+static struct bus_clk_data uartb_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0400, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0404, 16, 0, 1),
+};
+
+static struct bus_clk_data uartb3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0408, 16, 0, 1),
+};
+
+static struct bus_clk_data bsc1_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0458, 16, 0, 1),
+	.hyst		= HYST(0x0458, 8, 9),
+};
+
+static struct bus_clk_data bsc2_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x045c, 16, 0, 1),
+	.hyst		= HYST(0x045c, 8, 9),
+};
+
+static struct bus_clk_data bsc3_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0470, 16, 0, 1),
+	.hyst		= HYST(0x0470, 8, 9),
+};
+
+static struct bus_clk_data bsc4_apb_data = {
+	.gate		= HW_SW_GATE_AUTO(0x0474, 16, 0, 1),
+	.hyst		= HYST(0x0474, 8, 9),
+};
+
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4_APB + 1)
 
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
@@ -254,6 +323,20 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
+		[BCM21664_SLAVE_CCU_UARTB_APB] =
+			KONA_CLK(slave, uartb_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB2_APB] =
+			KONA_CLK(slave, uartb2_apb, bus),
+		[BCM21664_SLAVE_CCU_UARTB3_APB] =
+			KONA_CLK(slave, uartb3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC1_APB] =
+			KONA_CLK(slave, bsc1_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC2_APB] =
+			KONA_CLK(slave, bsc2_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC3_APB] =
+			KONA_CLK(slave, bsc3_apb, bus),
+		[BCM21664_SLAVE_CCU_BSC4_APB] =
+			KONA_CLK(slave, bsc4_apb, bus),
 		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };

-- 
2.52.0

