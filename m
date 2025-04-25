Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29E248166
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583193; cv=none; b=GEw9lVZ8F2DUUfDqRivgA4k9+MlTiaXeOkNjkej+yQjEWi+6jHwc38YqqvJnE1Ve7TBtO6SP/pRHjDyKea+vpr0GhWMX8r7wV4OaYfyPoYApEawOXs+JfLVzE1Ns2m2Lx4+SgLLxfTJw1dZQVLQVHpODBIAhGdLM6zg3dPkyiZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583193; c=relaxed/simple;
	bh=2QSrxoYOverHHb40rXjSOych/UQsUvsE24KdWp1Z4Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGIgtTrQJNsfsWvZvzWcK06Vu1IB8PMbTPPqEUu/rdNaQufXDTphSgnTzKhs2Tv8YfVUVWJPmtlxBCrBQUUUjTfqHMlb7Clb89f1Egt6546tqPEIR1yjwLRaX9dWIZEcInpn3NK6Wana5jUfRUgfbrcXfDVy+aI+q/mI9mYvq6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=su0qQoRc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="su0qQoRc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1578302f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583189; x=1746187989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9xIef2eRnQUDq/ep/HtJdR5E8HKtXe2Mvk3DRjArp4=;
        b=su0qQoRc3X+/uCIKC29xCx6WU0GSNR85BTJcrLjFP8OK20zw8n6yScXxwd4Ba8IfM7
         6jdABIdfXi1olrhrODYPsR2AHE2RvBINTMMz66pjioYY84qBp3TNLj2f7cLbS407PrBt
         73iAb9fUPfZbxCbK8f3MtV3oBeAgJzNkJatISBNmTfMhXnpf6YryVLJNPpqqwLAi1XWY
         r4M1Pjsj36xKghk2h139cNdRZKt48eUF6CDDZZJQkupqTMfoLJgzxOHYM9R6l4YKlK/S
         fzVcYwRVGEZftcn8KNPV2sQvnyRAlt33uoZlHamqS0uuQTwetoX1l7LFhAXBdW54A6jc
         Rgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583189; x=1746187989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9xIef2eRnQUDq/ep/HtJdR5E8HKtXe2Mvk3DRjArp4=;
        b=dYOeT7SwgLqMHZL6O+LWDjajvtD5NfERIRBUapW+1UDEjdKrKmVBwUh3BFlG8LF4u/
         lSg5cpvf60BqRcNeHS78lngWOqfv/CBtnW6ITFKqKZnBcRMBMWkby7KJj/QjdxPhry38
         /o6kRPGwq1iboiWu7saUI0riI3mVaoWsecQ2ol7gwJfHS4LdCeFRP6/JvdgzADxGq+AI
         qBGiTmcDYdRPHDXLVhvfgYq812h3wvrFBaFaZnngj0tJiN64J+WGuQfb6qD5ilXC/zZo
         ziAdoSsff1ZztsU9bXPh4SY1UWMueodBle46pLRW476rXBrYR8W3u00vb8ra2LCjSDlb
         zhgg==
X-Forwarded-Encrypted: i=1; AJvYcCWzRsoziUpv5SgvgxQR2Ve1T/0ouD2RmiXj9dIAA8tDL800boBv+UKYlRUebf3mATvJY6H/it101DqQKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYvIiFMOIPBlbR4ZULKXarZwGOSna3qZBSQhgwU45Lr5Q6p4Es
	7ZNS4OnDuLzkP03BLSsboGt7T4t69mJ/mIb48PjV1Wif1inhbxatd0UPS/3/A2s=
X-Gm-Gg: ASbGncsyZo/LafK+UXIznxzjou2XnL3asl2KPszSjajmwPkcyNRkGGtHGoFAYDiMFcF
	bAghKgrSG14ntS1IKnkuvjQ/hafa3V9G3KoyNPbDXlbEVnek0pw56mjEXyaMjanSDcPEsxq5OsJ
	jqSzg1vYmn2U4Vn28TG+KII6id6ZpQItw/CcPRDPCxxIgHpG920JCT96zddz+83MruI1OoD9yG6
	gvJ+zmERiI6omwClAPB35ZOAyK57SAleETmA5weopnGtStqnoajb7aOHQkseVG0RgExMWLuMM4P
	J7cpBvpjEggz+WV0yCPN3QDQBU6W4nMf3fWlbSwd1ENahk6WNdYTq8HX7NWrcvDELysoO4nuFPU
	zegkc/uu9UP3sMPRxdmUT19kZon7HZ6yD6gXPMhpvQcTw7il6wUU8dZba
X-Google-Smtp-Source: AGHT+IFdoaaVUwJQ74dsJQIskGERtKPhSmCF+6P3bV+kBeyErkr4s+36pIisJfKFyyw0C5PFP6dUHQ==
X-Received: by 2002:a05:6000:178f:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a074d8e517mr1611648f8f.0.1745583188797;
        Fri, 25 Apr 2025 05:13:08 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:55 +0200
Subject: [PATCH 1/4] clk: qcom: camcc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-sm6350.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 1871970fb046d7ad6f5b6bfcce9f8ae10b3f2e93..8aac97d29ce3ff0d12e7d09fe65fd51a5cb43c87 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1695,6 +1695,9 @@ static struct clk_branch camcc_sys_tmr_clk = {
 
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "bps_gdsc",
 	},
@@ -1704,6 +1707,9 @@ static struct gdsc bps_gdsc = {
 
 static struct gdsc ipe_0_gdsc = {
 	.gdscr = 0x7004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ipe_0_gdsc",
 	},
@@ -1713,6 +1719,9 @@ static struct gdsc ipe_0_gdsc = {
 
 static struct gdsc ife_0_gdsc = {
 	.gdscr = 0x9004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_0_gdsc",
 	},
@@ -1721,6 +1730,9 @@ static struct gdsc ife_0_gdsc = {
 
 static struct gdsc ife_1_gdsc = {
 	.gdscr = 0xa004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_1_gdsc",
 	},
@@ -1729,6 +1741,9 @@ static struct gdsc ife_1_gdsc = {
 
 static struct gdsc ife_2_gdsc = {
 	.gdscr = 0xb004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_2_gdsc",
 	},
@@ -1737,6 +1752,9 @@ static struct gdsc ife_2_gdsc = {
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0x14004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},

-- 
2.49.0

