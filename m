Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476A38D40A
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088788; cv=none; b=lBmULRr8fomwBdvECnihgp7v5nK7xxuOiXPG5eQZ8EVxpu6XTO5NOnJD2qntvnImPkkWBXRDaoWN4GyD7Rcjov1BPJNAOoHxdQ95b2ZSp302sFwyAAaK75w/LEWYEK8pqQKUh1CrS/mStt3QOuLj+mocB9uWLeRB0kwQ/NArvww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088788; c=relaxed/simple;
	bh=cBrRSZBzfiIs4w5x58DH2PbmvBIdxlF5csil5qzrDsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6GTJtp0FDZV1KN6YuAChqscgABaGyNFthWsIvKx+iQgX9Gbx2jzIi1C6ANrixuJzQuiH03wdtKMu7hJv2+m1E3pOzDiCUNb8KIX6caUY35tQqm3bDJPI9+E+1KvYBu5WNULQGnpuhDkLTImrf2ukfMkJA+a2coqgl0wanPFjgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lQFF84Ic; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lQFF84Ic"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so2431981a12.1
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 00:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088783; x=1786693583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EpUKEhPEwG0aI+do6IyxUOmV1XCnX7w9rc+zv1nSjU=;
        b=lQFF84IcbiZGCBdiLvBfkNnFUuYL/ajqWLIG+Z4vKbr6drhy+ZCRA2a55hDSiMYXoO
         +C7Qw7gJj5l1VIHzW/Lep7Qoc+cr7R/q+in3v4MUcwMlaEsMlcxcfIeE5b047c7E0TZ+
         lU6N/E7JUdv8xv9AbsO/hfzKuIO4nQ0OFVsoaY5PmGhbdTg5os0Kq0LIZAeODu3YZwkN
         9voA4Ixi55g1C3mn17Hf+pSvXb4UYJz0ljNKaiA2L+FuS/ky/DqZNMLcvvszFo26dQkg
         AolKl8IbmyOp91m9BfsgTrGTfvV1GHc9LxgGSC7dEg9UUd3uZh0L7wI9af8SiZ9NPX+9
         VMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088783; x=1786693583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EpUKEhPEwG0aI+do6IyxUOmV1XCnX7w9rc+zv1nSjU=;
        b=DLidzsiDdaHnt9JxAdP99HvFh3Mpa4o64/SSVK4Gy3q7JrDQjd9+XpZm+Ik3GdsnUQ
         7829IvKU6+aeRpcJZGfTluzrYgHV6bw37CVSoJD7DBZnjcYIWeQlzS1+oSkDUcnVk39j
         5UJTfkQz0T55RTMAHqm+3tpCaRyQYeq5VwAWcyFu8XK1nT3jUsuUtjMErw2hVww2SULw
         B/TuEye7VD7xPfy2My0HNnGvcLGq6UcnAy+Xm4Wf2NBBpaz2Z6trejPEiGP+9hgx0jsb
         EVXRpslYoyHzJL7DGjQJ77HtHVrbNJGb5FOob/+XrsdxKKlLZp0dAILKBvVpoMxzVjyo
         KP6Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEtLflGNvD/fAN1V3YXDnLQkNZVzgSIwUuUmt1O+oNhHhRYfmfZqIloN1X3bPK+Sv2VREAbbBbylqMlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3oTxH2RMWhbXcwbwSDN60KTXmSgivOwfE5eZN3bpIk4idpTH
	pSAQiyFZt1lbTeG5QwHN9bepCcYFV1ittZhu0LnyKiLALTNjgNPANtI3Kv7Bkx259Zw=
X-Gm-Gg: AR+sD12K/5mKRFrZSWuHrfwED2ge67rS4TMDrfOQ861DSW/bWC8aS5xuA9ogPdX+pyt
	N+LKsbRFIfGO9BtS9OQhZA4gWq0qyQIzaW253xZ1i5UP3sDfX7sQr5Zlrl6lwBCVeM+iwMNRrdL
	SjFXRXBQvZ5swrg8C1IGN5pfzyg1ftfG/7Gk5jWG531Uk6AQOQFFapE8XLj+rBsYZbOyO6zykjc
	TIXmk8rVrkL+CWZZaKYX+FjqySZWV+mTdlyG8IY1coxl6vHIk5atVPkQGfC49ps8B9CDIxlNysN
	amalJE3/7uRahhE6nts+8S1QA/DYaeZRW5AxhjRz+57Bf7dBGWCIBuxW535M/lvD3RgSouhz96i
	kvy3K6ae1SiWU1gcxc3o0wy9Y45/j4PUSXtMyntPyLG+SkIKMPfuNMG7iGRPYzs/Oi13uPfATyW
	lPwwXwMu6mPYNHXgR2gxUbshPAKo1e1+gU4AnjGW4O0Qv6+19FsuKyH3il8FFviNE6lu3VGij2q
	xpx9wCBaHp+kp/TjZ2Pxkn5K+NFhfeTKGDfTkWERYLCdDGepBh5EQ==
X-Received: by 2002:a17:907:7254:b0:c20:7a96:f7ad with SMTP id a640c23a62f3a-c207a9702b0mr147884866b.29.1786088778088;
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:05 +0200
Subject: [PATCH RFT 2/3] clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC
 clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-2-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1552;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cBrRSZBzfiIs4w5x58DH2PbmvBIdxlF5csil5qzrDsE=;
 b=N5RK0Mk+vQJtchHvyGUtX0e274Zxm5t2vp/CvIfbeU1YsvlfMF5mLo3lZ/iCIWtnXm05kIMcH
 uoQK334M5w1D0lj2DhnDrrbXXfCqiyVYQFbYyD+r9H5o9vf9t23S7GE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: 67121dad6cba ("clk: qcom: Add support for global clock controller on Hawi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-hawi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 6fb5a3db9586..f1b95753c3a3 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -3692,8 +3692,6 @@ static const u32 gcc_hawi_critical_cbcrs[] = {
 	0x67084, /* GCC_PCIE_1_RSC_CORE_CLK */
 	0x43014, /* GCC_PCIE_LINK_XO_CLK */
 	0x6b088, /* GCC_PCIE_RSC_CORE_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32028, /* GCC_VIDEO_XO_CLK */
 };
@@ -3763,6 +3761,10 @@ static const struct regmap_config gcc_hawi_regmap_config = {
 
 static void clk_hawi_regs_configure(struct device *dev, struct regmap *regmap)
 {
+	/* Keep clocks always enabled */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20)); /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21)); /* GCC_PCIE_RSCC_XO_CLK */
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }

-- 
2.55.0

