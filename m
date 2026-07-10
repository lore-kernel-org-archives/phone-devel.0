Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532B3CB8EF
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677313; cv=none; b=OHGqcrbuedN2X/zVqUXQbuLnTLntJ6DcbP2BYhtJ8kolFwr/AAF6UZMcjmoOKpbqtS8/LxIU6hqz523sjsmlqdYETqckGiKw+ysEOdn1F8arXzDPrGNPbHUKC9Cvk/l+qDAXc4DfRhzUxoLp0FRxIdZXWLeey2p6qTV0k1c0Kyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677313; c=relaxed/simple;
	bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ALGDRJ/XJLLUrwkGgW7oY6vNfYTMcBCouZn5qE0AsJfXqk+r6H7WgAzr2HyZagaOrpfYFVaz2Y7LU4W0i+aMaF76slVUWXM9GedpaKZraKRZPvR1K646XFCIhhFI74WLIqfkTRqmf7c3WF3XmG67UT6OZ4oqt41ZQYsq1I/W4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oJ1OwsRU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oJ1OwsRU"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69531108f25so1167917a12.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783677309; x=1784282109; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=oJ1OwsRUV46RFfdUQBdY1bFjrXlxV/DcYyafzidK7UlvZnEUC9TMJKqmwLy6iV7Ho9
         I8jflLJjnC7mVyIVQOQCfATIQTjzTXg+vXQ32O0p8afiYWzBEhoVgUL+KPspRGRbjtVf
         J6LOYQ+EXSZX0UcX8bTmjar5497jKhtWAqelMi8Ns5MU5j8ZsKWDHhCJ6mPh5iAZxCN5
         g/Fnc3kSa3+N777cSRfm+vuUIWVXQpH3/FJg3Txb238wZk+3FhZa0bqk5mQlnngA1BXF
         E8WIjMSlfRBGExVgQZuPT36FZ+1M4nYHNBXvMulV0dRGyqBKir6FR0xNqZShjYGraxjE
         +rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677309; x=1784282109;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Au4v6cU7MBsP2sPvCvHMdLpV1qE/Ythj9i6e9ev27jE=;
        b=AU66or0/s4JaZOzQ+vft7oVEb/rYr/1TmbOVxkV/Qv8ditfdNeMf9U2esV/V6X9HBI
         ZLw7gz2Do+NUh7+eafhmgJqXdrR4dEi554Dm3UXBuPB29vLSLfe9NhzCqXTB8MRnBR95
         aFZuLAPSzh1Qwvdfu+KtaUGMlzSuWYz4UlZv+/JUy0bD5tkv/gX+2cwJbdisSGPJjTVw
         TZT7T2rPJxGewZ6GpICE03tNmZMyVemDSUZamwL4DQxi7fU05BjciIhYnBspFy0DEzaa
         MlHw4RG7t0M6jGM/HC7j3r1ILCl9EJCGbI6O6zBwudielV+ujboohiTE98YQRRK7f6bD
         W4FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRWgm9n397AxQJBvEXEGl1sElH5N4vO3Ri7LYedqXs+y01/ElbuWrztUBl0fDk0GYiqM3AFKOBcgyU4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/yf9V355sN2AOOoCGvGd/Wlb9/v7sgSkrX40WJ3PXBxOtA2A
	fFSxX0wIbH0qnp1nmlNB9fbXrhwltE7m4khnjFNribGtDfGvBxFyfXIPzQmXCihtv/I=
X-Gm-Gg: AfdE7clquSGEDv/S0ML+POE8lWIYI6VvUZfXoya2nol2qXQGMnZvPwL0Tfdngj0Z4UQ
	pP1/+vnYBQa4JNC1wZrpzPvm34JDCaneOofMTZGjPGEQg/Mx9Oc9PWY/FxJ6mseCLZrNVQM+WW5
	BU/iGtaG1LKKkR6PHjSeZg+fcnrDC9KUslfSHWRFgOrkXEtxv5EpNbGbSPvCApOCXV87Fd0C4Cg
	A/4rgPaaAcX/jbtfoM2haInem/dI+26bFXnorLVODXtiU3Hsjp8hDKwX6ERUQ7o2nKuCAUdW69v
	RGB2fCSbKikkLCPOMdikFTIpWzquFKzs4X5NfC75fzOpKF3mTCkhLs+VM0A4yA6Wnj/EgGhdcDJ
	xEy09QAk6jQlvrCxRcWJT1r1d5LT/xLVC+ubKNQGkqkLkesG02Ji3pg2SYV0jgcaFKOPYSYdXI/
	e3GB/wgdG5+qoCJCU2RUHW1HmMpOPsSe5u4+Y1cZ4Fey49ckIAHYfvnyOCmrh0bhGLpjE=
X-Received: by 2002:a17:907:a2cb:b0:c06:f67e:ed9 with SMTP id a640c23a62f3a-c15ce06fb21mr479808066b.10.1783677309069;
        Fri, 10 Jul 2026 02:55:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm502892966b.29.2026.07.10.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:55:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:53:57 +0200
Subject: [PATCH] arm64: dts: qcom: milos: Add reset for sdhc_2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-sdhc2-reset-v1-1-c7a155a517ba@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDuQBEylVyld1PG3TmlVMiqCe
 Hdju/wW721kSAqjW7FRwqKmQ5/hLwVJ9+xfYG2yKbgQ3dU7/upnMLamk8AJhokrRO9jKVLWFeV
 uTGh1/T3vj79trt+Q6RzRvh/v8YP/dQAAAA==
X-Change-ID: 20260710-milos-sdhc2-reset-8e61165cc5b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783677308; l=848;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PYaQlk7YAPrQ041M/bvdqcr1+tAUHuw1nB/hxRtlWPQ=;
 b=tBUxYIBAa0gg6mhoBBDXd7hHoXWxfEi7SSUfj8X/YkiBcJKxuJwdW6iSBv023QxwCayIGFH8I
 dmYEDZooJ8cDoA9dMOQgOhPC9SQ2bLu2B8Nr3kg6izhXLzS9N4BAP88
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the missing reset (BCR) for sdhc_2.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c9232988953..262fa8801256 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1724,6 +1724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x540 0>;
 
+			resets = <&gcc GCC_SDCC2_BCR>;
+
 			bus-width = <4>;
 
 			qcom,dll-config = <0x0007442c>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260710-milos-sdhc2-reset-8e61165cc5b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

