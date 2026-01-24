Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A32173
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274611; cv=none; b=UjGTH9A9hwDbmxUtDjqiOQC4LbogM6Bv1ri3LrI2/JuOpcaGHzMvZ2DaG3btQHSQ9fU6wHtSePD3tkYIOSlQ8QhTDRi3bLFS2wKGV6X62rLoAlUyUdqUl5jFrnTblWYrQx63v/YEOdeCo7MCxgufFD5ZIZ6JIPe5CYK/ZWxYwb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274611; c=relaxed/simple;
	bh=RnZnHJ18fDqVsEwNPaA2WiUlZTCGKnUZ6u053T8HQLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHZ8eLUYfyhLuM4e9xQo+p9UgHvoUTO1PM6p/aT4kq2x4eQvwhyM4qJMNA2tNsWOeSLTPvsheWccTtVQG24RhcnJdLTReUWvY6YSSGfuRBi0uTrCGN0rDGXcodD9dMMC+PSUOT8mPxPhow8DoPaEXKQkum2rPh861W6h854VhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm1Aurr9; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm1Aurr9"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b884a84e622so480922966b.1
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 09:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274608; x=1769879408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pCr4Z+KNekDJl9rNVi/bQ/zDL8gFwd9M77DGpXezgFo=;
        b=Cm1Aurr9Mryc3cO1NBVYrS6JYF9PIg52hHR+Ss/irc5ZO4qAYUfTr0MpuzBaWrC3SI
         KQv1dsWqEpVapwdilpyIOOqiigMj9pJYr2XWnXXdIYs2m8igP1ugs3ja0OvPmGMzHKCE
         obW8Rh8h/EiAA6UPH3OCCoBJDxakdlbujcPnfcqa3riiSQnvG0XP6a5SvFTMS0ldAbIo
         oFkPNGwJuZWhww8ZTgKqhE6lBrS6CaemmQddkwAmG7iheRNhGC1iNfkmqK/eGI4CT9td
         tAa2QUvmNz1qGLdi20WODUuSMMBfnygAkvnYUtbw9kexh8N3rYZJbTVcakuy7kRBDf1Y
         HKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274608; x=1769879408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pCr4Z+KNekDJl9rNVi/bQ/zDL8gFwd9M77DGpXezgFo=;
        b=JefWgjLju3sqGSqFUtF1Y9Uo88prBj0yB8k7ZfywDZ3+tQPn5VIcGo712BsjbtEjl1
         oHYAfo8wTkqXTsA5XE8qr71xElp/yRTP5Ld6hGTm7yQZT7JyltMQQF5CtYtI1W7QVX07
         rcqEQ3fGYucOOTi0Wa5+nTXPPYIMHfCPzDEExVIova5o1pl0OJ9DsSWk6tPIS2UChlKX
         shwDGRg8gpdN+Ex+a3DDLfvEBbU3eQDlVux8CxHmOPuUfYQMQ2X1aOiL01Pd4fy4SUsv
         MwhlbfoWci1vovfaQhhKzXIqFunTQlTwZ+ATiX+50eoIVNeUVNOkhZcbkEB0fYrwr9EH
         JiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKLJEtbsplFdp9jlppBqkbTqXq5tRDUNcIXnKW674FzS+7S+EF7HDqqSj8u7goHsk0ySVvREZYDa4rqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0HAqEDQBwHpemgEY7DzXDRq4L6QRiv3to0eYHKu42qtIHxzEF
	xAzk/9fCoBBtnkq5KaJwWMIXIIyh2hDKXhJZpYZGuBM81jdBd6KJ8TEj
X-Gm-Gg: AZuq6aJdWlnbRH0BGACmd7lded2iQ0BspQbiFfwqfFit8jpTzUT1tJGSwaM53S1HJvp
	KM6dG5yOpvtXH4Mx2fllyKgevpZuBE0Uw+ImM7LGo5h72EtjiT669dGd85BPVFfS9D3Ectsn+oh
	RMRRsFbQLYIn0BzNi6Ro7UFyt4Dn2Ik+p9oG9AXZ40fYz6DoGVGzI9ED1OvKdVpmrhJKpbV3H9p
	4KMPQpOUulJEm8+yAj5VICVJYFILfB6pKfWQ9RdtIe04m995RIKSRtE6MfsFKing7apUntb93rK
	JUzBe2THojEquwF6/ZwFn+6h4dgB55qP2k9d7BarrSYy8nCDzTar1S0YeUBANTAWcK1ZsGEMeuR
	YPoVrhG1dVVL4x5fcNHlXBVpBWB34YZZrHtwpT5kPlBEATeJOZ60v9VWGMGGdknScbV2S8hn1B1
	hfTfrAP5pS+LQKaXXcVPTm8ON3Ku8RrGkRJ8HUkUanUE0uxw9iRQC1utNVOWa3xWk+BgNo4foPn
	8v52X4tWGG6vcX0oNyfgdWMKHWXsTds8/M=
