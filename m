Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C1307AF4
	for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362921; cv=none; b=UCCKbn3x6jKtvk/RYd+5nqLBQndHbpdc9iNX6ioieyk5CLSHee7mUWDiGJeI+nV+N65g0QcleTHyWypJ7mTq2Cm9Jyi0/EOFDoBnHNK1N41dRqfi8JEfHRK2C2/4R74uHP1tkmn391ilITyd8KP/SSN/EON0sC6q/Enze58Fdxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362921; c=relaxed/simple;
	bh=z75QJxLEV0SbWN5Xpt8GE0TnWBRNEzskqUz8wVKyHMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fz8lYwMOUyWKWTNCs6JJ0q19tFutwZd7m/rFx215vwotMWE4L1Im0b1jwCMrVJfFX82UhFjSNmyk2Ii5i4cAEBdPZ5s5gO33obMmjY0CuVVQYR4B68BcOXu3hgXKyW29RQbxacy9uSrkvtBnJqjsk/TB5iXUWqGjxOxThJurMv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr6SCHuL; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr6SCHuL"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so6649391a12.3
        for <phone-devel@vger.kernel.org>; Mon, 13 Oct 2025 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362917; x=1760967717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl6F1iZ+nTtDNeb7FVvoataOw45pSnmlttNDisOfUsQ=;
        b=Pr6SCHuLk+lCKTRuwPVQdoJSy6LdF2Z+ppn6hJCjMG/RSyILUcJ6N9aLxaFjaNCPSN
         a+vb0fzZdRsFYjVShL7qldZJSuhrhhbWGnZOiU6kj0+C/iypv9cn7giYGB6y2JqCDIcg
         Kf6Rl+yk7YMWmJOvOv3wRE7CoyBjaGdk7BwvKls8fd49Zf8oNwS14uR7xAEzeQeCHKeD
         2dHI/CC8lrrNE4prWmM3miGMp3ZmC/bS9mg3H7hQWqHqB/RY1bExagFX5M0qAAwfHd0T
         6CbcTe6whgaFX4aJxzHkPCD0Rcne+Rze/4pcBx9nU9Qtpk8eEJwEt0c2PPaEW73A9w/A
         UO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362917; x=1760967717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl6F1iZ+nTtDNeb7FVvoataOw45pSnmlttNDisOfUsQ=;
        b=G7hjElAHPsABwFlmgKQZCgQHuf1EO2C6hgFVlqhiwxUSyzyAGViV9m4woIW7A/qSpk
         70PytiLPMciN69x5oGx8QAXq12IeCD7qh+F06QBd62j905rOFZw4gsfmjoaz+3bkS5h3
         bRSUnqQn5sTwHrwh6bUlzL4TjHG7zy2RMn6tfdA3nfh/x5T8LfpE2CVT+uD9ftvf9rk2
         H+Fexbi2yrwhkvPi5rzmehs87rc+aZn05kX/bFFKwiRf9wZvqlpxFT2zGBwU2lesAnQI
         Htz0o+EeFFPq4DH0Jg308SXo1T28AE2WP+GeyAw+jadp7Wn5bWUOVBTqhRT0lPDjY5Lc
         XOYA==
X-Forwarded-Encrypted: i=1; AJvYcCWd611hi1INjnypDGoTHBaBUG2erynlzhbDbZfEpORnhDc6TNbtz4H5NVkAz2CxkeQ1DG+XkDFzomMhcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXmE8Qs+NazkJIg7N0HQQVX9DViY7pl8xS1A1eRbkBNYVpRMuT
	74a4Z0PWhCeptAChCTfAa68JbmNlOQymsFlSmD6s8WWa1jAdc+gDdPZ4
