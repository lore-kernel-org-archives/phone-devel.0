Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231DD463B79
	for <phone-devel@vger.kernel.org>; Fri,  7 Aug 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088781; cv=none; b=eQfhsp83YxvqqYtt8VJdQgI8QEvNlj2jRpiklK0tiTEp4U6xWzfZ2vSfMF8FzM33UHjRcXTUKciZxSUEilk5uYqOOoHnsJIAr8gu6lXeTXiQSeJBVg0jb4oow6d2vaJqEBcPYjR6+79hptSaN96XM8eTHNpPdzIBA8fwxVyDOPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088781; c=relaxed/simple;
	bh=xuFI5Q5PVaGG13a653oWxSPz1g51NAalhPKeOlwyekI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTtiOHTtJ5MdR4rTIlikErnSTou1HFqT9L1DT70U2Q2wBRRFMs7EnmUzLEeQJ7C9YKTt0JePIZYfgSFKQFgA7un4s+NDnJ/QgF49BUm21o1Z0qSB7t5u0lAgn65fjegX3EUk/s8qsEbNMmoMUZ5SNo/TP3dRQLN2JbAY9uk0xtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=c2u3/zxz; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="c2u3/zxz"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so4889509a12.1
        for <phone-devel@vger.kernel.org>; Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088777; x=1786693577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUQBHJUBPKqNKadVj/rfrpbmjDMRBzP/h2QeAnKpatc=;
        b=c2u3/zxz+KnYRQYcigh1U/0hqAHg33hbKIvMatAHTEajvXBrlkTo2QF59hrkVQd2OF
         FPdEgW+UeSM32X5IrUwdugR1pq8heT+y5o5fZ52HcsSyRK2YU2MpMN9ARbyPvvJikR/i
         bg468eeeB4hlyfCh70OBDEb3DOYyqd3tovsHoKGeyGZjfB5I0lASjy4+W+5F/Fhw33lo
         j6VP4TlOhRZWFIOZJ5w/Wje6V8GJT5v3vaOG+AuTCTcVWi24KrQNRcaKdHghZO+N+s0N
         TihnlFztbZW30gc6B3i/b1cfxqysdWyeysBHziCZvEZ/L+wd4vqbmqlGDBngJgxDzPIP
         Q2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088777; x=1786693577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUQBHJUBPKqNKadVj/rfrpbmjDMRBzP/h2QeAnKpatc=;
        b=qgvXnVowDpRb+Y6OjfwkrJDGDu8xIubXn/KNRCt5WLeGaikrQDOQzZ8YadY30Za9ds
         7Zb5BDVrP6A6nUqOYpnwWEAHAGPCYuLGYR7U60gaIrVHF7oVu5mHOS0beP/Q5IeJwJQo
         y2eIQywTE5s42ZcXv7oFg2ESfQFA/s1hwfogkHY5v4i8Imgqsy5RxJHx0Z+71Jh9ZT2i
         huMUUP1pgA0Iv3YrdDJlHtqxi/Xqddl22B4hFe4vFexJRA1Xc7tRjaiQk6pLYcscAL9B
         BUjg7HmdQ9BUlGoFkS/R5ZXwxJKLFnrawwFVLl8Nn6zXbqrnS8YGBRY3SYOfNxRMuI9Y
         VSLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy6g1zyrQOFoY2YVeUmIIwq+PQ9hexymT0Ej4fjG6Q6RbFMTjjLcLnGiNXqwYTqa4UoCqBGET+TRr4mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfe+R9BpufzqY2r4e1ZQa/ukv62FFclIahTNMGnBUSP0hY8U5r
	AqJBk/XbVmQApXUvKGSgvTxr8O0gY6Nl0yJ1TgENgAdFMp4HsD4UFfoD6HBH8bqjqWmqMhpihtz
	QGHv39Gc=
X-Gm-Gg: AR+sD12HQb/yQ143ygUV98OOtLJQZcwau0JkAGDvALOGYn5thwv2FodSYqkF/MAV4pQ
	G0EGC49r8VzbzotLZ8NeeP5gUV7nMGTUYIAGDlWGP1KCg/JDuXyoJkQpy/VSNuvkYnZmDFXwb8B
	vH4n4OiX+oB3u1dj5kpcnNDZer78qrcpqai1+j+H0509EA9le9ccsFYe0zH031mljYYXSkR+Nh1
	g6auXyh8QVi5cwA5pQgaEPxVmU9akUCrQOzz9wONvJVU8yy4Qok5IuYWqfoIHkVgMjVoKlzjG0y
	G9RL0RS9vMIaPMcRa8o+DZKXu2suJHileuC1zkGcl8kV5kIA3sUnqz55T5RiCkoeD2rvMwy+ErQ
	YkOBovGLh+3ei/YPlM530F5N0jubrhJxdHs9nW1irrRrlVK2flYEVFzwl3Cak+O/drnk8lfSfPE
	V+2Fzq/6vUbjve/+xjJ3qbmrsBi5m2W8PFIJB9lVJOuj2T6MhRB/GPR8odGu42eAxhDjROZfcxV
	65JhifYCnaJ18alOlg/ne/EgXIBzhHivMRD9XIsijE=
X-Received: by 2002:a17:907:c0e:b0:c19:523f:5a0 with SMTP id a640c23a62f3a-c207eba2525mr104403666b.11.1786088777396;
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:04 +0200
Subject: [PATCH RFT 1/3] clk: qcom: gcc-eliza: Fix always-enabling
 PCIE_RSCC clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-1-5caf78a599d7@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1636;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xuFI5Q5PVaGG13a653oWxSPz1g51NAalhPKeOlwyekI=;
 b=OXG25V5ARtGUJVxIyXDW+USORGyOaj0s9wColp0IAl5AEuF1LG94pyjn+EuvGXuDY24NQTytp
 q6+8ZYpr5E4B3Cw6u9cCqMwEwftg4L1waHGPpbXfiHhvfwOujJ9vvS6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-eliza.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 3e26c7a1e5b5..fe18942a59ac 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -3010,8 +3010,6 @@ static const u32 gcc_eliza_critical_cbcrs[] = {
 	0x26034, /* GCC_CAMERA_XO_CLK */
 	0x27004, /* GCC_DISP_AHB_CLK */
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32038, /* GCC_VIDEO_XO_CLK */
 };
@@ -3045,6 +3043,10 @@ static const struct regmap_config gcc_eliza_regmap_config = {
 
 static void clk_eliza_regs_configure(struct device *dev, struct regmap *regmap)
 {
+	/* Keep clocks always enabled */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20)); /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21)); /* GCC_PCIE_RSCC_XO_CLK */
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core and gcc ufs phy axi clocks  */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);

-- 
2.55.0