X-Received: by 2002:a17:907:a0e:b0:b87:3174:9bdd with SMTP id a640c23a62f3a-b885acf8808mr447577066b.28.1769274607425;
        Sat, 24 Jan 2026 09:10:07 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:07 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:01 +0100
Subject: [PATCH RESEND v7 1/7] clk: bcm: kona: Move CLOCK_COUNT defines
 into the driver
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-1-9dffe1bdc08d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6586;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=RnZnHJ18fDqVsEwNPaA2WiUlZTCGKnUZ6u053T8HQLI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr1FfqMnbLwusKMWrFf9hyK50C1HihRKIDm
 VXJZSKRX1uJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aCNPEACRa37WLyXaHqvqbwQAIll5LXDadSUTIlgrnwipH5Xj0Ogo5qg2N9Rf5PUrYR4xytOry/N
 /TLk65+/qtUelfI/7aX+v6uwPe+7lTGlu0FV0bIrtrsWU/sfpk6QwHY50jPtTZRVO9cUCHmqpnD
 BOyZCninlm4HT9+HvChhFY9FDkB0N1EmpYec/Fi+ai8hvzXK7nKt572n/OwfuPG9N5HMLkTNCEu
 7h4MAID0AWjOIR7fJquhV63bwecRCrhih8a8qZ7YntgauIyTE9G0XzZRKCP5m5nt2bzAenlwsf8
 mW4JTk20WIMQ7lFn3whGcGQw+Vcs8wkVBMicMKrulmJFWnQ8OdpJ8r+SwGSLZtXnJOKUIvx3rwm
 gE9owDqetotvhHVUl2dAWhSOu8vqAqcsJhAAZB/T+rRYaugEL2pnG243+Ru5Z1PwHJTWb2Ajnoc
 Brg/i9RpjEzRAkyIjOI4L5JZJtXagWxG4ToAkXf4DTKkBfufbVDM3+boBjjd0y7DK8fITxryTGd
 eMbVK4Wr3jDOcc8UGVOWd3GJtSFemT+pYu25uvnaNchAkU5iok0UA+ALYZiDSyfzdkxSHPlUWtH
 0ai3PiIDLRRR/FGB2H8NcH3I+wQmeiozETzgSmTKkkdJnk656/AFALFy/I6oF4347t/rfLFdRFI
 5xyO320dS4ZIauQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

CLOCK_COUNT defines for each CCU are stored in the DT binding header.
This is not correct - they are not used by device trees, only internally
by the driver.

Move the CLOCK_COUNT defines directly into the driver in preparation
for dropping them from the DT binding include. To avoid conflicts with
the old defines, rename them to use the CLK_COUNT suffix.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Rename CLOCK_COUNT to CLK_COUNT to avoid redefinition

