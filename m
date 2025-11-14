Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FCF3081C4
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112679; cv=none; b=iJ8c8hhSWEMvt9ZtyWZUpraU6/4/3eiT2lMX9ooU1cU8nf7mYGvwki81oxAsdgz6zKB6dOApNs55fRAnLiN9sLzlrDnauRa4OyLHjKKAVdWrnD+kbLcx/KHS5kuON3g0pdIB7M+N7g/HDZx7gQpSMWi08yfLllXeYN5NCoQ5pS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112679; c=relaxed/simple;
	bh=Fokp6DI3ZgvMfeV4tDWIu8AT5pAwNorUHQtwcVcIzSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WC8QaEzNqgm2gPGqPYs3L19aKJdWrVQ2nW9v+6kuKVJg3fe6tUKYcrq+d8aJAOvU0I0AC8t0cHYFBIDBQxeMw4rHfRB1+lYBtqoM1Lf+PCZffB/tbNK5n8O/4zdiqPPzs8S8w9U9GbDy28IeBmS2B6Xh3EZ6ZrxgMjELp8/OwUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1hM7L/cT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1hM7L/cT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73301e6ab5so231785366b.1
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 01:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763112676; x=1763717476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lie/xa7qc7Ek8fm8wHatiECh3EUIgF2lTTajZ10Sa0=;
        b=1hM7L/cTDFahu47ciwkvt0/0DiBw7z+u4kFQeo/IjznMF0SKT5OodGjl+6IP0sthnv
         RidrO9i6rip7ReUFH+O0wz93v2PreHlgKlBUPqIkFuFvGbMHCSSQXYM5TAMk63wm7GK2
         2CQOlJtR62K0E2zlhDfk2S8RTWPa92bt1z0MSF9KiP2/8aYS/acRKqXk+a/06NZCM7jZ
         9pjIJltlu7Q0nNIF+ViNNlG4JW6o9q03Z2w9GcSpVqyMC4jI0+BLmgXkM+Yb2ef8crRI
         3//xepRH8g8qpriND/MEpPG+0Zsrf3l9B5kS5A/l7RP5uMErAf7toNXAj/BBYvWWY82H
         bGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112676; x=1763717476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2lie/xa7qc7Ek8fm8wHatiECh3EUIgF2lTTajZ10Sa0=;
        b=ZS+XsqAHt6k8Wnf1qaXjZmiLBN078taJ0uyvrbQkYtFoPAC3t3o7cIb4Tsg0msdob+
         fko90oQQPGT/1Pl55y2woSSfUNReTPIZyoijEr5wM3ZDu2Fvw0vAqody55Ag+QjOcZEk
         sXj+9rQWynN0hBbSspAOEDZZfE7nXXegIlc7R8i1Ssoq1TaxRhCLHCCKO2bBBVDslGpM
         CO84uvQEXgUINAX0hda6zCguGtEEQ582aRulspJ2fH78q1IkSSTUfCQ+o2a8mcj3b6+T
         pkUBE6YkTvZzFiI9Ar7gCM2w3vXWghF/VriIxaYPEsjlgYVfjZBcmIpnRPU5Do82jK3e
         wFvg==
X-Forwarded-Encrypted: i=1; AJvYcCXa1DIyzI5sVIhrRDlIrQU+EIvT/KGEZzCZEBYmxuvsz0KX+abf3bCJf00N17NE9PVx8MvEQ7im6Ynrgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw43BY4Jfr+VtlrwhtVJ97KQXdu0Cnfnq4T7dyh69taQqoVfXC+
	J0DzfmJHzEp+7mGc4ut0AcwE/KvrzoZwDIPNV7ONmHkKc4c+ffcgrvlkVdOwS0H4ADM=
