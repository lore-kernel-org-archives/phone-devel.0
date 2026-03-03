Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E98A2737E3;
	Tue,  3 Mar 2026 03:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509782; cv=none; b=vEr93jsHpK+osQ+KeZ8jmxF9YnhZsMhXnXJEm6GjG29GSmRacYfRR2kzvKqlABd5Bz0o22dj9CY080pEky4YaDE15KR7Adg+15Ql7ybHfVNbFBAwUwhgqpcjVMaYm2ZIpRfVJWZaaqBILEm++JCUEz8E6qieaU1dopGYGmJUQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509782; c=relaxed/simple;
	bh=6XdLF9JTJRWCKGHMMMV7qKvxDe5yc3EsPTrCvvgF8cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrmlfdMswTEfl6loiyJBfVx9il5SE75fgQ1bBf5SPRERt0Zc4P2PfX6tbNHyrGBpNNLD6IUwurS1VHghnK+ARyYCR49OUk44JnslsYrcW1l585TRFhDWvp5TtPcrFTOkvt1LkW9bQQDcTa6FYKB0kV7KNugqa5M1UHhuzfATqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Ka6Fp41m; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Ka6Fp41m"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0i1+OkKQaK2cithGqyj/94PMbbQBAN7UMU6yAQl/SDo=;
	b=Ka6Fp41mwfpSRUTGZDriy6FIzzgbilDRsL+YJh7jUOfVID9K0vj0xG/kjbzqJYt7LfYzNL
	3FpNSkIHRUrZkdoNLZ3AgXrjzHeeV8vqwpc0FSjpgc+x1HpP6BXQ2wES2VVUhQ8LgRKpKk
	zPJA4muRXNRX9swGyP0fuY214IrXZ41EyDm/Cr3dWq+8b5qOQ8CmRfw79q3ZPp3Jucb2HV
	pqoMSw6em6jCz+l2eWdufA4Fx92TO0zT9Gdp6xpjNO0uqM9Tb0dY3cpquoU9eW0w1Sbf5o
	NEGPKsv1RrzzLOTqQ0SVo9qaSStFgneYoDQO0hRdvQ/gTIWWM++Eb9HqtsF6mg==
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
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
Date: Tue,  3 Mar 2026 00:41:24 -0300
Message-ID: <20260303034847.13870-6-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
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