Changes in v3:
- Add this commit
---
 drivers/clk/bcm/clk-bcm21664.c | 16 ++++++++++++----
 drivers/clk/bcm/clk-bcm281xx.c | 20 +++++++++++++++-----
 drivers/clk/bcm/clk-kona.h     |  2 +-
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm21664.c b/drivers/clk/bcm/clk-bcm21664.c
index 520c3aeb4ea9..14b7db824704 100644
--- a/drivers/clk/bcm/clk-bcm21664.c
+++ b/drivers/clk/bcm/clk-bcm21664.c
@@ -17,13 +17,15 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM21664_ROOT_CCU_CLK_COUNT	(BCM21664_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM21664_CCU_COMMON(root, ROOT),
 	/* no policy control */
 	.kona_clks	= {
 		[BCM21664_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM21664_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -39,6 +41,8 @@ static struct peri_clk_data hub_timer_data = {
 	.trig		= TRIGGER(0x0a40, 4),
 };
 
+#define BCM21664_AON_CCU_CLK_COUNT	(BCM21664_AON_CCU_HUB_TIMER + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM21664_CCU_COMMON(aon, AON),
 	.policy		= {
@@ -48,7 +52,7 @@ static struct ccu_data aon_ccu_data = {
 	.kona_clks	= {
 		[BCM21664_AON_CCU_HUB_TIMER] =
 			KONA_CLK(aon, hub_timer, peri),
-		[BCM21664_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -122,6 +126,8 @@ static struct peri_clk_data sdio4_sleep_data = {
 	.gate		= HW_SW_GATE(0x0360, 18, 2, 3),
 };
 
+#define BCM21664_MASTER_CCU_CLK_COUNT	(BCM21664_MASTER_CCU_SDIO4_SLEEP + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM21664_CCU_COMMON(master, MASTER),
 	.policy		= {
@@ -145,7 +151,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, sdio3_sleep, peri),
 		[BCM21664_MASTER_CCU_SDIO4_SLEEP] =
 			KONA_CLK(master, sdio4_sleep, peri),
-		[BCM21664_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -225,6 +231,8 @@ static struct peri_clk_data bsc4_data = {
 	.trig		= TRIGGER(0x0afc, 19),
 };
 
+#define BCM21664_SLAVE_CCU_CLK_COUNT	(BCM21664_SLAVE_CCU_BSC4 + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM21664_CCU_COMMON(slave, SLAVE),
        .policy		= {
@@ -246,7 +254,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM21664_SLAVE_CCU_BSC4] =
 			KONA_CLK(slave, bsc4, peri),
-		[BCM21664_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM21664_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-bcm281xx.c b/drivers/clk/bcm/clk-bcm281xx.c
index 823d5dfa31b8..62c3bf465625 100644
--- a/drivers/clk/bcm/clk-bcm281xx.c
+++ b/drivers/clk/bcm/clk-bcm281xx.c
@@ -19,12 +19,14 @@ static struct peri_clk_data frac_1m_data = {
 	.clocks		= CLOCKS("ref_crystal"),
 };
 
+#define BCM281XX_ROOT_CCU_CLK_COUNT	(BCM281XX_ROOT_CCU_FRAC_1M + 1)
+
 static struct ccu_data root_ccu_data = {
 	BCM281XX_CCU_COMMON(root, ROOT),
 	.kona_clks	= {
 		[BCM281XX_ROOT_CCU_FRAC_1M] =
 			KONA_CLK(root, frac_1m, peri),
-		[BCM281XX_ROOT_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_ROOT_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -57,6 +59,8 @@ static struct peri_clk_data pmu_bsc_var_data = {
 	.trig		= TRIGGER(0x0a40, 2),
 };
 
+#define BCM281XX_AON_CCU_CLK_COUNT	(BCM281XX_AON_CCU_PMU_BSC_VAR + 1)
+
 static struct ccu_data aon_ccu_data = {
 	BCM281XX_CCU_COMMON(aon, AON),
 	.kona_clks	= {
@@ -66,7 +70,7 @@ static struct ccu_data aon_ccu_data = {
 			KONA_CLK(aon, pmu_bsc, peri),
 		[BCM281XX_AON_CCU_PMU_BSC_VAR] =
 			KONA_CLK(aon, pmu_bsc_var, peri),
-		[BCM281XX_AON_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_AON_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -80,12 +84,14 @@ static struct peri_clk_data tmon_1m_data = {
 	.trig		= TRIGGER(0x0e84, 1),
 };
 
+#define BCM281XX_HUB_CCU_CLK_COUNT	(BCM281XX_HUB_CCU_TMON_1M + 1)
+
 static struct ccu_data hub_ccu_data = {
 	BCM281XX_CCU_COMMON(hub, HUB),
 	.kona_clks	= {
 		[BCM281XX_HUB_CCU_TMON_1M] =
 			KONA_CLK(hub, tmon_1m, peri),
-		[BCM281XX_HUB_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_HUB_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -172,6 +178,8 @@ static struct peri_clk_data hsic2_12m_data = {
 	.trig		= TRIGGER(0x0afc, 5),
 };
 
+#define BCM281XX_MASTER_CCU_CLK_COUNT	(BCM281XX_MASTER_CCU_HSIC2_12M + 1)
+
 static struct ccu_data master_ccu_data = {
 	BCM281XX_CCU_COMMON(master, MASTER),
 	.kona_clks	= {
@@ -189,7 +197,7 @@ static struct ccu_data master_ccu_data = {
 			KONA_CLK(master, hsic2_48m, peri),
 		[BCM281XX_MASTER_CCU_HSIC2_12M] =
 			KONA_CLK(master, hsic2_12m, peri),
-		[BCM281XX_MASTER_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_MASTER_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
@@ -301,6 +309,8 @@ static struct peri_clk_data pwm_data = {
 	.trig		= TRIGGER(0x0afc, 15),
 };
 
+#define BCM281XX_SLAVE_CCU_CLK_COUNT	(BCM281XX_SLAVE_CCU_PWM + 1)
+
 static struct ccu_data slave_ccu_data = {
 	BCM281XX_CCU_COMMON(slave, SLAVE),
 	.kona_clks	= {
@@ -324,7 +334,7 @@ static struct ccu_data slave_ccu_data = {
 			KONA_CLK(slave, bsc3, peri),
 		[BCM281XX_SLAVE_CCU_PWM] =
 			KONA_CLK(slave, pwm, peri),
-		[BCM281XX_SLAVE_CCU_CLOCK_COUNT] = LAST_KONA_CLK,
+		[BCM281XX_SLAVE_CCU_CLK_COUNT] = LAST_KONA_CLK,
 	},
 };
 
diff --git a/drivers/clk/bcm/clk-kona.h b/drivers/clk/bcm/clk-kona.h
index 348a3454ce40..d7cae437333c 100644
--- a/drivers/clk/bcm/clk-kona.h
+++ b/drivers/clk/bcm/clk-kona.h
@@ -483,7 +483,7 @@ struct ccu_data {
 #define KONA_CCU_COMMON(_prefix, _name, _ccuname)			    \
 	.name		= #_name "_ccu",				    \
 	.lock		= __SPIN_LOCK_UNLOCKED(_name ## _ccu_data.lock),    \
-	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLOCK_COUNT
+	.clk_num	= _prefix ## _ ## _ccuname ## _CCU_CLK_COUNT
 
 /* Exported globals */
 

-- 
2.52.0