X-Gm-Gg: ASbGnctN2vu4I3GDjRtB/tXenInewDzBYR4mxE+NLSMennzLtbEcQQSSuvNSTpExtDg
	EiEubPEQ9joPxqBd0Pjg8L+1M8xfoDXaJUyPlfycip+EAi/KdgUFTff/XQLNfRlvlxgiUPvOebQ
	6X71OX5ZjQmAWbMibtls5uFfj4GS7j4ivCiGOV9rOIatOIDU8uCy3Jl/GZ6N4ZUygbrNbCnGnMl
	+8AuwJOI1yVA5pxgaaM6JUOiU2JwH0qEX0WWIsEN4ydDJenwY+LSzh5Sxfq8Gn4+eNgqc1O2eYU
	klo5ohC4Q6oLambZP9gYr9rtHsCQBLJxnthXtdUW3Ph04vnuuPDT7882X8KcRLhIuPdx3rwzCDI
	I3iLmIiyyEKFI7aNpU8dMf/zWmifr3CLeh8Pq7a4KkaQuewO1Ngfa+e6w1raf8/pdyYmn1S4KWL
	p8ZpbELy/QQcASNi9K3A13qpFGmryDPQtvq3AFP99IOwRUmP7Hgf2VumLgnPAAnkktXN7N/XslM
	8XnHlnAc55oH+MfFpqq6v6/s9aHSLeoqnhAbKuCalzB
X-Google-Smtp-Source: AGHT+IGv7NzlJ8vcISP1RXt6QWGiueuxhZk8jTm6UtlmVL0nCoXWqv7iPPstalaD6MWfX/FUBpuUMA==
X-Received: by 2002:a17:907:98a:b0:b6d:67b0:ca0b with SMTP id a640c23a62f3a-b736796b4c9mr211603066b.61.1763112676330;
        Fri, 14 Nov 2025 01:31:16 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm352104366b.41.2025.11.14.01.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:31:15 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 10:31:11 +0100
Subject: [PATCH v2 3/5] interconnect: qcom: sm6350: Remove empty BCM arrays
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-icc-qos-v2-3-6af348cb9c69@fairphone.com>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
In-Reply-To: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763112672; l=1834;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Fokp6DI3ZgvMfeV4tDWIu8AT5pAwNorUHQtwcVcIzSE=;
 b=Zi/RaiK5Rfu1T6AZfcvzDgwPKqVZcrP/SBZ0CWT/bpweCDnz9ti/5N7ygoCFGj0V7Q52oSIhD
 btR+yiyAVF4A23j2WQl7J5dsfrpEoucXUuG5xGZyWAh1oKCvcmxpg3E
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Clean up the code by removing empty BCM arrays to save some lines.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/qcom/sm6350.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/interconnect/qcom/sm6350.c b/drivers/interconnect/qcom/sm6350.c
index 99c435a5968f..246549cb761e 100644
--- a/drivers/interconnect/qcom/sm6350.c
+++ b/drivers/interconnect/qcom/sm6350.c
@@ -1526,9 +1526,6 @@ static const struct qcom_icc_desc sm6350_config_noc = {
 	.num_bcms = ARRAY_SIZE(config_noc_bcms),
 };
 
-static struct qcom_icc_bcm * const dc_noc_bcms[] = {
-};
-
 static struct qcom_icc_node * const dc_noc_nodes[] = {
 	[MASTER_CNOC_DC_NOC] = &qhm_cnoc_dc_noc,
 	[SLAVE_GEM_NOC_CFG] = &qhs_gemnoc,
@@ -1538,8 +1535,6 @@ static struct qcom_icc_node * const dc_noc_nodes[] = {
 static const struct qcom_icc_desc sm6350_dc_noc = {
 	.nodes = dc_noc_nodes,
 	.num_nodes = ARRAY_SIZE(dc_noc_nodes),
-	.bcms = dc_noc_bcms,
-	.num_bcms = ARRAY_SIZE(dc_noc_bcms),
 };
 
 static struct qcom_icc_bcm * const gem_noc_bcms[] = {
@@ -1600,9 +1595,6 @@ static const struct qcom_icc_desc sm6350_mmss_noc = {
 	.num_bcms = ARRAY_SIZE(mmss_noc_bcms),
 };
 
-static struct qcom_icc_bcm * const npu_noc_bcms[] = {
-};
-
 static struct qcom_icc_node * const npu_noc_nodes[] = {
 	[MASTER_NPU_SYS] = &amm_npu_sys,
 	[MASTER_NPU_NOC_CFG] = &qhm_npu_cfg,
@@ -1620,8 +1612,6 @@ static struct qcom_icc_node * const npu_noc_nodes[] = {
 static const struct qcom_icc_desc sm6350_npu_noc = {
 	.nodes = npu_noc_nodes,
 	.num_nodes = ARRAY_SIZE(npu_noc_nodes),
-	.bcms = npu_noc_bcms,
-	.num_bcms = ARRAY_SIZE(npu_noc_bcms),
 };
 
 static struct qcom_icc_bcm * const system_noc_bcms[] = {

-- 
2.51.2

