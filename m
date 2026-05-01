Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050CB3815F7
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627130; cv=none; b=cjTRTf1SCkAJJ9QLCwehGBWET04fiTmcJ1fBWpWE4npWfRcHthFfmSscHPkl9HYWP5stvzyuJnqzgzUSWtCW8p6ZsYFwM9hcO/eqfeZj7mJTzKDxcIZzDb2bInp8IA07UIysjec7GgC9V85QWTC6ItDd60qlhYw0qgaBeZYkKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627130; c=relaxed/simple;
	bh=2GM8iILc+e+kkT8uuqti/v0hmU/nmTpy3cu5qfGbOaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyX3UrW+WBff5RzfW+vrn3en5Whn4AugcLIo2wuHpikSJwfwM8Rur2yHsKYPr99A8RsLIJE5Lk0gyvCQPvLsolzYrOa4nonWwhqvN2j4Ru7Was5sf3Q5g/8QEymS/lWXuyODIMIaLRDsWhj2HmaZdHbm4m7r+5NR4QGjzXUhTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YmrYNVfn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YmrYNVfn"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso9435805e9.3
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627121; x=1778231921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXg42DnzNUk3hE0wclWkHErZDdBr7JTlVE52L0ztars=;
        b=YmrYNVfnw72jZIt2c0uqKrT+3+lXkMOlS2HMnVNKR91b8Ng0mp5vU6j8g8AuAdioC+
         v1GpGBXJ+5yYUH+d/wjTAaffPs8nAL70XNS4HB2RA/E4efeS3OOmdL/4xyjQndHVBr6a
         mXMAnWmr8pxhsO8Lll2KKtOjrOEMbT28VR96RsjH991FRNKtIDTNgBmW8KUiP0+bzZQs
         ITumXlWirX8x0sH6Wm6zOVxOK3b6HqQ+iYVrkJLskuGZ15VtaPJSanYNGWCjwpZWYYTC
         k7i/SrWL9jzWEeuINfEEyKGgTqWV99ZkHf0scLxIdFcmlHr37aqwg8EShaAxFvDeTW+p
         X+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627121; x=1778231921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wXg42DnzNUk3hE0wclWkHErZDdBr7JTlVE52L0ztars=;
        b=kM3bGEBP1Nhz60L4ethrfCENTYqBw0hR/CBKTonFw8Em2HMu+t458axSfslKs7Jm4D
         ZxyW8PQP8JIWjntRWXf27AFBrjnhfv1HwWOBXboJQ+9wbpu4UOk6P5x/cfQZBTIxjx0N
         /bGtoffrawJJZUuW6EhCvfbTHfSxQjGwzko9mjnneb4JxKDs5uqkcv35CIotB1PhQoeY
         iHPKL9GYMOpRAFKcRMm43h6GYhgo0iPmzkiy5OcBIXsCuMmTC8JCdVCYCRXgi4qck0D4
         rKRoQhdhsYTx2/skk2vXAq8H/kilr5SNVMtFlaQEN6B163Nm0Zxa6cJ/z6VI/GGHGwPg
         ULuA==
X-Forwarded-Encrypted: i=1; AFNElJ/Qm1v0Ug6NJMCzYBTIymmk5iQ3LFv9XRFLdcakRd/FRH+TPZYHbQklXeGLfbSZJ7zV9FjSETYcrdM9RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXvj/LgVVQCSQfC06/oDHv3iXVH4YGG2rPxf/hnm7GMErJHg7
	wgUc6e8l2PSgQ5hAeeD11vj2aTgew9hRyIR1DXiK0Pey1XHelBaeH1BpGFU2VEqDxfBKluTfVCr
	UgsnuD5c=
X-Gm-Gg: AeBDiet3WDWm6IZOYMWTdDPOpfjJNNYkxIG5TeRVPHL3TEuUAZbtFJ6NIjnEmjuGOe5
	UOdFsdyKaWB/145E76AEmvbLaTs/Nkcg8BZV5CRzidBHl9/Bs3bPVY7uR44dNU6YojCIUcBd5fy
	BwkB5ezbyz0KFbbxy30uoRMdiS3KnxzINinal7lyIXLH3n+/05qQT3x2Zv07BO1K82L0uiRuWfO
	LiRVB6Y/TK72WOzpYzwy7a3sDJW4g+mr9dPmvMfYbvAbbEpfRRrgB58cKF+KHvjfVT8OGEFbDqA
	HCgyP8R9seVXqRF2r/PClR6yH1SO+ED4F9tgIlMGcydrRqItL3k91mb+4q9Busj/eUQo+fn1pIt
	ND0K52M3MZ3Y6pDCwXYnajHLaph5ew3WxcNvoe1iqpo/WpDhZNbnJ+pACwjNYIbjqQZVfvjSIRx
	EADMfBbCd4vu2GhAZ1VnxxqULv6BI3TRc1D98VNheG4NlxKyRCrXD3RM5WrPRQpKkEVLNrd/Y6X
	IKOVjTB
X-Received: by 2002:a05:600c:1387:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48a84459c6bmr106593135e9.20.1777627121640;
        Fri, 01 May 2026 02:18:41 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:32 +0200
Subject: [PATCH v2 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-4-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1070;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2GM8iILc+e+kkT8uuqti/v0hmU/nmTpy3cu5qfGbOaA=;
 b=ss53KXLsizSBDZefj9m8ibIfFPWlpBeseS1W+oUtlxEk5L8svzteRZ/WbyCg0wJBSBBFKL2do
 0c2CAgCXk+GA7HnF39rz7yQBell0BW+k4rUJuacCUZNB6/7gJ1B8s+l
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This GDSC requires an interconnect path to be enabled, otherwise the
GDSC will be stuck on 'off' and can't be enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-milos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 409d47098c10..579b71e0e089 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -30,6 +30,11 @@ enum {
 	DT_IFACE,
 };
 
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -1971,6 +1976,8 @@ static struct gdsc cam_cc_camss_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct clk_regmap *cam_cc_milos_clocks[] = {

-- 
2.54.0

