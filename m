Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A613F238C0F
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769274613; cv=none; b=aJ8zSO4Y3qdKrPMA/7d/tjRj8iQqyBVWiGWBiEWSjroHBAYGDNmY3eVWxj9LcD6wsvYZjCLjnrXK0BTZKZZqnU7dvlUH6MGioKfxWzJT9yFKIFxvdEmJC6S5tKMfT3C1xlajgteK/Hrx6av8lpC4p8uwzA2evthtHdK7d6lchL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769274613; c=relaxed/simple;
	bh=oiXhK2A6qAjCeSrQjh8L1wUGnhbIoDCcnIty1f+TnrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vz/PfrnmN+3aqFSpxnWa4V3IKgn10Ks1s25xw0y1xQXgbKaP2E9HzTxP2iLpr1XlgF4lktOo7k49Xtfff5HJP6MKZ0ihyTbqUcdsWLN0lESWTQORkcNoWqVzSLScQlanmzgQnOL44KJNhJTyXdyI4QO0y//fVC7FypozoxSy6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zdem/cg/; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zdem/cg/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-65808d08423so5040803a12.1
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 09:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769274609; x=1769879409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=Zdem/cg//zU0udbZVMoQs6TQC73Edrgm4zyyNWjfns+5Zp2x++qC6+RPJ9NwJJlbMt
         gJfqtcwhSyxN0VQyHYu7ZSXV/SdhxNjCT5wDtLt2qQwK7rWa6RXb4zui6hsZcN3fXIIt
         LwecRBIYwIPWMZhHEf1d4LSSEgFqufNzMWBrjRu9TBRmtJdsq/Ezkc1PMG9fEQhipYKD
         Huc0fxTLQA/Upwvk/IG3D9mI0XJ5tqPTzlYZGV4hgFKa7nW7RPZGkYanSDD3Hfb97TZ+
         cwaj+17BsWjX6lfuMw7aJKjgOmxknK96DuCpD4gBN1fTWX20AtsfOIOm/bbwrpM+Rlod
         NxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769274609; x=1769879409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4g1bUiTF8Zalft/CuDyD9r9NogcjeaI005neN/bl1w=;
        b=SxGUEhHTGo1ppcUvGOmjEvJCFyxk10FVLXp4F9/H7Z08VQTSaBDN5HB0sxpQPn0g3C
         hFF2NJnb9o6vLOziLsNacuCx37+pOzv2kngWpNJJjtODAhw/o0pkgssiMMNlgp7o4ekm
         +/VVSENnW0hGpeHNY9jUGepKMVebC8xOs0Ev1X5aIytZZemEjCbwYF58CzndNCvEvVen
         zuT9+MDD4gW1x+keVWezy97py4EGy4oLlLww01mMC7xeq/6AwMb6zD0m6TeV8Iq1uqfa
         9MH6DnLvCmXBzEVCpi36RhTG+ei2YJsi7Fxj2j7/eZGZ64Lbsy1Fe52g2D1Kq3r7Fo62
         sCMA==
X-Forwarded-Encrypted: i=1; AJvYcCWAkJAdprV5w/ziB5eO+ZJLZc7fdhZTc0/+9YDpZ3gcpKk42SX+9gFrvyVTLGN99c11n0M8XhpnWYRYdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mhYHzufWzWpKkvyu7AT7iuIMqeNnulR4zcGXPcc5+IA3mj+D
	Ljm994LoKt/5QgDvIqPXHrmk4IGuc3SMTFaFFuv9JaUiKmpnaJR50otwwcSgGQ==
X-Gm-Gg: AZuq6aLy9/VxCsbXQuvOW9JLC3iPqb8aqfqHUNS7M810MxLgcHBGarM7lMbCbd/nHwR
	1NnOkMTOv8I2nZS6I8zLCq4lrgw8ele9fdv26Hy1cNW4LQLLKON4quY7rC1/5RkgqRsnE5ZRgw/
	qKLH65n6SeFcG6XNmlo8DeTfXjcSTJDPg/7lN4BdJCiEbf7vLgBjG2Xg9drb/HRlaq0WeLkkF/W
	jmVu2YDbeikz2OKirKZ2HwbGCD5O0Wvxqwy7edMmpiNyhLwePM14nD3dxQve7ZIshZxjCeYpKJl
	5L7gvsPXW/hdZUHks0bV0ofvV3o2bexqwbBL1hikoPY0uvpc4M+UTHldoGBxClin3zy/u6JWU5b
	KAm7AIzRoe90e9T+oLnHiLlYi92XIOpu3VRCAYoN15pbQG6a+AJwkBlhrrQTkD37lBmfB5coM20
	Zj18mRuKuQiyKSoSJwg3Cm5Ty7RmoiVXrk0pkWQ4uPn0mGRIzcCueWNhmheAkIyxRf2Pmetet1y
	+XOfhYY+jsrESK/pl7PuaIHiZrUZdGGqeKGWuBFJqq9lA==
X-Received: by 2002:a17:907:d91:b0:b86:f0b4:4974 with SMTP id a640c23a62f3a-b885ace961cmr524530866b.26.1769274608550;
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
Received: from tablet.my.domain (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dac6esm302680866b.7.2026.01.24.09.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 09:10:08 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 24 Jan 2026 18:10:02 +0100
Subject: [PATCH RESEND v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-kona-bus-clock-v7-2-9dffe1bdc08d@gmail.com>
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
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=oiXhK2A6qAjCeSrQjh8L1wUGnhbIoDCcnIty1f+TnrI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpdPzr84AtMz8e9EIpfABMWvoSk4kv0vtrP8/IL
 hSvXEKVnzqJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaXT86wAKCRCzu/ihE6BR
 aMKEEACRNvmrJFuQDxrjGretSv/T2u+KJjPG6EBnz0sOxMNotQ2zoZFowKVbvvWbOzYW3ULYzjb
 1rML6Y8keRWjGapqEu9z42FFjJTbjM3Iu5gvTYraySovyj8GHrc3mHYbpCe3YiNkJNYaBE2G4mG
 9VHUniRuqF4lH7cTsh2BwzyOx9Or243smDt97LqbOA09fmGhDATS90TvVfQyLqd1nVhynho+URe
 D3kpMqEFVZWLNbZtTwRdJOEg7bTAGtM5YbY88EeNZHx5faZ9YEWrDGNlD+gMKbYvLnQmUcENox9
 CYSqQKH0/Vg4pVEw3gL0YtsQaioTVg0bXaOQPBRjbArymJM63vMLs9+IWZVbixCqEWjCq5WuVYV
 FGyfJGWxzyBpA9PxWSfeqiv3IsKFSFOosQYoeuv/qXTI7Ctw+EdlbPIzgByH5TW2uJE3SXAHlE3
 WisKISiz0BkCdmVvApNbKHvUrKapJE4b+A/yjVp6EMFvGroI+ZwEC4vpWWvkLsLNGTK/bxFrQt2
 s0i3BmrQiKHqRIsjkiel6CSuw7FGOdt3WRw69kZg/3yiAklm7lO2Q2/mspsGo1WbdYp8d8EcyXf
 vO0SbxHYaOx5Ocylsd4WtxwRoh6Ps4Zq3YJQStn3VEEbnyTjes6nm5NJoljXJcu7wW4nXEhfyQD
 BVjWHyUOVW+jx8w==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d..7a380a51848c 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e7..0c7a7e10cb42 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.52.0

