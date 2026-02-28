Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42B301460
	for <phone-devel@vger.kernel.org>; Sat, 28 Feb 2026 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311665; cv=none; b=oKZKt91KV2SuTAzRfkrhf0ijZvgJSduUpmaFkegznMZVd1BU9klKQWM7BG9iEldubZDtEI64YB0L292teni5G4aMMebbHMb5IFkDLdCNlEBockTsqAJGrIlWWyBqB0Ufasb5S3SjuDqmJcW7L1EW0Hf0AddyfXllxGZANYMZipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311665; c=relaxed/simple;
	bh=6XdLF9JTJRWCKGHMMMV7qKvxDe5yc3EsPTrCvvgF8cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5M3vAb6JsA3zygOQ3+fQ/SyzDJQHcSKrTGMlRVeLzYhA5+UkNx0sJby0MY09xvJHK/cS+PI9ztj90kM9BHGnv97PcGfKI2RY+I6pAHp71oT8DoiCG2IE/9uaZwXwFpXIKmHKTefvDzVHRWlzmX+BBj17ifteHzhdo7ZyS3byHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Vb0z5Y6K; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Vb0z5Y6K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0i1+OkKQaK2cithGqyj/94PMbbQBAN7UMU6yAQl/SDo=;
	b=Vb0z5Y6KHkj0Jq4zsLTbkk45Dvg6la7YRbRCByaMs9P91C+fnnNRxC6neaW7pMZxDbbrN2
	sCtOD4OMd/7djQkwtPWEU2HZwIksH54xc9nh9vH9cPsWWNb4SVDUT+QRQsV/9NEJYvPPKW
	FXwjhgH/j9yHvyPpWrg4a+S2l5U8F8WWG9WoMtEumr9JIQc8RAAoGY83/iTRbl0aqZ5sDJ
	G/HLiK802JbJHAxgRGEcfniWSiZbyutNyWMxBzp+ubAg1ttAGAz7wxCFlvaEcQP5aN0VDz
	O4qa5Bc5hIdqyB7ESq1FTSVVYNin4XqejzmsSZHYlUl4+io2FOhMPAVSKxe++w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
Date: Sat, 28 Feb 2026 17:41:31 -0300
Message-ID: <20260228204638.11705-6-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To make sure the display subsystem starts in a predictable state, we
need to reset it. Otherwise, unpredictable issues can happen, e.g.
on the motorola-guamp smartphone DSI would not transmit anything.

Wire up the reset to fix.

Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e9336adbc391..3a9a1ad8d581 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1864,6 +1864,8 @@ mdss: display-subsystem@5e00000 {
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.52.0

