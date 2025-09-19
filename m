Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2EF2F3C32
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275963; cv=none; b=EHSsbmCXmRtOnjg8kn18F1l2WkaPYwoDjV0KHO+cK2IYYxaVRnOQozcydJrvndfVeT/ooxaAGwYRTyN97RsZSHXqjvTcmvDixGdUqKx4lpj3UhTtYHzokGzYuHVspBLm3DDEGD5/FatXsUtzfP/PhjmDjt49qOVQSL3mECcJGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275963; c=relaxed/simple;
	bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSxMQAYZmyo7kqJWebZ83iF4GayDQ62efRen7hOoG4reiK/gKbuwSRIDUE3c5vuyKGhUoTlvjWWlY1QJUMPtPsWNLIcJnoWOtKvKc791HUpDBjmdDRTvo2URyh9PIIRK9J8Pisg6QNAaWBqhk1GV6/mpZVMRJdKJa93JQGPaD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vEoqylhK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vEoqylhK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so2280406a12.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275959; x=1758880759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=vEoqylhK3QJazf5NhrcZZt3WNxESyRdy3QXc0hxN6SGRoaxH3SNzqSmBa1JyVyq0DP
         mko20UlB9PDTJ2eosrlbF3FymXdOxdz7pgZO0I4QmttIYO5EtDBK+gqXI78gEeHR4PVL
         +qqtU/jZ1m6y/wfLsfe6/I6PQc1bFKh0iym8MpzEcIal8PjyBuxTvBEz2qfNqxmtgMZw
         Te/QECiym/Nd1OGb2iqcgZGFuI2BYeZ3ptR1lfnzXWZ55qHsOddu9hBci4kh2nFy4cBn
         739fSdi4roOOUYk5NNtQvuyA9VhRtgBI+G3uXFldoiDbYH9++6a/EBPLs2L+klDpgvA5
         ZOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275959; x=1758880759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=Xm9DWoRmboUILPCnqpDiRdQNUic6lSThBV9gyiXCCdw0jT5GYOuNxCdyAWMbYdgj2z
         xwxdNKcL7LNZzzxJD+R+QLzuqemDj475nfrW0hzLHzzA3aZzWh4ZMhxTA2Mzv+F2BCZK
         GJ+d4/O/xXDn/V2Sp4iYCdqSjCAme6Wo52z5ND9RDAnClnrXwtEdcC9k1WR9iwLbr7Ou
         96baAeVadgr5lzDscuOrynqPPBjfAgBHAsQmCD+BDRsZYrLFdEyiFRT1MdpBd9exGH8u
         pljm9cJUtiEfCAqWWbpokmGe/NuVtJrbAPy+lMwk2KG2gcyJW5ESm6VCb0Coe+ybKhc5
         xu2w==
X-Forwarded-Encrypted: i=1; AJvYcCVbO3AEbTOVHL5mM6LTPqSBI66v5hb5APsna96GzdAS0qQqUuUZACNdal3Xk34kF+TouNdx4t0KYvotTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWdDCXfEwnQURc2JtpujMR6cpaD8K+dpRhtxoPptFiUgHTb2MA
	Y2QjB+UjiP8+f/eEuAkG52n4kVjioNakPRLlhRT5236wkE+xJ+rxNS5Py1CvdHhH+Ks=
X-Gm-Gg: ASbGncuByq5S7nlAMQEN7Qd5JcaK/HF4tDUpN+n8OqbdYD+zhzAd1BnOjBG033GCHow
	8ErmLPPM5ItwXuufIgL/vtooBhGinyid2o35cWDTr7HyWE0oz0JRk1AcQxcOpzQsjPHnNL2UAW3
	zyY8e+wuSnKl2eJACZjscszg2ScbbME1uluxQF9OesuFLfBA46O99mqv7y4N8DIgMFB277vC254
	QE/uWsABapYNVjc9qkNt5wj/ZRebNTKKtvaeCqo87HyIWHHEbzmSTdF8iizPM3Sne7efHTEmfiC
	pa58E7Dew/fs1EkgVIHS/q0mr4ZM1aWAoOehBR2/PFXS6Mrqo4JUJuHoJRINXX4B/yUQEKh7C8u
	VKI6bjwcOZfUxm+ppJNnGQfH/6xr0VjehCsjCrK2nlIbkbZqjZq5XuiIOY4PETDoNd3t+HA==
X-Google-Smtp-Source: AGHT+IGcg73bZYLri35zpeSxGcbf84lNjzcJ9lVXYFxYS+H77YE64UdSEUtkMOObdzMncpDcwGV+LA==
X-Received: by 2002:a05:6402:4590:b0:62f:af:60a0 with SMTP id 4fb4d7f45d1cf-62fc0ae770fmr2120994a12.28.1758275959086;
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:23 +0200
Subject: [PATCH 1/3] dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE &
 MDSS_RSCC resets
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
 b=9VFYR0Pqu1iH5ar5ZlAGzd8yitkjjLnajYHWb6JRqnUWIorerIbWE+NyUoFK9xsMG83xD7v2s
 JFGROYBycauB8OiG9vpOylV18dL8CshQCYTm9MAqYN8hlrRs+EK1Eh+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the indexes for two resets inside the dispcc on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm6350.h b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
index cb54aae2723e8f20ff3eebde3e15e862be750712..61426a80e620ac795b6f0ccda173654d7e47e59d 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm6350.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
@@ -42,6 +42,10 @@
 #define DISP_CC_SLEEP_CLK			31
 #define DISP_CC_XO_CLK				32
 
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
 /* GDSCs */
 #define MDSS_GDSC				0
 

-- 
2.51.0