X-Gm-Gg: ASbGncsHf6rbOquDrrvotOxVxUxHMW/7EKt+ASxlYbqUweOZQHI+U0BUZqxh9u7kvH6
	YD1ZGXSrGMLNlapa1PGPHA9WuN92L8HpXC1o5YbRnNjddnu+W5gCCGX91mc60z2qNp79EQksdto
	yN2Ep7M09zSyHqYhipobFqcYNBp/UfPpArD9WXfGKS9cBYg6iDDWdjIUHCUv2KCrkvTU/m2ncLn
	noqscQFaPLMEKEME3Y+ljpobGrklu//EHwglyfQdvAACPq2pyi3fByXuFXs56/PuGKaBhbTdJKs
	nmdt3KycbHHrPlUNMLCAhKN5LeERkOjI0UnHXPKaTlJ2aAteqgS5s8gwhep0X6USvcRq76dCqfB
	O1FeIcR3hpt4vi4jcT8n/aP0pD7MObaLwJTAIxcg1LavJVDZfsHdcWZntb1lYpibAheXyo/5aN4
	8DkY6QyiaZzi9i4ZrR+LNkvHg=
X-Google-Smtp-Source: AGHT+IH1R3LHTRzGleUVMZwJjjGd2hp2PO32KdCWlPdImEsFvM0BjsAVI0pE+77toFSrcdThRY8QDA==
X-Received: by 2002:a05:6402:42c6:b0:639:ef26:a015 with SMTP id 4fb4d7f45d1cf-639ef26a351mr17316622a12.23.1760362916889;
        Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
Received: from tablet.my.domain (83.21.75.22.ipv4.supernova.orange.pl. [83.21.75.22])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c32249esm8729019a12.41.2025.10.13.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:41:56 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 13 Oct 2025 15:41:48 +0200
Subject: [PATCH v7 1/7] clk: bcm: kona: Move CLOCK_COUNT defines into the
 driver
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kona-bus-clock-v7-1-8f473d99ae19@gmail.com>
References: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
In-Reply-To: <20251013-kona-bus-clock-v7-0-8f473d99ae19@gmail.com>
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
 bh=z75QJxLEV0SbWN5Xpt8GE0TnWBRNEzskqUz8wVKyHMg=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBo7QGf4hJ3fgjKwFX/7o3hjktxSVfcV/Q/jo8cg
 kC+BEfCDCyJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaO0BnwAKCRCzu/ihE6BR
 aKlpD/99hhENXLLXpBuK9pb9P6somzlg12+rIt6+FnH2MKHK7i6y+s31wZLRzguP4L1FXnYSzJh
 BgL/9LR8LFlcaTbOVIX/s7NCiXRIHFEPfceMhScRj4q9PtmVeFl1oU35PGMHBkLe7fIH0pJbSC+
 j4/Ibl1a43ushnOGAAcgxWvcehQcUQSiXqTJCSkoHK/15AcLO0ADeAXrW48K365a5cgpOC1A8pi
 p/f4osfU/TEVvQsOXg0/VJ+rgOR71Al2PaW/Ky2zLlYT5bEQ6PnLHwt5gVu5w4k3kbjEhfFleiF
 R/fHmpWt8f9rXx2NPIq5kWQagpnqN7Fuz2Ga3HrgWcVM1GE8uARBqaNxWLSMuhC58JLYa4tnwm/
 zU9NxuMKqJCyP+TAbrkW6neNA/pTZygKtHQbT+DFF1w0siUhMGuE1T/TUb1B+2oDCznUxlGFDIG
 bqgt3c9JRj5E5Tt/jcr6XTDgkTvgj65zpSu0yeaHqqJo62pauXUxo42EP1haKalH1DNJr7HXvxE
 Q1VAIb+7084ZwVgATJJX3Soe84QxP3csNL+yyQ6GInj5inDrwcu9kF2NDkJoqNSGiZnbzqKWK8Q
 gBm6MIgifl4oeLe4mZ5gcy6hWPhnXZS2tF3/9rf4MvMaKo0ot6+ar3IRNOtP3QhQ9ss99+JbC/9
 kGsTfsTj/zECO7g==
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
2.51.0

