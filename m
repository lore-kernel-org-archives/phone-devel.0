Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7E372B2F
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141884; cv=none; b=EzMj0SNGuiYag3Ld8KD7QdCK8IkL6ZjiIrFx0Bd1yzM9JhXBoKbK/4bH755YPI44YK79gRa7FNrBfEdCTjSQLN3nRqD3nZJF+PzadNIrvo9I65KAjEeJ9QeGUZHlXBbumOVTX4BD3yDLRa5w6L+0ZiDUJi/ufbyn0g1AROoijSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141884; c=relaxed/simple;
	bh=/n90KONaiUk7JIMeCRq4mUrGxJmn4zHTMpFbTUT82XA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KfLg/KK0nxvzZeb332dNSu782BxkCS2pDiL7a+/bW/GbqDnCKFqWwFmgj8xgHh3fEXOIlLwYqBR5BE7sOpNuNqi+ryyQjUdnftIsMRyJLY3nayvz0fcUTTghF0B70jYmJbQIN7i4lqjieP2iVdDEs8FHgTfI2Aj6egoIYq5EnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHvdwkoU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHvdwkoU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74041835e9.2
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141881; x=1777746681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=tHvdwkoUpI1bKAdNk8pi+mrFxRHXnBU9czApjsQTGQpv7asrc8O1ehCubziToXHtIh
         7/mBF8Ah0EdMCYY1SX9Lemzim4TP9JMtKWURV7KENO4fbfVFKyMEL34RfLbFpTVqBR+V
         RVCbcZSKgAxPxaFY8Z1CTDZK1yH/ivCBPgVR0+1qhzoYQqgQDop3vlEXpGsJ9YOitKIN
         0ZbJWHnhvCjZzQWiu14xCQF0Y+NK30ie8ILU0lTZjq+NuPqtB866XTYAyqxgdnueB8OA
         kxcN8vWICCEycwBWRbQiFo7wUUsVaNrHQJ0GjOnxecuFQrZi+93ZpI7guYkfCZwjo1OS
         ipFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141881; x=1777746681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MwoRhVh/3rR1hJbpLGLJ+XRWfZHlHL0UrsHy9moDVlQ=;
        b=WAvA4imwjgyfVnHQj4DA2Yd8ngX5/h0PgazlU/QNn995q1cchlxdIji+FMf+WLdgJ+
         Thga02sl1XoI99LklDpUbk+OUPR5IbBLWwngXuq74IpGRJa4OkCBPOxAPSXy0YPM0dVY
         gKUv5jhLxZUavQi/Qdski7B9dR2dOumlz151/sKudu+nLLECBQfPICAUOjPMMEnNxQEp
         A49nTIH5mPmTUlX7Ofdn5rnWaBsust2x3A+Zw9FA4tpwMS/OVQYWi33pp+UIvjMtcg68
         Nk6ZwuV/SoVkvW2MgURAycxVJmWgvhfVeol1bpD1NZv3r46SlzWbtUcTdu7+DbYpT+MZ
         oL4g==
X-Forwarded-Encrypted: i=1; AFNElJ9C1PFgrmXpedG0KpWM2Cexe/NHfXZBpdQdv9MehBZMwiyOggoERKu2TuNw5OAWxdllHapfGcnYS7MaSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza6ngaC/+LJcHVX44P/LkePPi1OBPEUTdsdpwHhrc9XiCllDlW
	aIrK1GUSUOALh50Ri12XRdY+Hr+hfSHvD7EQ5ShwBn9mDaWf1qV7HHoR
X-Gm-Gg: AeBDievYrmyANuvMj2Ybm0SLmIO9g3abwnMa75Lr1Th2ke9UkKzpnJDZJdC2BXRVTn/
	//8zOGHWRubPTnQcmt3euj9HjK19xKkU5jQTctgeKMVtedfkcByZ5kYKD367p3qr2J6qF+nf8Y7
	sjYiKQKCw+HGajPDgnWkGeFr81EPaTRZO0Yd/8rV2iGoLNixdD+48bKq/HTiLKr7MmfomIUbLy2
	AQZpyg5hh7AUvwj+n2oZdnqE0lH8joweFPI7W9LWvMagUnqQDd6Y0jdCjOVsEi9RjQCd9d+YgOW
	dH0dRsigjDffAS3uI2MNwC34r7uNo1eaQuHO+cVG7gsaYwnKOg9Loti6EDRBHiAUQw1RBR22fQd
	ube1mUSVzUEAE6FFK4PRx98zbBXeNmtoYLtysKSavfepFdFfA40b7sVjLPuv7MEEL4Nu6EbDqUW
	cfDlbrQvoa/GBUkpO+JbBaFIzau3GNLxClETI=
X-Received: by 2002:a05:600c:5295:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-488fb77d12dmr525819325e9.16.1777141881001;
        Sat, 25 Apr 2026 11:31:21 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:03 +0300
Subject: [PATCH RFC v2 02/11] media: qcom: venus: add pmdomains to the
 struct based on the purpose of cores
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-2-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add vcodec0_pmdomains and vcodec1_pmdomains to indicate power domains
for Venus cores.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..1a919439abc1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -80,6 +80,8 @@ struct venus_resources {
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	const char * const vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	unsigned int vcodec_clks_num;
+	const char **vcodec0_pmdomains;
+	const char **vcodec1_pmdomains;
 	const char **vcodec_pmdomains;
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
@@ -144,6 +146,8 @@ struct venus_format {
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
  * @video_path: an interconnect handle to video to/from memory path
  * @cpucfg_path: an interconnect handle to cpu configuration path
+ * @vcodec0_pmdomans: a pointer to a list of pmdomains for vcodec0 cores
+ * @vcodec1_pmdomans: a pointer to a list of pmdomains for vcodec1 cores
  * @pmdomains:	a pointer to a list of pmdomains
  * @opp_pmdomain: an OPP power-domain
  * @resets: an array of reset signals
@@ -198,6 +202,8 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct dev_pm_domain_list *vcodec0_pmdomains;
+	struct dev_pm_domain_list *vcodec1_pmdomains;
 	struct dev_pm_domain_list *pmdomains;
 	struct dev_pm_domain_list *opp_pmdomain;
 	struct reset_control *resets[VIDC_RESETS_NUM_MAX];

-- 
2.54.0

